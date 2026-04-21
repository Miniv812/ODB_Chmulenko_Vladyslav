# Лабораторна робота 6: Міграції схем за допомогою Prisma ORM

## Загальний опис проєкту
У межах роботи було розроблено реляційну базу даних з використанням PostgreSQL та ORM Prisma.

Система включає сутності для користувачів, гравців, квестів, предметів, гільдій, готелів, бронювань та пов’язаних ігрових механік.

Реалізація виконувалась поступово через Prisma Migrate.

---

## Migration 1: init_schema (ініціалізація структури)

### Опис
Створено базову структуру бази даних (initial schema).

### Зміни
Додано основні models:
- user
- player
- guild
- item
- quest
- hotel
- room
- reservation
- customers

### Результат
Сформовано базову реляційну структуру з primary keys та базовими зв’язками.

---

## Migration 2: add_relations (зв’язки між таблицями)

### Опис
Додано зв’язки між сутностями (relations), включно з many-to-many.

### Зміни
Створено join tables:
- player_item
- creature_item
- quest_guild
- quest_location
- creature_location
- killing
- award

Додано foreign key relationships між основними таблицями.

### Результат
База даних приведена до нормалізованого вигляду (3NF).

---

## Migration 3: fix_enums (стандартизація enum)

### Опис
Замінено текстові значення на типізовані enum для підвищення consistency.

### Зміни
Додано enum-и:
- user_status
- player_class
- reservations_status
- hotel_stars
- local_complexity
- local_size
- creature_types
- creature_types_damage

### Результат
Покращено типізацію та контроль допустимих значень.

---

## Migration 4: add_review_system (нова функціональність)

### Опис
Додано систему відгуків (review system).

### Зміни
- створено model: review
- додано relation:
  - item → review (one-to-many)

### Результат
Користувачі можуть залишати rating та comment для item.

---

## Migration 5: enhance_user_model (розширення user)

### Опис
Розширено модель користувача додатковими полями.

### Зміни
Додано:
- last_login (DateTime)
- is_active (Boolean)

### Результат
Можливість відстеження активності користувачів.

---

## Migration 6: add_reservation_price (розширення бронювань)

### Опис
Розширено систему reservation.

### Зміни
Додано поле:
- total_price (Decimal)

### Результат
Додано підтримку фінансових розрахунків у бронюваннях.

---

## Підсумковий результат

У результаті отримано повноцінну реляційну базу даних:

- 20+ tables (models)
- many-to-many relations
- enum-based type system
- normalized structure (3NF)
- бізнес-логіка (reviews, reservations, users)

---

## Використані технології
- PostgreSQL
- Prisma ORM (v7.7.0)
- Prisma Migrate
- Prisma Studio
- Node.js (Prisma Client)

---

## Перевірка роботи
Функціональність перевірена через:
- Prisma Studio (UI)
- Prisma Client queries
- test.js scripts

Усі relations та constraints працюють коректно.
