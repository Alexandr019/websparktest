import 'package:websparktest/features/shortest_path/domain/entities/path_result_entity.dart';
import 'package:websparktest/features/shortest_path/domain/entities/point_entity.dart';

class PathResultModel {
  const PathResultModel({required this.id, required this.steps, required this.path});

  factory PathResultModel.fromEntity(PathResultEntity entity) {
    return PathResultModel(id: entity.map.id, steps: entity.steps, path: entity.pathString);
  }

  final String id;
  final List<PointEntity> steps;
  final String path;

  Map<String, dynamic> toJson() => {
    'id': id,
    'result': {
      'steps': [
        for (final step in steps) {'x': step.x.toString(), 'y': step.y.toString()},
      ],
      'path': path,
    },
  };
}
