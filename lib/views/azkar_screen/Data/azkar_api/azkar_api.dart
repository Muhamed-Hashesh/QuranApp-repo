import 'dart:developer';

import 'package:dio/dio.dart';

class AzkarApi {
  late Dio dio;
  AzkarApi() {
    dio = Dio();
  }

  Future<List<dynamic>> getAzkar() async {
    try {
      final response =
          await dio.get('https://www.hisnmuslim.com/api/ar/27.json');
      return response.data['أذكار الصباح والمساء'];
    } on DioException catch (e) {
      log(e.toString());
      log("A7a");
      return [];
    }
  }
}
