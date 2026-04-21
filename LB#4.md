# Лабораторна робота 4: Аналітичні SQL-запити (OLAP)

У ході роботи потрібно розглянути агрегатні функції, різні типи джоінів та підзапити

Навчитися створювати об'єднані запити на агрегацію для кількох таблиць, які об'єднують таблиці та створюють згрупований, агрегований вивід.


Використання агрегатних функцій, таких як COUNT, SUM, AVG, MIN та MAX:

COUNT(Кількість гравців в гільдіях):


<img width="923" height="288" alt="{97B4608A-742E-48DC-8697-8FF9C5692F37}" src="https://github.com/user-attachments/assets/2622504a-920e-431c-a32e-5af0ee7acc21" />


SUM(Загальна кількість предметів у кожного гравця):


<img width="651" height="544" alt="{B5C143D2-F8A2-4CE1-944C-79FE50079EFC}" src="https://github.com/user-attachments/assets/5389156f-0e02-4085-8a97-d30425fc4ac0" />



AVG(Середня кількість предметів на гравця):


<img width="556" height="404" alt="{32C0669D-7C74-4D18-870F-6C1C533D97F0}" src="https://github.com/user-attachments/assets/4eb14867-28fe-4773-818c-05ea49c2a657" />


MIN(мініамльний лвл персонажа):

<img width="686" height="286" alt="{8041A11D-7B9C-4593-8FFB-3FDBE9BC9C18}" src="https://github.com/user-attachments/assets/bd8336ed-e81f-461d-97be-43224bf53b17" />



MAX(Найдорожчий предмет у грі):

<img width="568" height="257" alt="{71CFDE6A-E9C9-42A0-A99D-48043869828A}" src="https://github.com/user-attachments/assets/0023db3f-7612-45b2-a766-4dd02807d92f" />


---------

Використання різних типів джоінів (LEFT JOIN, RIGHT JOIN, FULL JOIN, CROSS JOIN):

INNER JOIN(Тільки зв’язані дані):


<img width="616" height="427" alt="{A08AFA57-20AB-4D77-9E0E-D6804CE7EC7B}" src="https://github.com/user-attachments/assets/2ad9a4b9-a590-4cfa-bdb5-1d0e6261373a" />


INNER JOIN(Інвентар гравця):


<img width="662" height="590" alt="{A27C6CE0-E3A2-4E8D-A30A-F09D6D4BF049}" src="https://github.com/user-attachments/assets/8a3a9dd2-987d-4e1f-bf9d-2105ed087141" />


LEFT JOIN(Всі істоти):


<img width="825" height="610" alt="{23A7494B-260F-4336-A002-BC8C32A0D93E}" src="https://github.com/user-attachments/assets/b036b7d3-ec9c-4a60-b8fa-aeb3856698e8" />


RIGHT JOIN(Всі локації):


<img width="751" height="623" alt="{6511552A-FBFD-4D3A-811A-325404C6122E}" src="https://github.com/user-attachments/assets/2fff15b6-cb9b-4a4b-bcb4-d8e2034447a9" />


FULL JOIN(Всі істоти і локації):


<img width="791" height="628" alt="{0B9B35E8-ABCC-4263-9C52-986FA8E3301F}" src="https://github.com/user-attachments/assets/271e49b3-6aa4-4d0b-96db-915b3b1daf6f" />


CROSS JOIN(Перетин локацій та істот):


<img width="633" height="843" alt="{219E7AE9-CA36-42B3-A705-6DBD0645DDE4}" src="https://github.com/user-attachments/assets/ef257e30-ecff-40e9-a62e-0f1dfb869959" />


---------

Використання підзапитів (вибірка з підзапитом у SELECT, WHERE, або HAVING)


SELECT(Показати гравців, їх рівень та середній рівень всіх гравців):


<img width="1026" height="420" alt="{0FE4C7C6-63AD-4DD7-BCC8-81449FDF19B2}" src="https://github.com/user-attachments/assets/1fa1b78f-e913-49a4-a3f3-2e7185aef483" />



WHERE(Гравці, які вище середнього рівня):


<img width="717" height="390" alt="{AB1A56D6-4A05-4B92-9425-ED3FB49F781A}" src="https://github.com/user-attachments/assets/7ad7be47-5697-4269-ae46-38778577623e" />


HAVING and GROUP BY(Гільдії з кількістю гравців >= 2):


<img width="623" height="403" alt="{07B56421-1DEE-477B-B6EC-7168B098A43F}" src="https://github.com/user-attachments/assets/2c29ea0d-f0b5-465a-99ba-7240325ed888" />


HAVING and GROUP BY(Класи, де середній рівень вище загального):


<img width="531" height="421" alt="{57373658-1F57-4E95-8910-48F6B4BD71AB}" src="https://github.com/user-attachments/assets/7ad5726a-7c01-40a4-aa18-a434339a3350" />


У ході лабораторної роботи я поглибив свої знання з БД

Мною було створенно SQL-запити для виконання певних завдань

У ході роботи було розглянуто агрегатні функції, різні типи джоінів та підзапити

Перевірка їх виконання пройшла успішно
