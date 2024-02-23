import 'package:exemplo_cubit/login_complexo/cubit/login_complexo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginComplexoPage extends StatefulWidget {
  final LoginComplexoCubit cubit;

  const LoginComplexoPage({super.key, required this.cubit});

  @override
  State<LoginComplexoPage> createState() => _LoginComplexoPageState();
}

class _LoginComplexoPageState extends State<LoginComplexoPage> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Complexo')),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                const Text(
                  'Beleza App',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 60),
                BlocListener<LoginComplexoCubit, LoginComplexoState>(
                  bloc: widget.cubit,
                  listener: (context, state) {
                    if (state is TogglePasswordVisibility) {
                      _obscureText = !_obscureText;
                      return;
                    }
                    if (state is LoginSuccess) {
                      Navigator.pushNamed(context, '/home');
                    } else if (state is LoginFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Erro ao efetuar login'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Form(
                    onChanged: () => widget.cubit.validateForm(
                      login: emailEC.text,
                      password: passwordEC.text,
                    ),
                    child: Column(
                      children: [
                        BlocBuilder<LoginComplexoCubit, LoginComplexoState>(
                          bloc: widget.cubit,
                          builder: (context, state) {
                            String? errorText;

                            if (state is LoginFormFieldsError) {
                              errorText = state.loginErrormessage;
                            }

                            return TextFormField(
                              controller: emailEC,
                              onChanged: (value) {
                                widget.cubit.validateForm(
                                    login: value, password: passwordEC.text);
                              },
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: const OutlineInputBorder(),
                                errorText: errorText,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        BlocBuilder<LoginComplexoCubit, LoginComplexoState>(
                          bloc: widget.cubit,
                          builder: (context, state) {
                            String? errorText;

                            if (state is LoginFormFieldsError) {
                              errorText = state.passordErrormessage;
                            }

                            return TextFormField(
                              controller: passwordEC,
                              obscureText: _obscureText,
                              onChanged: (value) => widget.cubit.validateForm(
                                login: emailEC.text,
                                password: value,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Senha',
                                suffixIcon: IconButton(
                                  onPressed: () =>
                                      widget.cubit.toggleVisibility(),
                                  icon: _obscureText
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                ),
                                border: const OutlineInputBorder(),
                                errorText: errorText,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 32),
                        BlocBuilder<LoginComplexoCubit, LoginComplexoState>(
                          bloc: widget.cubit,
                          builder: (context, state) {
                            if (state is LoginLoading) {
                              return const CircularProgressIndicator();
                            }

                            return SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                child: const Text('Entrar'),
                                onPressed: () {
                                  widget.cubit.submitForm(
                                    emailEC.text,
                                    passwordEC.text,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
