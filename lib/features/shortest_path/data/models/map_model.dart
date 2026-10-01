import 'package:websparktest/features/shortest_path/data/models/point_model.dart';
import 'package:websparktest/features/shortest_path/domain/entities/map_entity.dart';

class MapModel {
  const MapModel({required this.id, required this.field, required this.start, required this.end});

  factory MapModel.fromJson(Map<String, dynamic> json) {
    return MapModel(
      id: json['id'] as String,
      field: (json['field'] as List<dynamic>).cast<String>(),
      start: PointModel.fromJson(json['start'] as Map<String, dynamic>),
      end: PointModel.fromJson(json['end'] as Map<String, dynamic>),
    );
  }

  final String id;
  final List<String> field;
  final PointModel start;
  final PointModel end;

  MapEntity toEntity() => MapEntity(id: id, field: field, start: start.toEntity(), end: end.toEntity());
}
