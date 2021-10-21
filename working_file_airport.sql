-- 1. Вывести имена всех когда-либо обслуживаемых пассажиров авиакомпаний
select name from passenger;
-- 2. Вывести названия всеx авиакомпаний
select name from company;
-- 3. Вывести все рейсы, совершенные из Москвы
select * from trip where town_from = 'Moscow';
-- 4. Вывести имена людей, которые заканчиваются на "man"
select * from passenger where name like '%man';
-- 5. Вывести количество рейсов, совершенных на TU-134 
select count(plane) AS count from trip where plane = 'TU-134';
-- 6. Какие компании совершали перелеты на Boeing
select distinct name from company join trip on trip.company = company.id where trip.plane = 'Boeing';
-- 7. Вывести все названия самолётов, на которых можно улететь в Москву (Moscow)
select distinct plane from trip where town_to = 'Moscow';
-- 8. В какие города можно улететь из Парижа (Paris) и сколько времени это займёт?
select town_to, subtime(time_in, time_out) as flitght_time from trip where town_from = 'Paris';