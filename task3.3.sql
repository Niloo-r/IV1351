SELECT instructor.instuctor_id, instructor.name, COUNT(*) AS given_lessons
FROM lesson
INNER JOIN instructor ON instructor.instuctor_id = lesson.instuctor_id
WHERE EXTRACT(MONTH FROM date) = EXTRACT(MONTH FROM CURRENT_DATE)
GROUP BY instructor.instuctor_id
HAVING COUNT(*) FILTER (WHERE EXTRACT(MONTH FROM date) = EXTRACT(MONTH FROM CURRENT_DATE))>2
ORDER BY COUNT(*) DESC; 