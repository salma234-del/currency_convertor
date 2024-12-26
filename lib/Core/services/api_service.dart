import 'package:currency/Core/utils/api_constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();

  Future<Response> get({required String endPoint}) async {
    try {
      return await dio.get(ApiConstants.baseUrl + endPoint);
    } catch (e) {
      rethrow;
    }
  }
}
