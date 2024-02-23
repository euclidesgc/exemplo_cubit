part of 'my_builder_cubit.dart';

@immutable
sealed class MyBuilderState {}

final class MyBuilderInitial extends MyBuilderState {}

final class MyBuilderLoading extends MyBuilderState {}

final class MyBuilderSuccess extends MyBuilderState {}

final class MyBuilderError extends MyBuilderState {
  final String? message;

  MyBuilderError([this.message]);
}
