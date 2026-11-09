// Урок 1.2: переменные, типы, управляющие конструкции
void main() {
  int age = 20;
  double height = 1.75;
  String name = 'Иван';
  bool isStudent = true;
  var city = 'Смоленск'; // тип выводится автоматически
  final DateTime now = DateTime.now(); // задаётся один раз во время выполнения
  const pi = 3.14159; // константа времени компиляции

  print('$name, $age лет, рост $height, город $city, студент: $isStudent');
  print('Сейчас: $now, pi = $pi');

  // Null safety
  String? nickname; // может быть null
  print(nickname ?? 'ника нет');
  nickname ??= 'ivan2026'; // присвоить, если null
  print(nickname);

  // Условия
  if (age >= 18) {
    print('Совершеннолетний');
  } else {
    print('Несовершеннолетний');
  }
  print(age >= 18 ? 'взрослый' : 'ребёнок');

  // Циклы
  for (var i = 1; i <= 3; i++) {
    print('for: $i');
  }
  var n = 3;
  while (n > 0) {
    print('while: $n');
    n--;
  }

  // switch
  switch (city) {
    case 'Смоленск':
      print('Родной город');
      break;
    default:
      print('Другой город');
  }
}
