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
select mems.firstname || ' ' || mems.surname as member,
       facs.name as facility,
       case
             when mems.memid = 0 then
                         bks.slots*facs.guestcost
             else
                         bks.slots*facs.membercost
             end as cost
from
      cd.members mems
            inner join cd.bookings bks
                       on mems.memid = bks.memid
            inner join cd.facilities facs
                       on bks.facid = facs.facid
where
            date(bks.starttime) >= '2012-09-14' and
            date(bks.starttime) < '2012-09-15' and (
            (mems.memid = 0 and bks.slots*facs.guestcost > 30) or
            (mems.memid != 0 and bks.slots*facs.membercost > 30)
      )
order by cost desc;

/*
 https://pgexercises.com/questions/joins/sub.html
 How can you output a list of all members, including the individual who recommended them (if any),
 without using any joins? Ensure that there are no duplicates in the list,
 and that each firstname + surname pairing is formatted as a column and ordered.
 */
SELECT DISTINCT
                  mem.firstname || ' ' || mem.surname AS member,
                  (SELECT rec.firstname || ' ' || rec.surname AS recommender FROM cd.members AS rec
                   WHERE mem.recommendedby = rec.memid
                  )
FROM cd.members AS mem
ORDER BY member

/*
      https://pgexercises.com/questions/joins/tjsub.html
      Produce a list of costly bookings, using a subquery
 */
select member, facility, cost FROM (
                                         select mems.firstname || ' ' || mems.surname as member,
                                                facs.name as facility,
                                                case
                                                      when mems.memid = 0 then
                                                                  bks.slots*facs.guestcost
                                                      else
                                                                  bks.slots*facs.membercost
                                                      end as cost
                                         from
                                               cd.members mems
                                                     inner join cd.bookings bks
                                                                on mems.memid = bks.memid
                                                     inner join cd.facilities facs
                                                                on bks.facid = facs.facid
                                         where
                                                     date(bks.starttime) >= '2012-09-14' and
                                                     date(bks.starttime) < '2012-09-15'
                                   ) AS bookings
WHERE cost > 30
order by cost desc;