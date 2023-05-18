import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/core/rest_client/dio/dio_client.dart';
import 'package:pokedex/app/core/rest_client/rest_client_exception.dart';

import '../mocks/client_spy.dart';

void main() {
  late DioClient sut;
  late ClientSpy client;
  late String url;

  setUp(() {
    client = ClientSpy();
    sut = DioClient(client);
    url = faker.internet.httpUrl();
  });

  group('get', () {
    test('Should return data if get returns 200', () async {
      final response = await sut.get(url);

      expect(response, {'any_key': 'any_value'});
    });

    test('Should return BadRequestException if get returns 400', () async {
      client.mockGetDioError(400);

      final future = sut.get(url);

      expect(future, throwsA(RestClientException.badRequest));
    });

    test('Should return ForbiddenException if get returns 403', () async {
      client.mockGetDioError(403);

      final future = sut.get(url);

      expect(future, throwsA(RestClientException.forbidden));
    });

    test('Should return NotFoundException if get returns 404', () async {
      client.mockGetDioError(404);

      final future = sut.get(url);

      expect(future, throwsA(RestClientException.notFound));
    });

    test('Should return ServerException if get returns 500', () async {
      client.mockGetDioError(500);

      final future = sut.get(url);

      expect(future, throwsA(RestClientException.serverError));
    });

    test('Should return ServerException if get throws', () async {
      client.mockGetDioError(null);

      final future = sut.get(url);

      expect(future, throwsA(RestClientException.serverError));
    });
  });
}
