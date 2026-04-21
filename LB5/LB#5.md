# Лабораторна робота 5: Нормалізація бази даних

## 1. Загальний опис

У ході лабораторної роботи я нормалізував базу даних ігрової системи RPG.  
Проаналізовано перехід таблиць до 1НФ (першої нормальної форми), 2НФ (другої нормальної форми) та 3НФ (третьої нормальної форми), визначено функціональні залежності та покращено структуру схеми.

База даних містить основні сутності:
- користувач (user)
- гравець (player)
- гільдія (guild)
- предмет (item)
- істота (creature)
- локація (location)
- квест (quest)

та зв’язкові таблиці:
- player_item
- creature_item
- creature_location
- location_guild
- quest_location
- quest_guild
- killing
- award

---

# 2. Функціональні залежності

## 2.1 user
user_id → user_nickname, user_email, user_password, status, user_starting_date

## 2.2 player
player_id → player_name, player_characteristics, pclass, player_lvl, user_id, guild_id

## 2.3 guild
guild_id → guild_name, guild_description, guild_lvl, guild_date_start, guild_reputation

## 2.4 item
item_id → item_name, item_description, item_characteristics, item_cost, item_tradeable

## 2.5 creature
creature_id → creature_name, creature_description, creature_type, creature_characteristics, creature_type_damage

## 2.6 location
location_id → location_name, location_size, location_complexity, location_min_lvl

## 2.7 quest
quest_id → quest_name, quest_description, quest_complexity, quest_repeatable

## 2.8 player_item
(player_id, item_id) → quantity

## 2.9 creature_location
(creature_id, location_id) → spawn_time

---

# 3. Аналіз нормальних форм

# 3.1 Перша нормальна форма (1НФ)

## Вимоги:
- усі атрибути мають бути атомарними
- відсутність списків або повторюваних груп

## Аналіз:

Усі таблиці відповідають 1НФ, оскільки:
- немає полів зі списками значень
- всі значення атомарні (числа, текст, enum)
- зв’язки many-to-many винесені в окремі таблиці

---

# 3.2 Друга нормальна форма (2НФ)

## Вимоги:
- таблиця повинна бути у 1НФ
- відсутність часткових залежностей від складеного ключа

## Аналіз:

Зв’язкові таблиці мають складені ключі:
- player_item (player_id, item_id)
- creature_location (creature_id, location_id)
- location_guild (guild_id, location_id)
- quest_location
- quest_guild
- killing
- award

## Перевірка:

### player_item:
(player_id, item_id) → quantity

✔ quantity залежить від усього ключа  
✔ часткових залежностей немає  

---

# 3.3 Третя нормальна форма (3НФ)

## ВИмоги:
- таблиця повинна бути у 2НФ
- відсутність транзитивних залежностей

## Аналіз:

### user
Всі атрибути залежать тільки від user_id  
✔ 3НФ виконується

### player
Дані гільдії винесені в окрему таблицю  
✔ немає транзитивних залежностей

### guild
Всі поля залежать тільки від guild_id  
✔ 3НФ виконується

### item, creature, location, quest
Всі атрибути залежать тільки від первинного ключа  
✔ 3НФ виконується

### зв’язкові таблиці
містять тільки ключі та мінімальні атрибути  
✔ 3НФ виконується

---

# 4. Покращення структури

## 4.1 Винесення зв’язків many-to-many

Замість зберігання списків у полях, використано окремі таблиці:

- player_item (гравець ↔ предмет)
- creature_item (істота ↔ предмет)
- creature_location (істота ↔ локація)
- location_guild (гільдія ↔ локація)
- quest_location (квест ↔ локація)
- quest_guild (квест ↔ гільдія)
- killing (квест ↔ істота)
- award (квест ↔ предмет)

Це дозволяє:
- уникнути дублювання даних
- забезпечити цілісність
- легко масштабувати систему

---

# 5. Підсумкова схема (3НФ)

## Основні таблиці:
- user
- player
- guild
- item
- creature
- location
- quest

## Зв’язкові таблиці:
- player_item
- creature_item
- creature_location
- location_guild
- quest_location
- quest_guild
- killing
- award

---

# 6. Висновок

База даних приведена до третьої нормальної форми (3НФ).

Усі таблиці:
- мають атомарні значення
- не містять часткових залежностей
- не мають транзитивних залежностей

Це забезпечує:
- мінімізацію дублювання даних
- цілісність інформації
- масштабованість системи
- правильну роботу ігрової логіки

---






