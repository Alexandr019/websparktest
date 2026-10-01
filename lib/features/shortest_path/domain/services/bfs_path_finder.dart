import 'dart:collection';

import 'package:injectable/injectable.dart';
import 'package:websparktest/features/shortest_path/domain/entities/map_entity.dart';
import 'package:websparktest/features/shortest_path/domain/entities/point_entity.dart';
import 'package:websparktest/features/shortest_path/domain/services/path_finder.dart';

@LazySingleton(as: PathFinder)
class BfsPathFinder implements PathFinder {
  const BfsPathFinder();

  static const List<(int, int)> _directions = [(-1, -1), (0, -1), (1, -1), (-1, 0), (1, 0), (-1, 1), (0, 1), (1, 1)];

  @override
  List<PointEntity> findPath(MapEntity map) {
    final cameFrom = <PointEntity, PointEntity?>{map.start: null};
    final queue = Queue<PointEntity>()..add(map.start);

    while (queue.isNotEmpty) {
      final current = queue.removeFirst();
      if (current == map.end) return _restore(cameFrom, current);

      for (final (dx, dy) in _directions) {
        final next = PointEntity(current.x + dx, current.y + dy);
        if (!map.isInside(next) || map.isBlocked(next) || cameFrom.containsKey(next)) {
          continue;
        }
        cameFrom[next] = current;
        queue.add(next);
      }
    }
    return const [];
  }

  List<PointEntity> _restore(Map<PointEntity, PointEntity?> cameFrom, PointEntity end) {
    final path = <PointEntity>[];
    PointEntity? step = end;
    while (step != null) {
      path.add(step);
      step = cameFrom[step];
    }
    return path.reversed.toList(growable: false);
  }
}
