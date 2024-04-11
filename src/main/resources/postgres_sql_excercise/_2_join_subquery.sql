/*
  https://pgexercises.com/questions/joins/simplejoin2.html
 */
 --How can you produce a list of the start times for bookings by members named 'David Farrell'?
SELECT starttime FROM cd.bookings
                            JOIN cd.members ON cd.bookings.memid = cd.members.memid
WHERE cd.members.firstname = 'David'
  AND cd.members.surname = 'Farrell';

/*
 How can you output a list of all members who have recommended another member?
 Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).
 */
SELECT DISTINCT recommender.firstname, recommender.surname FROM cd.members as member
          JOIN cd.members as recommender ON member.recommendedby = recommender.memid
ORDER BY surname, firstname;

/*
 How can you output a list of all members, including the individual who recommended them (if any)?
 Ensure that results are ordered by (surname, firstname).
 */
SELECT
      member.firstname AS memfname, member.surname AS memsname,
      recommender.firstname AS recfname, recommender.surname  recsname
FROM cd.members  member
           LEFT JOIN cd.members AS recommender ON member.recommendedby = recommender.memid
ORDER BY memsname, memfname;

/*
 https://pgexercises.com/questions/joins/threejoin.html
 */