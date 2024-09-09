import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:quran/views/azkar_screen/Data/azkar_repo/azkar_repo.dart';
import 'package:quran/views/azkar_screen/Data/models/azkar_model.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  final AzkarRepo azkarRepo;
  AzkarCubit(this.azkarRepo) : super(AzkarInitial());

  Future<void> getAzkar() async {
    emit(AzkarLoading());
    try {
      final azkar_model = await azkarRepo.getAzkar();
      emit(AzkarLoaded(azkar_model));
    } on DioException catch (e) {
      emit(AzkarError(e.toString()));
    }
  }
}
