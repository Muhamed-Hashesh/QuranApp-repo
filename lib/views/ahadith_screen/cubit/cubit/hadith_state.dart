part of 'hadith_cubit.dart';

@immutable
sealed class HadithState {}

final class HadithInitial extends HadithState {}

final class HadithLoading extends HadithState {}

final class HadithLoaded extends HadithState {
  final List<HadithModel> hadith;
  HadithLoaded(this.hadith);
}

final class HadithError extends HadithState {
  final String message;

  HadithError(this.message);
}
