-- Задание 2

-- 1. название и год выхода альбомов, вышедших в 2018 году;
SELECT name, productionyear FROM album
WHERE productionyear = 2018;

--2. название и продолжительность самого длительного трека;
SELECT name, duration FROM trek
ORDER BY duration desc 
LIMIT 1;

--3. название треков, продолжительность которых не менее 3,5 минуты;
SELECT name, duration FROM trek
WHERE duration >= '03:50:00';

--4. названия сборников, вышедших в период с 2018 по 2020 год включительно;
SELECT name, productionyear FROM playlist
WHERE productionyear BETWEEN 2018 AND 2020;

--5. исполнители, чье имя состоит из 1 слова
SELECT name FROM performer
WHERE name NOT LIKE '% %';

--6. название треков, которые содержат слово "мой"/"my"
SELECT name FROM trek
WHERE name LIKE '%my%' 
OR name LIKE '%My%'
OR name LIKE '%мой%'
OR name LIKE '%Мой%';


