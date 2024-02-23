part of 'my_listenner_cubit.dart';

@immutable
sealed class MyListennerState {}

final class MyListennerInitial extends MyListennerState {}

final class MyListennerLoading extends MyListennerState {}

final class MyListennerSuccess extends MyListennerState {}

final class MyListennerError extends MyListennerState {
  final String? message;

  MyListennerError([this.message]);
}
