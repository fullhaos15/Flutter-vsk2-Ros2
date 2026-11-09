import 'package:flutter/material.dart';

import '../services/auth_service.dart';

/// Урок 1.7: первое приложение (счётчик + StatefulWidget).
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная'),
        actions: [
          IconButton(
            tooltip: 'Выйти',
            icon: const Icon(Icons.logout),
            onPressed: _auth.signOut,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Привет, ${user?.displayName ?? user?.email ?? 'гость'}!',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 24),
            const Text('Вы нажали кнопку столько раз:'),
            Text('$_counter', style: Theme.of(context).textTheme.displayMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _counter++),
        child: const Icon(Icons.add),
      ),
    );
  }
}
