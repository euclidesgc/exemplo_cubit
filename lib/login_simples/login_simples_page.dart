import 'package:exemplo_cubit/login_simples/cubit/login_simples_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginSimplesPage extends StatefulWidget {
  final LoginSimplesCubit cubit;

  const LoginSimplesPage({super.key, required this.cubit});

  @override
  State<LoginSimplesPage> createState() => _LoginSimplesPageState();
}

class _LoginSimplesPageState extends State<LoginSimplesPage> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    widget.cubit.reset();

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
      appBar: AppBar(title: const Text('Login Simples')),
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
                BlocListener<LoginSimplesCubit, LoginSimplesState>(
                  bloc: widget.cubit,
                  listener: (context, state) {
                    if (state.submitStatus == Status.success) {
                      Navigator.pushNamed(context, '/home');
                    }

                    if (state.submitStatus == Status.error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Erro ao realizar login!'),
                        ),
                      );
                      widget.cubit.reset();
                    }

                    if (state.passwordIsVisible != _obscureText) {
                      _obscureText = state.passwordIsVisible;
                    }
                  },
                  child: Form(
                    onChanged: () => widget.cubit.validateForm(
                      login: emailEC.text,
                      password: passwordEC.text,
                    ),
                    child: Column(
                      children: [
                        BlocBuilder<LoginSimplesCubit, LoginSimplesState>(
                          bloc: widget.cubit,
                          builder: (context, state) {
                            return TextFormField(
                              controller: emailEC,
                              onChanged: (value) {
                                widget.cubit.validateForm(
                                    login: value, password: passwordEC.text);
                              },
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: const OutlineInputBorder(),
                                errorText: state.emailErrorText,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        BlocBuilder<LoginSimplesCubit, LoginSimplesState>(
                          bloc: widget.cubit,
                          builder: (context, state) {
                            return TextFormField(
                              controller: passwordEC,
                              obscureText: state.passwordIsVisible,
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
                                errorText: state.passwordErrorText,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 32),
                        BlocBuilder<LoginSimplesCubit, LoginSimplesState>(
                          bloc: widget.cubit,
                          builder: (context, state) {
                            if (state.submitStatus == Status.loading) {
                              return const CircularProgressIndicator();
                            }

                            return SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                child: const Text('Entrar'),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
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
