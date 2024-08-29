import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio=Dio();
  final String _baseUrl='https://api.stripe.com/';

  Future<Response> post({required String endPoint ,required String token,required Map data,String? contentType}) async {
    var response = await _dio.post('$_baseUrl$endPoint',data: data,options:Options(
      contentType:contentType ,
      headers:{'Authorization':'Bearer $token'}

    ) );
    return response;
  }
}
