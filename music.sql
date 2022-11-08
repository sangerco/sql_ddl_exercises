-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE "songs" (
  "id" SERIAL PRIMARY KEY,
  "title" text NOT NULL,
  "duration_in_seconds" integer,
  "release_date" date NOT NULL,
  "album" text NOT NULL
);

CREATE TABLE "artists" (
  "id" SERIAL PRIMARY KEY,
  "artist_name" text NOT NULL,
  "song" integer
);

CREATE TABLE "producers" (
  "id" SERIAL PRIMARY KEY,
  "producer_name" text NOT NULL,
  "song" integer
);


CREATE TABLE "songs_artists_producers" (
  "id" SERIAL PRIMARY KEY,
  "song_id" integer NOT NULL,
  "artist1" integer NOT NULL,
  "artist2" integer,
  "producer1" integer NOT NULL,
  "producer2" integer
);

ALTER TABLE "songs_artists_producers" ADD FOREIGN KEY ("artist1") REFERENCES "artists" ("id") ON DELETE CASCADE;
ALTER TABLE "songs_artists_producers" ADD FOREIGN KEY ("artist2") REFERENCES "artists" ("id") ON DELETE SET NULL;
ALTER TABLE "songs_artists_producers" ADD FOREIGN KEY ("producer1") REFERENCES "producers" ("id") ON DELETE CASCADE;
ALTER TABLE "songs_artists_producers" ADD FOREIGN KEY ("producer2") REFERENCES "producers" ("id") ON DELETE SET NULL;
ALTER TABLE "songs_artists_producers" ADD FOREIGN KEY ("song_id") REFERENCES "songs" ("id") ON DELETE CASCADE;
ALTER TABLE "artists" ADD FOREIGN KEY ("song") REFERENCES "songs" ("id") ON DELETE CASCADE;
ALTER TABLE "producers" ADD FOREIGN KEY ("song") REFERENCES "songs" ("id") ON DELETE CASCADE;

INSERT INTO songs (title, duration_in_seconds, release_date, album)
VALUES
('MMMBop', 238, '04-15-1997', 'Middle of Nowhere'),
('Bohemian Rhapsody', 355, '10-31-1975', 'A Night At The Opera'),
('One Sweet Day', 282, '11-14-1995', 'Daydream'),
('Shallow', 216, '09-27-2018', 'A Star Is Born'),
('How You Remind Me', 223, '08-21-2001', 'Silver Side Up'),
('New York State of Mind', 276, '10-20-2009', 'The Blueprint 3'),
('Dark Horse', 215, '12-17-2013', 'Prism'),
('Moves Like Jagger', 201, '06-21-2011', 'Hands All Over'),
('Complicated', 244, '05-14-2002', 'Let Go'),
('Say My Name', 240, '11-07-1999', 'The Writing''s on the Wall');

INSERT INTO artists (artist_name, song)
VALUES
('Hanson', 1),
('Queen', 2),
('Mariah Carey', 3),
('Boyz II Men', 3),
('Lady Gaga', 4),
('Bradley Cooper', 4),
('Nickelback', 5),
('Jay Z', 6),
('Alicia Keys', 6),
('Katy Perry', 7),
('Juicy J', 7),
('Maroon 5', 8),
('Christina Aguilera', 8),
('Avril Lavigne', 9),
('Destiny''s Child', 10);

INSERT INTO producers (producer_name, song)
VALUES
('Dust Brothers', 1),
('Stephen Lironi', 1),
('Roy Thomas Baker', 2),
('Walter Afanasieff', 3),
('Benjamin Rice', 4),
('Rick Parashar', 5),
('Al Shux', 6),
('Max Martin', 7), 
('Cirkut', 7),
('Shellback', 8), 
('Benny Blanco', 8),
('The Matrix', 9),
('Darkchild', 10);

INSERT INTO songs_artists_producers (song_id, artist1, producer1)
VALUES
(2, 2, 3),
(5, 7, 6),
(9, 14, 12),
(10, 15, 13);

INSERT INTO songs_artists_producers (song_id, artist1, artist2, producer1)
VALUES
(3, 3, 4, 4),
(4, 5, 6, 5),
(6, 8, 9, 7);

INSERT INTO songs_artists_producers (song_id, artist1, producer1, producer2)
VALUES
(1, 1, 1, 2);

INSERT INTO songs_artists_producers (song_id, artist1, artist2, producer1, producer2)
VALUES
(7, 10, 11, 8, 9),
(8, 12, 13, 10, 11);
