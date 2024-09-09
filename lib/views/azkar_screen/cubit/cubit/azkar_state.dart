part of 'azkar_cubit.dart';

@immutable
sealed class AzkarState {}

final class AzkarInitial extends AzkarState {}

final class AzkarLoading extends AzkarState {}

final class AzkarLoaded extends AzkarState {
  final List<AzkarModel> azkar;
  AzkarLoaded(this.azkar);
}

final class AzkarError extends AzkarState {
  final String message;

  AzkarError(this.message);
}
