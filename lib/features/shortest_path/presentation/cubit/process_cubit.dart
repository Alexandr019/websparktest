import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:websparktest/core/error/failure.dart';
import 'package:websparktest/features/shortest_path/domain/repositories/shortest_path_repository.dart';
import 'package:websparktest/features/shortest_path/domain/usecases/calculate_paths.dart';
import 'package:websparktest/features/shortest_path/presentation/cubit/process_state.dart';

@injectable
class ProcessCubit extends Cubit<ProcessState> {
  ProcessCubit(this._repository, this._calculatePaths, @factoryParam this._baseUrl) : super(const ProcessInitial());

  final ShortestPathRepository _repository;
  final CalculatePaths _calculatePaths;
  final String _baseUrl;

  Future<void> init() async {
    emit(const ProcessLoading());
    try {
      final maps = await _repository.fetchMaps(_baseUrl);
      await for (final progress in _calculatePaths(maps)) {
        if (isClosed) return;
        emit(progress.isDone ? ProcessCalculated(progress.results) : ProcessCalculating(progress.fraction));
      }
    } on Failure catch (error) {
      if (!isClosed) emit(ProcessFailure(error.message));
    }
  }

  Future<void> sendResults() async {
    final results = switch (state) {
      ProcessCalculated(:final results) || ProcessSendFailure(:final results) || ProcessSent(:final results) => results,
      _ => null,
    };
    if (results == null) return;

    emit(ProcessSending(results));
    try {
      await _repository.sendResults(_baseUrl, results);
      if (!isClosed) emit(ProcessSent(results));
    } on Failure catch (error) {
      if (!isClosed) emit(ProcessSendFailure(results, error.message));
    }
  }
}
