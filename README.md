# SmolGU Flutter

Учебный проект по курсу Stepik «iOS, Android или кроссплатформенность? Основы Dart».

## Структура
- `dart_basics/` - примеры из уроков 1.2-1.6 (переменные, функции, ООП, коллекции, async)
- `lib/` - Flutter-приложение (уроки 1.7-1.9): счётчик, форма регистрации, вход через Firebase Auth

## Запуск
```bash
flutter pub get
dart run dart_basics/02_variables.dart   # примеры на Dart
flutter run                              # приложение
```

## Firebase
```bash
dart pub global activate flutterfire_cli
flutterfire configure
```
Включите Email/Password в Firebase Console -> Authentication -> Sign-in method.
# Flutter-vsk2-Ros2
