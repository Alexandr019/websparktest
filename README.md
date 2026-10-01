# WebSpark shortest path

Flutter-застосунок для завантаження карт з API, розрахунку найкоротшого
шляху для кожної карти, відправки результатів назад до API та перегляду
розрахованих шляхів на сітці.

## Можливості

- Введення та валідація HTTP/HTTPS URL API.
- Підтримка URL із GET-параметрами.
- Завантаження карт і відображення progress розрахунку.
- Пошук найкоротшого шляху за допомогою BFS із рухом у 8 напрямках.
- Відправка результатів зі станами завантаження, помилки та повторної спроби.
- Список результатів із переходом до окремого preview.
- Інтерактивний preview сітки з масштабуванням і переміщенням.
- Розділення на presentation, domain і data шари.

## Вимоги
- Flutter `3.47.5`
- Flutter SDK із Dart `3.13.4`.

## Запуск проєкту

```bash
flutter pub get
dart run build_runner build
flutter run
```

Команда `build_runner` генерує файли для реєстрації залежностей через
injectable та типізованих маршрутів GoRouter.

## Використання

1. Введіть повний endpoint API на Home screen.
2. Натисніть **Start counting process**.
3. Дочекайтеся завантаження карт і завершення розрахунку шляхів.
4. Після завершення розрахунку натисніть **Send results to server**.
5. Виберіть результат, щоб відкрити preview його сітки.

Для WebSpark API використовуйте:

```text
https://flutter.webspark.dev/flutter/api
```

Введений URL зберігається протягом поточного process flow і використовується
для GET-запиту та POST-запиту результатів. Після перезапуску застосунку URL
не зберігається.

## Архітектура

Функціональність побудована за шаровою структурою:

```text
presentation
  screens, views, widgets, Cubits, states
domain
  entities, repository contracts, path-finding service, use cases
data
  API models and repository implementation
```

## Робота з API

### Отримання карт

```text
GET <base-url>
```

Відповідь містить прапорець `error`, повідомлення та список карт із їхніми
полями, початковою і кінцевою точками.

### Відправка результатів

```text
POST <base-url>
```

Кожен результат серіалізується з ID карти, впорядкованими кроками шляху та
рядком шляху:

```json
{
  "id": "map-id",
  "result": {
    "steps": [
      { "x": "0", "y": "0" }
    ],
    "path": "(0,0)->(0,1)"
  }
}
```

## Структура проєкту

```text
lib/
  core/
    constants/
    di/
    error/
    network/
    router/
    theme/
    utils/
  features/shortest_path/
    data/
    domain/
    presentation/
```
