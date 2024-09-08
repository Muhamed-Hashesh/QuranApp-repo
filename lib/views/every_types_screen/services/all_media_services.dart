import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:quran/views/every_types_screen/models/all_media_model.dart';

class AllMediaServices {
  final Dio dio = Dio();
  AllMediaModel allMediaModel = AllMediaModel();
  Future getAllMedia({required String media}) async {
    try {
      var response = await dio.get(
        'https://api3.islamhouse.com/v3/paV29H2gm56kvLPy/main/get-category-items/5366/$media/ar/ar/1/25/json',
      );
      allMediaModel = AllMediaModel.fromJson(response.data);
      // log(allMediaModel.data![0].title.toString());
      // log(response.data.toString());
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return 'error';
      }
    } on DioException catch (e) {
      log(e.toString());
    }
  }
}
