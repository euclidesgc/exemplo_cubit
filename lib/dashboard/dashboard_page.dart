import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, '/exemplo_builder');
              },
              child: const Text('Exemplo Builder'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, '/exemplo_listenner');
              },
              child: const Text('Exemplo Listenner'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, '/exemplo_consumer');
              },
              child: const Text('Exemplo Consumer'),
            ),
            FilledButton(
              onPressed: () => Navigator.pushNamed(context, '/login_complexo'),
              child: const Text('Tela de Login (complexa)'),
            ),
            FilledButton(
              onPressed: () => Navigator.pushNamed(context, '/login_simples'),
              child: const Text('Tela de Login (simplificada)'),
            ),
          ],
        ),
      ),
    );
  }
}
