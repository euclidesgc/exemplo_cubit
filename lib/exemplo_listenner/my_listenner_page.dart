import 'package:exemplo_cubit/exemplo_listenner/cubit/my_listenner_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyListennerPage extends StatefulWidget {
  final MyListennerCubit cubit;

  const MyListennerPage({
    super.key,
    required this.cubit,
  });

  @override
  State<MyListennerPage> createState() => _MyListennerPageState();
}

class _MyListennerPageState extends State<MyListennerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo Listenner'),
      ),
      body: BlocListener<MyListennerCubit, MyListennerState>(
        bloc: widget.cubit,
        listener: (context, state) {
          if (state is MyListennerSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sucesso, dados enviados!'),
              ),
            );
          } else if (state is MyListennerError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Ops! Algo errado não está certo!'),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Click em Enviar dados!',
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () {
                    widget.cubit.submitForm();
                  },
                  child: const Text('Enviar dados!'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
