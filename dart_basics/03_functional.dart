// Урок 1.3: функциональное программирование
int sum(int a, int b) => a + b; // стрелочная функция

// Именованные и необязательные параметры
String greet(String name, {String greeting = 'Привет', int? age}) {
  final ageText = age != null ? ' ($age)' : '';
  return '$greeting, $name$ageText!';
}

// Функция высшего порядка
int apply(int x, int Function(int) f) => f(x);

// Замыкание
Function counter() {
  var count = 0;
  return () => ++count;
}

void main() {
  print(sum(2, 3));
  print(greet('Аня', age: 19));
  print(apply(5, (x) => x * x));

  final next = counter();
  next();
  next();
  print('Счётчик: ${next()}'); // 3

  final numbers = [1, 2, 3, 4, 5, 6];
  print(numbers.map((e) => e * 2).toList());
  print(numbers.where((e) => e.isEven).toList());
  print(numbers.reduce((a, b) => a + b));
  print(numbers.fold<int>(0, (acc, e) => acc + e));
  print(numbers.any((e) => e > 5));
  print(numbers.every((e) => e > 0));
}
