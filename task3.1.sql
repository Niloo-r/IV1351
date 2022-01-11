
-- Quereis for getting total number of lessons per month. For running this part of code and get the right output 
--the other part of code (line 11 to 16) should be commented out. 
SELECT EXTRACT(MONTH FROM lesson.date) AS MONTH, COUNT(*) AS lesson
FROM lesson
WHERE EXTRACT(YEAR FROM lesson.date) = '2021'
GROUP BY EXTRACT(MONTH FROM lesson.date);



--Queries for getting total number for each type of lesson. (This part should be commented out if running the whole code.) 
SELECT EXTRACT(MONTH FROM lesson.date) AS month, price.lesson_type, COUNT(*) AS lesson
FROM lesson
INNER JOIN price ON price.price_id = lesson.price_id_0
WHERE EXTRACT(YEAR FROM lesson.date) = '2021'
GROUP BY EXTRACT (MONTH FROM lesson.date),price.lesson_type;