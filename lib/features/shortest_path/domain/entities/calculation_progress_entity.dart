import 'package:equatable/equatable.dart';
import 'package:websparktest/features/shortest_path/domain/entities/path_result_entity.dart';

class CalculationProgressEntity extends Equatable {
  const CalculationProgressEntity({required this.completed, required this.total, required this.results});

  final int completed;
  final int total;
  final List<PathResultEntity> results;

  double get fraction => total == 0 ? 1 : completed / total;

  bool get isDone => completed >= total;

  @override
  List<Object> get props => [completed, total, results];
}
