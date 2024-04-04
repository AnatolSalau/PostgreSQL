/*
  https://pgexercises.com/questions/joins/simplejoin2.html
 */
 --How can you produce a list of the start times for bookings by members named 'David Farrell'?
SELECT starttime FROM cd.bookings
                            JOIN cd.members ON cd.bookings.memid = cd.members.memid
WHERE cd.members.firstname = 'David'
  AND cd.members.surname = 'Farrell';