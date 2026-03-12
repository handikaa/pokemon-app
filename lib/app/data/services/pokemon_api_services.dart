import 'package:dio/dio.dart';

import '../../core/constant/api_constants.dart';
import '../../core/network/dio_client.dart';

class PokemonApiService {
  Future<Response<dynamic>> getPokemonList({
    required int offset,
    required int limit,
  }) {
    return DioClient.getRequest(
      endpoint: ApiConstants.pokemon,
      queryParameters: {'offset': offset, 'limit': limit},
    );
  }

  Future<Response<dynamic>> getPokemonDetail({required String name}) {
    return DioClient.getRequest(endpoint: '${ApiConstants.pokemon}/$name');
  }
}
