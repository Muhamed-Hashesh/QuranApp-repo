import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_project/views/every_types_screen/models/all_media_model.dart';
import 'package:quran_project/views/every_types_screen/services/all_media_services.dart';

import 'all_media_state.dart';

class AllMediaCubit extends Cubit<AllMediaState> {
  AllMediaCubit() : super(AllMediaInitial());

  AllMediaModel allMediaModel = AllMediaModel();

  Future<void> getData({required String media}) async {
    try {
      emit(AllMediaLoading());
      final data = await AllMediaServices().getAllMedia(media: media);
      if (data != null) {
        allMediaModel = AllMediaModel.fromJson(data);
        log(allMediaModel.data![0].title.toString());
        emit(AllMediaDataLoaded(allMediaModel: allMediaModel));
      } else {
        emit(AllMediaDataError());
      }
    } on DioException catch (e) {
      emit(AllMediaDataError(error: e.message));
    } catch (e) {
      emit(AllMediaDataError(error: e.toString()));
    }
  }
}
