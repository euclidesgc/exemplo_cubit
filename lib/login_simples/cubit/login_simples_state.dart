part of 'login_simples_cubit.dart';

enum Status {
  initial,
  loading,
  success,
  error,
}

class LoginSimplesState {
  final Status submitStatus;
  final Status formStatus;
  final String? email;
  final String? emailErrorText;
  final String? password;
  final String? passwordErrorText;
  final bool passwordIsVisible;

  LoginSimplesState({
    this.submitStatus = Status.initial,
    this.formStatus = Status.initial,
    this.email,
    this.emailErrorText,
    this.password,
    this.passwordErrorText,
    this.passwordIsVisible = false,
  });

  LoginSimplesState copyWith({
    Status? submitStatus,
    Status? formStatus,
    String? email,
    String? emailErrorText,
    String? password,
    String? passwordErrorText,
    bool? passwordIsVisible,
  }) {
    return LoginSimplesState(
      submitStatus: submitStatus ?? this.submitStatus,
      formStatus: formStatus ?? this.formStatus,
      email: email ?? this.email,
      emailErrorText: emailErrorText,
      password: password ?? this.password,
      passwordErrorText: passwordErrorText,
      passwordIsVisible: passwordIsVisible ?? this.passwordIsVisible,
    );
  }
}
