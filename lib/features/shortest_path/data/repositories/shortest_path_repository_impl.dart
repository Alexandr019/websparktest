import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:websparktest/core/error/api_exceptions.dart';
import 'package:websparktest/core/error/failure.dart';
import 'package:websparktest/features/shortest_path/data/models/maps_response_model.dart';
import 'package:websparktest/features/shortest_path/data/models/path_result_model.dart';
import 'package:websparktest/features/shortest_path/data/models/send_response_model.dart';
import 'package:websparktest/features/shortest_path/domain/entities/map_entity.dart';
import 'package:websparktest/features/shortest_path/domain/entities/path_result_entity.dart';
import 'package:websparktest/features/shortest_path/domain/repositories/shortest_path_repository.dart';

@LazySingleton(as: ShortestPathRepository)
class ShortestPathRepositoryImpl implements ShortestPathRepository {
  const ShortestPathRepositoryImpl(this._dio);

  final Dio _dio;

  static const _invalidResponse = Failure('Server returned an invalid response.');

  @override
  Future<List<MapEntity>> fetchMaps(String baseUrl) => _guard(() async {
    final response = await _dio.get<dynamic>(baseUrl.trim());
    final body = MapsResponseModel.fromJson(_asJson(response));
    if (body.error) throw Failure(body.message);

    return body.data.map((map) => map.toEntity()).toList(growable: false);
  });

  @override
  Future<void> sendResults(String baseUrl, List<PathResultEntity> results) => _guard(() async {
    final response = await _dio.post<dynamic>(
      baseUrl.trim(),
      data: [for (final result in results) PathResultModel.fromEntity(result).toJson()],
    );
    final body = SendResponseModel.fromJson(_asJson(response));
    if (body.error) throw Failure(body.message);
  });

  Map<String, dynamic> _asJson(Response<dynamic> response) {
    final data = response.data;
    if (data is Map<String, dynamic>) return data;
    throw _invalidResponse;
  }

  Future<T> _guard<T>(Future<T> Function() action) async {
    try {
      return await action();
    } on ApiException catch (error) {
      throw Failure(error.userMessage);
    } on DioException catch (error) {
      throw Failure(BaseApiException.parse(error).userMessage);
    } on FormatException {
      throw _invalidResponse;
    } on TypeError {
      throw _invalidResponse;
    }
  }
}
