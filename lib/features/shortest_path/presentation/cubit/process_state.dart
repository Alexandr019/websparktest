import 'package:equatable/equatable.dart';
import 'package:websparktest/features/shortest_path/domain/entities/path_result_entity.dart';

sealed class ProcessState extends Equatable {
  const ProcessState();

  double get progress => 0;

  @override
  List<Object?> get props => [];
}

final class ProcessInitial extends ProcessState {
  const ProcessInitial();
}

final class ProcessLoading extends ProcessState {
  const ProcessLoading();
}

final class ProcessFailure extends ProcessState {
  const ProcessFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

final class ProcessCalculating extends ProcessState {
  const ProcessCalculating(this.progress);

  @override
  final double progress;

  @override
  List<Object?> get props => [progress];
}

sealed class ProcessResultsState extends ProcessState {
  const ProcessResultsState(this.results);

  final List<PathResultEntity> results;

  @override
  double get progress => 1;

  @override
  List<Object?> get props => [results];
}

final class ProcessCalculated extends ProcessResultsState {
  const ProcessCalculated(super.results);
}

final class ProcessSending extends ProcessResultsState {
  const ProcessSending(super.results);
}

final class ProcessSendFailure extends ProcessResultsState {
  const ProcessSendFailure(super.results, this.message);

  final String message;

  @override
  List<Object?> get props => [...super.props, message];
}

final class ProcessSent extends ProcessResultsState {
  const ProcessSent(super.results);
}
