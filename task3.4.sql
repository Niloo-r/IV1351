SELECT ensemble.genre_id, date, time, skill_level, bookings.booked,

CASE
	WHEN bookings.booked >= ensemble.maxnumber THEN 'FULLY BOOKED'
	WHEN bookings.booked = ensemble.maxnumber-2 THEN 'TWO SPOTS LEFT'
	WHEN bookings.booked = ensemble.maxnumber-1 THEN 'ONE SPOT LEFT'
	ELSE 'SPOTS AVAILABLE'
END spots 

FROM lesson
INNER JOIN ensemble ON lesson.lesson_id = ensemble.lesson_id_0 
INNER JOIN bookings ON lesson.lesson_id = bookings.lesson_id
WHERE EXTRACT(WEEK FROM date) = EXTRACT(WEEK FROM CURRENT_DATE+7)
ORDER BY genre_id, date;