part of 'login_complexo_cubit.dart';

@immutable
sealed class LoginComplexoState {}

final class LoginInitial extends LoginComplexoState {}

final class LoginLoading extends LoginComplexoState {}

final class LoginSuccess extends LoginComplexoState {}

final class LoginFailure extends LoginComplexoState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}

final class LoginFormFieldsError extends LoginComplexoState {
  final String? loginErrormessage;
  final String? passordErrormessage;

  LoginFormFieldsError({
    required this.loginErrormessage,
    required this.passordErrormessage,
  });
}

final class TogglePasswordVisibility extends LoginComplexoState {}
