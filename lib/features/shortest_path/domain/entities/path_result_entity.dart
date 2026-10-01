import 'package:equatable/equatable.dart';
import 'package:websparktest/features/shortest_path/domain/entities/cell_type.dart';
import 'package:websparktest/features/shortest_path/domain/entities/map_entity.dart';
import 'package:websparktest/features/shortest_path/domain/entities/point_entity.dart';

class PathResultEntity extends Equatable {
  const PathResultEntity({required this.map, required this.steps});

  final MapEntity map;
  final List<PointEntity> steps;

  String get pathString => steps.join('->');

  List<List<CellType>> buildCells() {
    final path = steps.toSet();
    return [
      for (var y = 0; y < map.height; y++) [for (var x = 0; x < map.width; x++) _cellTypeAt(PointEntity(x, y), path)],
    ];
  }

  CellType _cellTypeAt(PointEntity point, Set<PointEntity> path) {
    if (point == map.start) return CellType.start;
    if (point == map.end) return CellType.end;
    if (map.isBlocked(point)) return CellType.blocked;
    if (path.contains(point)) return CellType.path;
    return CellType.empty;
  }

  @override
  List<Object> get props => [map, steps];
}
