part of 'change_scene_cubit.dart';

@immutable
sealed class ChangeSceneState {}

final class ChangeSceneInitial extends ChangeSceneState {}

final class ChangeSceneChangedToList extends ChangeSceneState {}

final class ChangeSceneChangedToQuranPage extends ChangeSceneState {}
