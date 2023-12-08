-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passenger
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT
);

CREATE TABLE companies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country TEXT NOT NULL,
  city TEXT NOT NULL,
  address TEXT NOT NULL,
  phone TEXT NOT NULL,
  website TEXT NOT NULL
);

CREATE TABLE planes
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  type TEXT NOT NULL,
  seats TEXT[],
  id_company INTEGER REFERENCES companies (id) ON DELETE CASCADE
);

CREATE TABLE country
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE city
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  id_country INTEGER REFERENCES country (id) ON DELETE CASCADE
);

CREATE TABLE airports
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  id_city INTEGER REFERENCES city (id) ON DELETE CASCADE
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passenger (id) ON DELETE CASCADE,
  seat TEXT,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INTEGER REFERENCES planes (id) ON DELETE CASCADE,
  from_city INTEGER REFERENCES city (id) ON DELETE CASCADE,
  to_city INTEGER REFERENCES city (id) ON DELETE CASCADE
);

-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

-- Insert data into passenger table
INSERT INTO passenger
  (first_name, last_name, email, phone)
VALUES
  ('Jennifer', 'Finch', 'jennifer.finch@example.com', '+1234567890'),
  ('Thadeus', 'Gathercoal', 'thadeus.g@example.com', '+9876543210'),
  ('Sonja', 'Pauley', 'sonja.pauley@example.com', '+1112223333'),
  ('Jennifer', 'Finch', 'jennifer.finch@example.com', '+1234567890'),
  ('Waneta', 'Skeleton', 'waneta.skeleton@example.com', '+5556667777'),
  ('Thadeus', 'Gathercoal', 'thadeus.g@example.com', '+9876543210'),
  ('Berkie', 'Wycliff', 'berkie.w@example.com', '+9998887777'),
  ('Alvin', 'Leathes', 'alvin.leathes@example.com', '+7778889999'),
  ('Berkie', 'Wycliff', 'berkie.w@example.com', '+9998887777'),
  ('Cory', 'Squibbes', 'cory.s@example.com', '+4445556666');

-- Insert data into companies table
INSERT INTO companies
  (name, country, city, address, phone, website)
VALUES
  ('United', 'United States', 'Chicago', '123 Main St', '+1 123-456-7890', 'www.united.com'),
  ('British Airways', 'United Kingdom', 'London', '456 Oak St', '+44 20 1234 5678', 'www.britishairways.com'),
  ('Delta', 'United States', 'Atlanta', '789 Elm St', '+1 987-654-3210', 'www.delta.com'),
  ('TUI Fly Belgium', 'Belgium', 'Brussels', '101 Pine St', '+32 2 123 45 67', 'www.tuifly.be'),
  ('Air China', 'China', 'Beijing', '202 Cedar St', '+86 10 1234 5678', 'www.airchina.com'),
  ('American Airlines', 'United States', 'Dallas', '303 Birch St', '+1 800-433-7300', 'www.aa.com'),
  ('Avianca Brasil', 'Brazil', 'Sao Paolo', '404 Spruce St', '+55 11 1234 5678', 'www.avianca.com.br');

-- Insert data into country table
INSERT INTO country
  (name)
VALUES
  ('United States'),
  ('Japan'),
  ('United States'),
  ('United States'),
  ('France'),
  ('UAE'),
  ('United States'),
  ('United States'),
  ('United States'),
  ('Brazil'),
  ('Chile');

-- Insert data into city table
INSERT INTO city
  (name, id_country)
VALUES
  ('Washington DC', 1),
  ('Tokyo', 2),
  ('Los Angeles', 3),
  ('Seattle', 1),
  ('Paris', 5),
  ('Dubai', 6),
  ('New York', 1),
  ('Cedar Rapids', 1),
  ('Charlotte', 1),
  ('Sao Paolo', 10),
  ('Santiago', 11);

-- Insert data into airports table
INSERT INTO airports
  (name, id_city)
VALUES
  ('Airport1', 1),
  ('Airport2', 2),
  ('Airport3', 3),
  ('Airport4', 4),
  ('Airport5', 5),
  ('Airport6', 6),
  ('Airport7', 7),
  ('Airport8', 8),
  ('Airport9', 9),
  ('Airport10', 10),
  ('Airport11', 11);

-- Note: The seats column in the planes table is of type TEXT[], so it can be inserted as an array.
-- Insert data into planes table
INSERT INTO planes
  (name, type, seats, id_company)
VALUES
  ('Plane1', 'Type1', ARRAY['1A', '1B', '1C'], 1),
  ('Plane2', 'Type2', ARRAY['2A', '2B', '2C'], 2),
  ('Plane3', 'Type3', ARRAY['3A', '3B', '3C'], 3),
  ('Plane4', 'Type4', ARRAY['4A', '4B', '4C'], 4),
  ('Plane5', 'Type5', ARRAY['5A', '5B', '5C'], 5),
  ('Plane6', 'Type6', ARRAY['6A', '6B', '6C'], 6),
  ('Plane7', 'Type7', ARRAY['7A', '7B', '7C'], 7),
  ('Plane8', 'Type8', ARRAY['8A', '8B', '8C'], 4),
  ('Plane9', 'Type9', ARRAY['9A', '9B', '9C'], 3),
  ('Plane10', 'Type10', ARRAY['10A', '10B', '10C'], 1);

-- Insert data into tickets table
INSERT INTO tickets
  (passenger_id, seat, departure, arrival, airline, from_city, to_city)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 4),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 9),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 8),
  (4, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 4, 7),
  (5, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 10),
  (6, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 6, 11),
  (7, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 7, 8),
  (8, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 8, 7),
  (9, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 9, 6),
  (10, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 10, 11);
