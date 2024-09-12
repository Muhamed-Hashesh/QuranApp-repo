import 'package:quran_project/views/ahadith_screen/Data/ahadith_api/hadith_api.dart';
import 'package:quran_project/views/ahadith_screen/Data/models/hadith_model.dart';

class HadithRepo {
  final HadithApi hadithApi;

  HadithRepo({required this.hadithApi});

  Future<List<HadithModel>> getAhadith(String type) async {
    final response = await hadithApi.getAhadith(type: type);
    return response.map((e) => HadithModel.fromJson(e)).toList();
  }
}
