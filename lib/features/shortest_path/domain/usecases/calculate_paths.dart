import 'package:injectable/injectable.dart';
import 'package:websparktest/features/shortest_path/domain/services/path_finder.dart';
import 'package:websparktest/features/shortest_path/domain/entities/map_entity.dart';
import 'package:websparktest/features/shortest_path/domain/entities/path_result_entity.dart';
import 'package:websparktest/features/shortest_path/domain/entities/calculation_progress_entity.dart';

@injectable
class CalculatePaths {
  const CalculatePaths(this._pathFinder);

  final PathFinder _pathFinder;

  Stream<CalculationProgressEntity> call(List<MapEntity> maps) async* {
    final results = <PathResultEntity>[];
    yield CalculationProgressEntity(completed: 0, total: maps.length, results: const []);

    for (final map in maps) {
      await Future<void>.delayed(Duration.zero);
      results.add(PathResultEntity(map: map, steps: _pathFinder.findPath(map)));
      yield CalculationProgressEntity(
        completed: results.length,
        total: maps.length,
        results: List.unmodifiable(results),
      );
    }
  }
}
