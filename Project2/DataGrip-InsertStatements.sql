
insert into project2.film_genres (genre_id, film_id)
values  (1, 1),
       (2, 1),
       (3, 1);

insert into project2.films (film_id, title, duration, releasedate, rating_id)
values  (1, 'Wakanda Forever', 161, '2022-11-10', 1),
       (2, 'End Game', 130, '2018-09-01', 3),
       (3, 'Avengers', 100, '2017-08-02', 2);

insert into project2.formats (format_id, name)
values  (1, 'Standard'),
       (2, 'IMAX');

insert into project2.genres (genre_id, name)
values  (1, 'Action'),
       (2, 'Adventure'),
       (3, 'Superhero'),
       (4, 'Horror'),
       (5, 'Thriller');

insert into project2.ratings (rating_id, name)
values  (1, 'PG-13'),
       (2, 'NR'),
       (3, 'PG');

insert into project2.room_formats (room_id, format_id)
values  (1, 1),
       (1, 2),
       (3, 2);




insert into project2.rooms (room_id, title, capacity, theater_id)
values  (1, 'Screen 1', 5, 1),
       (2, 'Screen 2', 10, 1),
       (3, 'Screen 3', 4, 1),
       (4, 'Screen 4', 7, 2),
       (5, 'Screen 5', 3, 2);

insert into project2.seat_seatlabels (seat_id, seat_label_id)
values  (1, 1),
       (2, 1),
       (3, 1),
       (4, 1),
       (5, 2),
       (5, 3),
       (6, 1);

insert into project2.seatlabels (seat_label_id, name)
values  (1, 'reclining'),
       (2, 'accessible seating'),
       (3, 'non-reclining');

insert into project2.seats (seat_id, name, room_id)
values  (1, 'Seat 1', 1),
       (2, 'Seat 2', 1),
       (3, 'Seat 3', 1),
       (4, 'Seat 4', 1),
       (5, 'Seat 5', 1),
       (6, 'Seat 6', 2);

insert into project2.showings (showing_id, showtime, room_id, film_id, format_id)
values  (1, '2022-11-10 15:45:00.000000', 1, 1, 1),
       (2, '2022-11-10 19:00:00.000000', 1, 1, 2),
       (3, '2022-11-10 18:00:00.000000', 3, 2, 1),
       (4, '2022-11-10 20:00:00.000000', 1, 3, 2),
       (5, '2022-11-10 13:00:00.000000', 4, 2, 1);

insert into project2.theaters (theater_id, name, address, city, state, zipcode)
values  (1, 'Regal Edwards Long Beach', '7501 E Carson St', 'Long Beach', 'CA', '90808'),
       (2, 'Century', '1701 W Katella Ave', 'Anaheim', 'CA', '92867');

insert into project2.tickets (seat_id, showing_id, number, price)
values  (1, 1, 1, 18),
       (1, 2, 2, 22),
       (5, 2, 3, 15);
