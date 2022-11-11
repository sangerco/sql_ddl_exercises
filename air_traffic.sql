-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic


CREATE TABLE "airlines" (
  "id" SERIAL PRIMARY KEY,
  "airline_name" text
);

CREATE TABLE "countries" (
  "id" SERIAL PRIMARY KEY,
  "country_name" text
);

CREATE TABLE "cities" (
  "id" SERIAL PRIMARY KEY,
  "city_name" text,
  "country_id" integer
);

CREATE TABLE "passengers" (
  "id" SERIAL PRIMARY KEY,
  "first_name" text,
  "last_name" text,
);


CREATE TABLE "tickets" (
  "id" SERIAL PRIMARY KEY,
  "passenger_id" integer,
  "seat" text,
  "departure" timestamp,
  "arrival" timestamp,
  "departure_city_id" integer,
  "arrival_city_id" integer,
  "airline_id" integer
);

ALTER TABLE "tickets" ADD FOREIGN KEY ("passenger_id") REFERENCES "passengers" ("id") ON DELETE SET NULL;
ALTER TABLE "tickets" ADD FOREIGN KEY ("airline_id") REFERENCES "airlines" ("id") ON DELETE SET NULL;
ALTER TABLE "tickets" ADD FOREIGN KEY ("arrival_city_id") REFERENCES "cities" ("id") ON DELETE SET NULL;
ALTER TABLE "tickrts" ADD FOREIGN KEY ("departure_city_id") REFERENCES "cities" ("id") ON DELETE SET NULL;
ALTER TABLE "cities" ADD FOREIGN KEY ("country_id") REFERENCES "countries" ("id") ON DELETE SET NULL;

INSERT INTO airlines (airline_name)
VALUES
('Air China'),
('American Airlines'),
('Avianca Brasil'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('United');

INSERT INTO countries (country_name)
VALUES
('Brazil'),
('Chile'),
('China'),
('France'),
('Japan'),
('Mexico'),
('Morocco'),
('UAE'),
('United Kingdom'),
('United States');

INSERT INTO cities (city_name, country_id)
VALUES
('Beijing', 3),
('Casablanca', 7),
('Charlotte', 10),
('Chicago', 10),
('Las Vegas', 10),
('London', 9),
('Mexico City', 6),
('New Orleans', 10),
('Santiago', 2),
('Seattle', 10),
('Dubai', 8),
('Paris', 4),
('New York', 10),
('Cedar Rapids', 10),
('Los Angeles', 10),
('Tokyo', 5),
('Sao Paolo', 1),
('Washington, DC', 10);

INSERT INTO passengers (first_name, last_name)
VALUES
('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'), 
('Cory', 'Squibbes');

INSERT INTO passengers (passenger_id, seat, departure, arrival, departure_city_id, arrival_city_id, airline_id)
VALUES
(1, '33B','2018-04-08 09:00:00', '2018-04-08 12:00:00', 18, 10, 7),
(2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 16, 6, 4),
(3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 15, 5, 5),
(1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 10, 7, 5),
(4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 12, 2, 6),
(2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 11, 1, 1),
(5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 13, 3, 7),
(6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 14, 4, 2), 
(5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 3, 8, 2), 
(7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 17, 9, 3);
