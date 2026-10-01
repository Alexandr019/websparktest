import 'package:websparktest/features/shortest_path/domain/entities/map_entity.dart';
import 'package:websparktest/features/shortest_path/domain/entities/point_entity.dart';

abstract interface class PathFinder {
  List<PointEntity> findPath(MapEntity map);
}
