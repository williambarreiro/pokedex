import 'package:dio/dio.dart';
import 'package:pokedex/app/core/rest_client/rest_client.dart';
import 'package:pokedex/app/core/rest_client/rest_client_exception.dart';

class DioClient implements RestClient {
  final Dio _client;

  DioClient(this._client);

  @override
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _client.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioError catch (e) {
      _throwRestClientException(e);
    }
  }

  Never _throwRestClientException(DioError dioError) {
    switch (dioError.response?.statusCode) {
      case 400:
        throw RestClientException.badRequest;
      case 403:
        throw RestClientException.forbidden;
      case 404:
        throw RestClientException.notFound;
      default:
        throw RestClientException.serverError;
    }
  }
}
