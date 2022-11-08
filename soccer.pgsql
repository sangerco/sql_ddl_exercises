DROP DATABASE IF EXISTS soccer;
CREATE DATABASE soccer;
\c soccer

CREATE TABLE "soccer_teams" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "location" text
);

CREATE TABLE "players" (
  "id" SERIAL PRIMARY KEY,
  "first_name" text,
  "last_name" text,
  "team" integer
);

CREATE TABLE "referees" (
  "id" SERIAL PRIMARY KEY,
  "first_name" text,
  "last_name" text
);

CREATE TABLE "matches" (
  "id" SERIAL PRIMARY KEY,
  "match_date" date,
  "team1" integer,
  "team2" integer,
  "referee" integer
);

CREATE TABLE "goals" (
  "id" SERIAL PRIMARY KEY,
  "player" integer,
  "match" integer
);

CREATE TABLE "league_dates" (
  "id" SERIAL PRIMARY KEY,
  "start_date" date,
  "end_date" date
);

ALTER TABLE "players" ADD FOREIGN KEY ("team") REFERENCES "soccer_teams" ("id") ON DELETE SET NULL;
ALTER TABLE "matches" ADD FOREIGN KEY ("team1") REFERENCES "soccer_teams" ("id") ON DELETE SET NULL;
ALTER TABLE "matches" ADD FOREIGN KEY ("team2") REFERENCES "soccer_teams" ("id") ON DELETE SET NULL;
ALTER TABLE "goals" ADD FOREIGN KEY ("match") REFERENCES "matches" ("id") ON DELETE SET NULL;
ALTER TABLE "goals" ADD FOREIGN KEY ("player") REFERENCES "players" ("id") ON DELETE SET NULL;
ALTER TABLE "matches" ADD FOREIGN KEY ("referee") REFERENCES "referees" ("id") ON DELETE SET NULL;

INSERT INTO soccer_teams (name, location)
VALUES
('Spartans', 'Salida'),
('Demons', 'Buena Vista'),
('Trojans', 'Longmont'),
('Mavericks', 'Mead');

INSERT INTO players (first_name, last_name, team)
VALUES
('Ben', 'Franklin', 1),
('George', 'Washington', 2),
('Thomas', 'Jefferson', 3),
('Abraham', 'Lincoln', 4);

INSERT INTO referees (first_name, last_name)
VALUES
('Bob', 'Newhart'),
('Johnny', 'Carson');

INSERT INTO matches (match_date, team1, team2, referee)
VALUES
('2022-12-10', 1, 2, 1),
('2022-12-10', 3, 4, 2),
('2022-12-17', 1, 3, 1),
('2022-12-17', 2, 4, 2),
('2022-12-24', 1, 4, 1),
('2022-12-24', 2, 3, 2);

INSERT INTO goals (player, match)
VALUES 
(1,1),
(2,1),
(2,1),
(4,2),
(3,2),
(4,2),
(4,2),
(3,3),
(3,3),
(3,3),
(1,3),
(4,4),
(1,5),
(1,5),
(4,5),
(2,6),
(2,6),
(2,6),
(2,6),
(3,6),
(3,6),
(3,6),
(3,6);

INSERT INTO league_dates (start_date, end_date)
VALUES
('2022-09-01', '2023-5-20');