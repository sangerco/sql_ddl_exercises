DROP DATABASE IF EXISTS medical;

CREATE DATABASE medical;

\c medical

CREATE TABLE "medical_center" (
  "id" SERIAL PRIMARY KEY,
  "name" TEXT NOT NULL
);

CREATE TABLE "doctors" (
  "id" SERIAL PRIMARY KEY,
  "first_name" text NOT NULL,
  "last_name" text NOT NULL,
  "phone_number" text,
  "specialty" text NOT NULL
);

CREATE TABLE "patients" (
  "id" SERIAL PRIMARY KEY,
  "first_name" text NOT NULL,
  "last_name" text NOT NULL,
  "birth_date" date NOT NULL,
  "phone_number" text,
  "email" text
);

CREATE TABLE "visit" (
  "id" SERIAL PRIMARY KEY,
  "medical_center" integer NOT NULL,
  "visit_date" timestamp NOT NULL,
  "patient_id" integer NOT NULL,
  "doctor_id" integer NOT NULL,
  "diagnosis1" integer,
  "diagnosis2" integer,
  "diagnosis3" integer
);

CREATE TABLE "diagnoses" (
  "id" SERIAL PRIMARY KEY,
  "name" text NOT NULL
);

ALTER TABLE "visit" ADD FOREIGN KEY ("patient_id") REFERENCES "patients" ("id") ON DELETE CASCADE;
ALTER TABLE "visit" ADD FOREIGN KEY ("doctor_id") REFERENCES "doctors" ("id") ON DELETE CASCADE;
ALTER TABLE "visit" ADD FOREIGN KEY ("diagnosis1") REFERENCES "diagnoses" ("id")  ON DELETE SET NULL;
ALTER TABLE "visit" ADD FOREIGN KEY ("medical_center") REFERENCES "medical_center" ("id") ON DELETE CASCADE;
ALTER TABLE "visit" ADD FOREIGN KEY ("diagnosis2") REFERENCES "diagnoses" ("id") ON DELETE SET NULL;
ALTER TABLE "visit" ADD FOREIGN KEY ("diagnosis3") REFERENCES "diagnoses" ("id") ON DELETE SET NULL;

INSERT INTO medical_center (name)
VALUES
('Longmont Hospital'),
('Longs Peak Hospital'),
('Boulder Hospital');

INSERT INTO doctors (first_name, last_name, phone_number, specialty)
VALUES
('John', 'Smith', '303-855-2323', 'Pediatrician'),
('Mary', 'Jones', '303-255-1212', 'Orthopedist'),
('Fred', 'Rogers', '720-755-3230', 'General Practice');

INSERT INTO patients (first_name, last_name, birth_date, phone_number, email)
VALUES
('Timmy', 'Johnson', '2014-12-14', '720-111-2233', 'momsemail@gmail.com'),
('Doris', 'Fink', '1944-01-17', '303-723-1818', 'doris@fink.com'),
('Bob', 'Stanton', '1968-07-04', '212-233-2445','bob@yahoo.com');

INSERT INTO diagnoses (name)
VALUES
('flu'),
('broken toe'),
('high blood pressure'),
('strained back'),
('arthritis');

INSERT INTO visit (medical_center, visit_date, patient_id, doctor_id, diagnosis1)
VALUES
(2, '2022-12-01 12:00:00', 1, 1, 1);

INSERT INTO visit (medical_center, visit_date, patient_id, doctor_id, diagnosis1)
VALUES
(1, '2022-11-24 10:00:00', 2, 2, 2);

INSERT INTO visit 
(medical_center, visit_date, patient_id, doctor_id, diagnosis1, diagnosis2, diagnosis3)
VALUES
(1, '2022-11-30 9:00:00', 3, 3, 3, 4, 5);

