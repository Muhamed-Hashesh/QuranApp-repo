part of 'sebha_cubit.dart';

@immutable
sealed class SebhaState {}

final class SebhaInitial extends SebhaState {}

final class SebhaTextChanged extends SebhaState {}

final class SebhaIncrease extends SebhaState {}
