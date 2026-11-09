// Урок 1.6: асинхронное программирование
Future<String> fetchUser() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'Пользователь загружен';
}

Future<void> failing() async {
  await Future.delayed(const Duration(milliseconds: 300));
  throw Exception('Ошибка сети');
}

Stream<int> countStream(int to) async* {
  for (var i = 1; i <= to; i++) {
    await Future.delayed(const Duration(milliseconds: 300));
    yield i;
  }
}

Future<void> main() async {
  print('Старт');
  print(await fetchUser());

  try {
    await failing();
  } catch (e) {
    print('Поймали: $e');
  } finally {
    print('finally выполнен');
  }

  // Параллельное выполнение
  final results = await Future.wait([fetchUser(), fetchUser()]);
  print(results.length);

  await for (final n in countStream(3)) {
    print('Stream: $n');
  }
  print('Конец');
}
