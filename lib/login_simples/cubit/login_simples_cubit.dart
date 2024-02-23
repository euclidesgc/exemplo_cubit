import 'package:bloc/bloc.dart';

part 'login_simples_state.dart';

class LoginSimplesCubit extends Cubit<LoginSimplesState> {
  LoginSimplesCubit() : super(LoginSimplesState());

  Future<void> submitForm(String login, String password) async {
    try {
      emit(state.copyWith(submitStatus: Status.loading));

      await Future.delayed(const Duration(seconds: 3));
      if (password == 'erro') {
        throw Exception();
      }

      if (login == 'euclides.catunda@gmail.com' && password == 'admin') {
        emit(state.copyWith(submitStatus: Status.success));
      } else {
        emit(state.copyWith(submitStatus: Status.error));
      }
    } catch (e) {
      emit(state.copyWith(submitStatus: Status.error));
    }
  }

  void toggleVisibility() {
    emit(state.copyWith(passwordIsVisible: !state.passwordIsVisible));
  }

  void validateForm({String? login, String? password}) {
    emit(state.copyWith(formStatus: Status.initial));

    String? emailErrorText;
    String? passwordErrorText;

    if (login == null || login.isEmpty) {
      emailErrorText = 'Informe o email antes de continuar';
    } else {
      final RegExp regex = RegExp(
        r'^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{1,4}$',
      );

      final emailIsValid = regex.hasMatch(login);

      if (emailIsValid) {
        emailErrorText = null;
      } else {
        emailErrorText = 'Email inválido!';
      }
    }

    if (password == null || password.isEmpty || password.length < 3) {
      passwordErrorText = 'Informe a senha antes de continuar';
    } else {
      passwordErrorText = null;
    }

    emit(
      state.copyWith(
        emailErrorText: emailErrorText,
        passwordErrorText: passwordErrorText,
      ),
    );
  }

  void reset() {
    emit(state.copyWith(
      submitStatus: Status.initial,
      formStatus: Status.initial,
      email: null,
      emailErrorText: null,
      password: null,
      passwordErrorText: null,
      passwordIsVisible: false,
    ));
  }
}
