import 'package:websparktest/features/shortest_path/domain/entities/map_entity.dart';
import 'package:websparktest/features/shortest_path/domain/entities/path_result_entity.dart';

abstract interface class ShortestPathRepository {
  Future<List<MapEntity>> fetchMaps(String baseUrl);

  Future<void> sendResults(String baseUrl, List<PathResultEntity> results);
}
