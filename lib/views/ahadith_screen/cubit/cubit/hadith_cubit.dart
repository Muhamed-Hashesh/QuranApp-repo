import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:quran_project/views/ahadith_screen/Data/ahadith_repo/hadith_repo.dart';
import 'package:quran_project/views/ahadith_screen/Data/models/hadith_model.dart';

part 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  final HadithRepo hadithRepo;
  HadithCubit(this.hadithRepo) : super(HadithInitial());

  Future<void> getAhadith(String type) async {
    emit(HadithLoading());
    try {
      final hadithModel = await hadithRepo.getAhadith(type);
      emit(HadithLoaded(hadithModel));
    } on DioException catch (e) {
      emit(HadithError(e.toString()));
    }
  }
}
