DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist


CREATE TABLE "region" (
  "id" SERIAL PRIMARY KEY,
  "name" text NOT NULL
);

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "username" varchar(12) NOT NULL,
  "first_name" text NOT NULL,
  "last_name" text NOT NULL,
  "pref_region" integer DEFAULT 1
);

CREATE TABLE "posts" (
  "id" SERIAL PRIMARY KEY,
  "userid" integer,
  "username" text NOT NULL,
  "title" text NOT NULL,
  "category" integer,
  "post_text" text NOT NULL,
  "post_time" timestamp NOT NULL,
  "location" text,
  "region_id" integer
);

CREATE TABLE "categories" (
  "id" SERIAL PRIMARY KEY,
  "name" text NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("pref_region") REFERENCES "region" ("id") ON DELETE SET NULL;
ALTER TABLE "posts" ADD FOREIGN KEY ("userid") REFERENCES "users" ("id") ON DELETE SET NULL;
ALTER TABLE "posts" ADD FOREIGN KEY ("region_id") REFERENCES "region" ("id") ON DELETE SET NULL;
ALTER TABLE "posts" ADD FOREIGN KEY ("category") REFERENCES "categories" ("id") ON DELETE SET NULL;

INSERT INTO region (name)
VALUES
('Bedrock'),
('Orbit City'),
('Metropolis'),
('Queens');

INSERT INTO users (username, first_name, last_name, pref_region)
VALUES
('dinodad11', 'Fred', 'Flintstone', 1),
('jetpackman', 'George', 'Jetson', 2),
('spidey18', 'Peter', 'Parker', 4),
('manofsteel', 'Clark', 'Kent', 3);

INSERT INTO categories (name)
VALUES
('Upcoming Events'),
('Hobbies'),
('Alerts'),
('General Questions');

INSERT INTO posts (username, title, category, post_text, post_time, location, region_id)
VALUES
('dinodad11', 'Bowling tonite', 1, 'At the Water Buffalo Club', '2022-11-07 12:27:00', 'Bedrock', 1),
('jetpackman', 'Jetpacks Rule', 2, 'I love to fly!', '2022-11-07 13:12:33', 'Orbit City', 2),
('manofsteel', 'Look out for Lex Luthor', 3, 'He has kryptonite!', '2022-11-07 14:11:56', 'Metropolis', 3),
('spidey18', 'Found Lex Luthor', 3, 'I got his kryptonite.', '2022-11-07 14:15:15', 'Metropolis', 3),
('spidey18', 'What do I do with Kryptonite?', 4, 'This is serious.', '2022-11-07 14:17:02', 'Metropolis', 3);

