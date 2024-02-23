import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_complexo_state.dart';

class LoginComplexoCubit extends Cubit<LoginComplexoState> {
  LoginComplexoCubit() : super(LoginInitial());

  Future<void> submitForm(String login, String password) async {
    try {
      emit(LoginLoading());

      await Future.delayed(const Duration(seconds: 3));
      if (password == 'erro') {
        throw Exception();
      }

      if (login == 'euclides.catunda@gmail.com' && password == 'admin') {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure('Email ou senha inválidos'));
      }
    } catch (e) {
      emit(LoginFailure('Erro ao realizar login!'));
    }
  }

  void toggleVisibility() {
    emit(TogglePasswordVisibility());
  }

  void validateForm({String? login, String? password}) {
    String? loginErrormessage;
    String? passwordErrormessage;

    if (login == null || login.isEmpty) {
      loginErrormessage = 'Informe o email antes de continuar';
    } else {
      final RegExp regex = RegExp(
        r'''^[a-zA-Z0-9.a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{1,4}$''',
      );

      final emailIsValid = regex.hasMatch(login);

      if (emailIsValid) {
        loginErrormessage = null;
      } else {
        loginErrormessage = 'Email inválido!';
      }
    }

    if (password == null || password.isEmpty || password.length < 3) {
      passwordErrormessage = 'Informe a senha antes de continuar';
    } else {
      passwordErrormessage = null;
    }

    emit(
      LoginFormFieldsError(
        loginErrormessage: loginErrormessage,
        passordErrormessage: passwordErrormessage,
      ),
    );
  }
}
