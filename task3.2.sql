-- Queries for averege lessons in month for entire year. To run this code and get the roght output, the other part of the file
--(line 7 to 11) should be commented out. 
SELECT COUNT(*)/12 AS average
FROM lesson 
WHERE EXTRACT(YEAR FROM lesson.date) = '2021';

-- Queries for average of each type of lesson
SELECT price.lesson_type,  COUNT(*)/12 AS average
FROM lesson 
INNER JOIN price ON price.price_id = lesson.price_id_0
WHERE EXTRACT(YEAR FROM lesson.date) = '2021'
GROUP BY price.lesson_type;