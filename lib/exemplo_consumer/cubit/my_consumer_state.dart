part of 'my_consumer_cubit.dart';

@immutable
sealed class MyConsumerState {}

final class MyConsumerInitial extends MyConsumerState {}

final class MyConsumerLoading extends MyConsumerState {}

final class MyConsumerSuccess extends MyConsumerState {}

final class MyConsumerError extends MyConsumerState {
  final String? message;

  MyConsumerError([this.message]);
}
