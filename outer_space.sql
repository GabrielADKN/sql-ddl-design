-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE galaxy
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE orbits_around
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER NOT NULL REFERENCES orbits_around(id),
  galaxy INTEGER NOT NULL REFERENCES galaxy(id)
);

CREATE TABLE moons_of_planets
(
  planet_id INTEGER NOT NULL REFERENCES planets(id),
  moon_id INTEGER NOT NULL REFERENCES moons(id),
  PRIMARY KEY (planet_id, moon_id)
);

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');

INSERT INTO moons (name) VALUES
  ('Luna'),
  ('Phobos'),
  ('Europa');

INSERT INTO galaxy (name) VALUES
  ('Milky Way'),
  ('Andromeda'),
  ('Triangulum');

INSERT INTO orbits_around (name) VALUES
  ('Sun'),
  ('Proxima Centauri'),
  ('Alpha Centauri');

INSERT INTO planets (name, orbital_period_in_years, orbits_around, galaxy) VALUES
  ('Earth', 365.25, 1, 1),
  ('Mars', 687.0, 1, 1),
  ('Jupiter', 4332.82, 1, 1),
  ('Proxima b', 11.2, 2, 2),
  ('Alpha Centauri b', 20.0, 3, 2),
  ('Europa', 3.55, 1, 1);

INSERT INTO moons_of_planets (planet_id, moon_id) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (3, 1),
  (4, 2),
  (5, 3),
  (6, 1),
  (6, 2),
  (6, 3);