import 'package:exemplo_cubit/exemplo_builder/cubit/my_builder_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBuilderPage extends StatefulWidget {
  final MyBuilderCubit cubit;

  const MyBuilderPage({
    super.key,
    required this.cubit,
  });

  @override
  State<MyBuilderPage> createState() => _MyBuilderPageState();
}

class _MyBuilderPageState extends State<MyBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo Builder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<MyBuilderCubit, MyBuilderState>(
                bloc: widget.cubit,
                builder: (context, state) {
                  if (state is MyBuilderLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is MyBuilderSuccess) {
                    return const Text('Sucesso, dados enviados!');
                  } else if (state is MyBuilderError) {
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
      ),
    );
  }
}
