import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class ClientSpy extends Mock implements Dio {
  ClientSpy() {
    mockGet(200);
  }

  When mockGetCall() => when(
        () => get(
          any(),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'),
        ),
      );

  void mockGet(int status) => mockGetCall().thenAnswer(
        (_) async => Response(
          data: {"any_key": "any_value"},
          requestOptions: RequestOptions(path: ''),
          statusCode: status,
        ),
      );

  void mockGetDioError(int? status) => mockGetCall().thenThrow(
        DioError(
          requestOptions: RequestOptions(),
          response:
              Response(requestOptions: RequestOptions(), statusCode: status),
        ),
      );
}
