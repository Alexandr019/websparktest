import 'package:websparktest/features/shortest_path/domain/entities/point_entity.dart';

class PointModel {
  const PointModel({required this.x, required this.y});

  factory PointModel.fromJson(Map<String, dynamic> json) {
    return PointModel(x: json['x'] as int, y: json['y'] as int);
  }

  final int x;
  final int y;

  PointEntity toEntity() => PointEntity(x, y);
}
