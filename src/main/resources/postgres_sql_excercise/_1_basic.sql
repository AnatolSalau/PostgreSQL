--https://pgexercises.com/questions/basic/where3.html
--How can you produce a list of all facilities with the word 'Tennis' in their name?
 SELECT * FROM cd.facilities
      WHERE name like '%Tennis%';

/*
 How can you produce a list of facilities, with each labelled as 'cheap' or 'expensive'
 depending on if their monthly maintenance cost is more than $100?
 Return the name and monthly maintenance of the facilities in question.
 */
SELECT name,
       CASE WHEN monthlymaintenance > 100 THEN 'expensive'
            ELSE 'cheap'
             END
             AS cost
FROM cd.facilities;

/**
Select month from timestamp
 */
SELECT EXTRACT(month FROM '2022-01-01 12:34:56'::timestamp) AS month;

/**
  SQL Query to Get the Month from a Date in PostgreSQL
 */

SELECT EXTRACT(month FROM date_column) AS month FROM table_name;

/**
  How can you produce a list of members who joined after the start of September 2012?
  Return the memid, surname, firstname, and joindate of the members in question.
 */
SELECT memid, surname, firstname, joindate FROM cd.members
WHERE
      (EXTRACT(month FROM joindate) >= 9)
  AND
      (EXTRACT(year FROM joindate) >= 2012);

/**
  How can you produce an ordered list of the first 10 surnames in the members table?
  The list must not contain duplicates.
 */
SELECT DISTINCT surname FROM cd.members
ORDER BY surname
LIMIT 10;

/**
  https://pgexercises.com/questions/basic/union.html
  Combining results from multiple queries
  Question
  You, for some reason, want a combined list of all surnames and all facility names.
  Yes, this is a contrived example :-). Produce that list!
 */

SELECT surname AS surname FROM cd.members
UNION
SELECT name AS surname FROM cd.facilities;

/*
 You'd like to get the first and last name of the last member(s) who signed up - not just the date. How can you do that?
 */

SELECT firstname, surname, joindate FROM cd.members
WHERE joindate IN (SELECT MAX(joindate) FROM cd.members )

select firstname, surname, joindate
from cd.members
order by joindate desc
limit 1;


/*
 Use the date function:

select date(timestamp_field) from table
From a character field representation to a date you can use:

select date(substring('2011/05/26 09:00:00' from 1 for 10));
Test code:

create table test_table (timestamp_field timestamp);
insert into test_table (timestamp_field) values(current_timestamp);
select timestamp_field, date(timestamp_field) from test_table;
 */
select date(timestamp_field) from table

/*
 How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'?
 Return a list of start time and facility name pairings, ordered by the time.
 */
SELECT starttime as start, name
FROM cd.bookings
           JOIN cd.facilities ON cd.bookings.facid = cd.facilities.facid
WHERE
            name like ('%Tennis Court%')
  AND
            date(starttime) = '2012-09-21'
ORDER BY starttime;

--https://pgexercises.com/questions/joins/self.html

