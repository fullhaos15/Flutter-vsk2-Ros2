// Урок 1.4: объектно-ориентированное программирование
abstract class Animal {
  final String name;
  Animal(this.name);

  void speak(); // абстрактный метод

  @override
  String toString() => 'Animal($name)';
}

mixin Swimmer {
  void swim() => print('Плывёт');
}

class Dog extends Animal {
  Dog(super.name);

  @override
  void speak() => print('$name: Гав!');
}

class Duck extends Animal with Swimmer {
  Duck(super.name);

  @override
  void speak() => print('$name: Кря!');
}

class BankAccount {
  double _balance = 0; // приватное поле

  double get balance => _balance;

  void deposit(double amount) {
    if (amount <= 0) throw ArgumentError('Сумма должна быть > 0');
    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount > _balance) throw StateError('Недостаточно средств');
    _balance -= amount;
  }
}

class Point {
  final int x, y;
  const Point(this.x, this.y);
  Point.origin() : x = 0, y = 0; // именованный конструктор

  Point operator +(Point o) => Point(x + o.x, y + o.y);

  @override
  String toString() => '($x, $y)';
}

void main() {
  final animals = <Animal>[Dog('Бобик'), Duck('Дональд')];
  for (final a in animals) {
    a.speak();
  }
  (animals[1] as Duck).swim();

  final acc = BankAccount();
  acc.deposit(100);
  acc.withdraw(30);
  print('Баланс: ${acc.balance}');

  print(const Point(1, 2) + Point.origin());
}
