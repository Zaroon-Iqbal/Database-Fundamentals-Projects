
--Select the title of all films that have at least one showing in the IMAX format. [Be wary of duplicates!]
 
select distinct title
from showings
inner join films f on showings.film_id = f.film_id
where format_id = (select format_id
from formats
where name = 'IMAX');
 
--Select the name of all theaters that have no showings in the IMAX format.
 
select name
from theaters
where theater_id not in (
   select r.theater_id from theaters
inner join rooms r on theaters.theater_id = r.theater_id
inner join showings s on r.room_id = s.room_id
where format_id = (select format_id
from formats
where name = 'IMAX')
   );
 
--Select the name of all rooms that do not have any seats with the "accessible seating" label.
 
select title
from rooms
where room_id not in (select room_id
from seats
inner join seat_seatlabels l on seats.seat_id = l.seat_id
inner join seatlabels sL on l.seat_label_id = sL.seat_label_id
where sl.name = 'accessible seating');
 
--Select the primary key of the showing that has brought in the most income: the sum of the price of every ticket sold for that showing.
 
select showings.showing_id
from showings
inner join tickets t on showings.showing_id = t.showing_id
group by showings.showing_id
having sum(price) = (select sum(price)
from showings
inner join tickets t on showings.showing_id = t.showing_id
group by t.showing_id
order by sum(price) desc
limit 1);
 
 
--Count the number of "short", "average", and "long" films. A short film is under 90 minutes;
-- an average film is between 90 and 120 minutes; a long film is over 120 minutes.
 
select length, count(*)
from (select title, case
       when duration < 90 then 'short'
       when duration < 120 then 'average'
       else 'long'
       end as length
from films) as temp
group by length;