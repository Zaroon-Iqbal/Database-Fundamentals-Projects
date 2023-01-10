

       create table project2.theaters
(
   theater_id serial
       constraint theaters_pk
           primary key,
   name       varchar(100) not null,
   address    varchar(100) not null,
   city       varchar(100) not null,
   state      varchar(2)   not null,
   zipcode    varchar(5)   not null
);
 
alter table project2.theaters
   owner to postgres;
 
create table project2.rooms
(
   room_id    serial
       constraint rooms_pk
           primary key,
   title      varchar(100) not null,
   capacity   integer      not null,
   theater_id integer      not null
       constraint rooms_theaters_null_fk
           references project2.theaters
);
 
alter table project2.rooms
   owner to postgres;
 
create table project2.seats
(
   seat_id serial
       constraint seats_pk
           primary key,
   name    varchar(100) not null,
   room_id integer      not null
       constraint seats_rooms_null_fk
           references project2.rooms
);
 
alter table project2.seats
   owner to postgres;
 
create table project2.formats
(
   format_id serial
       constraint formats_pk
           primary key,
   name      varchar(100) not null
);
 
alter table project2.formats
   owner to postgres;
 
create table project2.room_formats
(
   room_id   integer not null
       constraint room_formats_rooms_null_fk
           references project2.rooms,
   format_id integer not null
       constraint room_formats_formats_null_fk
           references project2.formats,
   constraint room_formats_pk
       primary key (room_id, format_id)
);
 
alter table project2.room_formats
   owner to postgres;
 
create table project2.seatlabels
(
   seat_label_id serial
       constraint seatlabels_pk
           primary key,
   name          varchar(100) not null
);
 
alter table project2.seatlabels
   owner to postgres;
 
create table project2.seat_seatlabels
(
   seat_id       integer not null
       constraint seat_seatlabels_seats_null_fk
           references project2.seats,
   seat_label_id integer not null
       constraint seat_seatlabels_seatlabels_null_fk
           references project2.seatlabels,
   constraint seat_seatlabels_pk
       primary key (seat_label_id, seat_id)
);
 
alter table project2.seat_seatlabels
   owner to postgres;
 
create table project2.ratings
(
   rating_id serial
       constraint ratings_pk
           primary key,
   name      varchar(100) not null
       constraint ratings_uk
           unique
);
 
alter table project2.ratings
   owner to postgres;
 
create table project2.films
(
   film_id     serial
       constraint films_pk
           primary key,
   title       varchar(100) not null,
   duration    integer      not null,
   releasedate date         not null,
   rating_id   integer      not null
       constraint films_ratings_null_fk
           references project2.ratings
);
 
alter table project2.films
   owner to postgres;
 
create table project2.genres
(
   genre_id serial
       constraint genres_pk
           primary key,
   name     varchar(100) not null
);
 
alter table project2.genres
   owner to postgres;
 
create table project2.film_genres
(
   genre_id integer not null
       constraint film_genres_genres_null_fk
           references project2.genres,
   film_id  integer not null
       constraint film_genres_films_null_fk
           references project2.films,
   constraint film_genres_pk
       primary key (film_id, genre_id)
);
 
alter table project2.film_genres
   owner to postgres;
 
create table project2.showings
(
   showing_id serial
       constraint showings_pk
           primary key,
   showtime   timestamp not null,
   room_id    integer   not null
       constraint showings_rooms_null_fk
           references project2.rooms,
   film_id    integer   not null
       constraint showings_films_null_fk
           references project2.films,
   format_id  integer   not null
       constraint showings_formats_null_fk
           references project2.formats,
   constraint showings_uk
       unique (showtime, film_id, room_id)
);
 
alter table project2.showings
   owner to postgres;
 
create table project2.tickets
(
   seat_id    integer          not null
       constraint tickets_seats_null_fk
           references project2.seats,
   showing_id integer          not null
       constraint tickets_showings_null_fk
           references project2.showings,
   number     integer          not null
       constraint tickets_uk
           unique,
   price      double precision not null,
   constraint tickets_pk
       primary key (seat_id, showing_id)
);
 
alter table project2.tickets
   owner to postgres;