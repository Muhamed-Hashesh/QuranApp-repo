import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:quran_project/views/quran_screen/pages/quran_page.dart';
import 'package:quran_project/views/quran_screen/pages/surah_details_screen.dart';

part 'change_scene_state.dart';

class ChangeSceneCubit extends Cubit<ChangeSceneState> {
  ChangeSceneCubit() : super(ChangeSceneInitial());

  void changeSceneToList() {
    Get.offAll(() => const SurahListScreen());
    emit(ChangeSceneChangedToList());
  }

  void changeSceneToPage({required int surahNumber}) {
    Get.to(() => SurahDetailScreen(surahNumber: surahNumber));
    emit(ChangeSceneChangedToQuranPage());
  }
}
