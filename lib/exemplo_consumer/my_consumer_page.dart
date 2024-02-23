import 'package:exemplo_cubit/exemplo_consumer/cubit/my_consumer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyConsumerPage extends StatefulWidget {
  final MyConsumerCubit cubit;

  const MyConsumerPage({
    super.key,
    required this.cubit,
  });

  @override
  State<MyConsumerPage> createState() => _MyConsumerPageState();
}

class _MyConsumerPageState extends State<MyConsumerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo Consumer'),
      ),
      body: BlocConsumer<MyConsumerCubit, MyConsumerState>(
        bloc: widget.cubit,
        listener: (context, state) {
          if (state is MyConsumerSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sucesso, dados enviados!'),
              ),
            );
          } else if (state is MyConsumerError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Ops! Algo errado não está certo!'),
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<MyConsumerCubit, MyConsumerState>(
                    bloc: widget.cubit,
                    builder: (context, state) {
                      if (state is MyConsumerLoading) {
                        return const CircularProgressIndicator();
                      } else if (state is MyConsumerSuccess) {
                        return const Text('Sucesso, dados enviados!');
                      } else if (state is MyConsumerError) {
                        return const Text('Ops! Algo errado não está certo!');
                      }
                      return const Text('Click em Enviar dados!');
                    },
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
          );
        },
      ),
    );
  }
}
