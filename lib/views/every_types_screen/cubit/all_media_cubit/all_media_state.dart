import 'package:quran/views/every_types_screen/models/all_media_model.dart';

abstract class AllMediaState {}

class AllMediaInitial extends AllMediaState {}

class AllMediaLoading extends AllMediaState {}

class AllMediaDataLoaded extends AllMediaState {
  final AllMediaModel allMediaModel;

  AllMediaDataLoaded({required this.allMediaModel});
}

class AllMediaDataError extends AllMediaState {
  final String? error;

  AllMediaDataError({this.error});
}
