// Урок 1.5: структуры данных
void main() {
  // List
  final list = <int>[3, 1, 2];
  list.add(4);
  list.sort();
  print(list); // [1, 2, 3, 4]

  // Set - уникальные элементы
  final set = [1, 2, 2, 3].toSet();
  print(set); // {1, 2, 3}

  // Map
  final ages = <String, int>{'Аня': 19, 'Иван': 20};
  ages['Олег'] = 21;
  ages.forEach((k, v) => print('$k - $v'));
  print(ages.containsKey('Аня'));

  // Spread и collection if/for
  final more = [...list, 10, 11];
  final withFlag = [1, if (more.length > 3) 2, for (var i in [7, 8]) i * 2];
  print(more);
  print(withFlag);

  // Records (Dart 3)
  (String, int) person = ('Иван', 20);
  print('${person.$1}, ${person.$2}');

  // Деструктуризация
  final (name, age) = person;
  print('$name $age');
}
