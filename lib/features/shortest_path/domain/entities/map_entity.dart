import 'package:equatable/equatable.dart';
import 'package:websparktest/features/shortest_path/domain/entities/point_entity.dart';

class MapEntity extends Equatable {
  const MapEntity({required this.id, required this.field, required this.start, required this.end});

  final String id;
  final List<String> field;
  final PointEntity start;
  final PointEntity end;

  int get width => field.isEmpty ? 0 : field.first.length;

  int get height => field.length;

  bool isInside(PointEntity p) => p.y >= 0 && p.y < field.length && p.x >= 0 && p.x < field[p.y].length;

  bool isBlocked(PointEntity p) => !isInside(p) || field[p.y][p.x].toUpperCase() == 'X';

  @override
  List<Object> get props => [id, field, start, end];
}
