import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:quran/views/azkar_screen/Data/azkar_repo/azkar_repo.dart';
import 'package:quran/views/azkar_screen/Data/models/azkar_model.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  final AzkarRepo azkarRepo;

  AzkarCubit(this.azkarRepo) : super(AzkarInitial());

  Future<void> getAzkar(int id, String type) async {
    emit(AzkarLoading());
    try {
      final azkarModel = await azkarRepo.getAzkar(id, type);
      emit(AzkarLoaded(azkarModel));
    } on DioException catch (e) {
      emit(AzkarError(e.toString()));
    }
  }
}
