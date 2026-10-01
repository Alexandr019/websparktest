import 'package:websparktest/features/shortest_path/data/models/map_model.dart';

class MapsResponseModel {
  const MapsResponseModel({required this.error, required this.message, required this.data});

  final bool error;
  final String message;
  final List<MapModel> data;

  factory MapsResponseModel.fromJson(Map<String, dynamic> json) {
    final rawData = json['data'];
    return MapsResponseModel(
      error: json['error'] as bool,
      message: json['message'] as String,
      data: rawData is List
          ? rawData.map((item) => MapModel.fromJson(item as Map<String, dynamic>)).toList(growable: false)
          : const [],
    );
  }
}
