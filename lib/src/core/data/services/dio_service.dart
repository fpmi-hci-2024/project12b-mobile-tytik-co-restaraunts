import 'package:dio/dio.dart';

import '../../domain/services/i_dio_service.dart';

class DioService implements IDioService {
  final Dio _dio;

  DioService(this._dio);

  @override
  Future<Map<String, dynamic>> getRequest(String url) async {
    final response = await _dio.get('http://localhost:8000/$url');
    return response.data as Map<String, dynamic>;
  }
}
