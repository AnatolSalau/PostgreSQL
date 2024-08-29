--https://pgexercises.com/questions/aggregates/fachoursbymonth.html
SELECT book.facid, SUM(book.slots) AS "Total Slots"
FROM cd.bookings AS book
WHERE
        EXTRACT(MONTH FROM book.starttime) = 9 AND EXTRACT(YEAR FROM book.starttime) = 2012
GROUP BY book.facid
ORDER BY "Total Slots";

--https://pgexercises.com/questions/aggregates/countmembers.html
SELECT COUNT(memid) OVER(),
       CASE WHEN memid = 0 THEN 'GUEST' ELSE firstname  END AS firstname,
       CASE WHEN memid = 0 THEN 'GUEST' ELSE surname  END AS surname
FROM cd.members