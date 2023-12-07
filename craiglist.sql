DROP DATABASE IF EXISTS craiglist;

CREATE DATABASE craiglist;

\c craiglist

CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE "user"
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    id_region INT REFERENCES region(id)
);

CREATE TABLE category
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE post
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    text VARCHAR(255),
    date DATE,
    id_region INT REFERENCES region(id),
    id_user INT REFERENCES "user"(id),
    id_category INT REFERENCES category(id)
);

INSERT INTO region (name)
VALUES ('Seattle'),
    ('Portland'),
    ('San Francisco'),
    ('Los Angeles'),
    ('San Diego'),
    ('Las Vegas'),
    ('Salt Lake City'),
    ('Denver'),
    ('Phoenix'),
    ('Albuquerque'),
    ('Austin'),
    ('Dallas'),
    ('Houston'),
    ('Kansas City'),
    ('Minneapolis'),
    ('Chicago'),
    ('Nashville'),
    ('Atlanta'),
    ('Miami'),
    ('Tampa'),
    ('Charlotte'),
    ('Washington DC'),
    ('Philadelphia'),
    ('New York'),
    ('Boston');

INSERT INTO "user" (name, email, id_region)
VALUES ('Jonh', 'jonh@email.com', 1),
    ('Jane', 'jane@email.com', 2),
    ('Bob', 'bob@email.com', 3),
    ('Jill', 'jill@email.com', 4),
    ('Jake', 'jake@email.com', 5),
    ('Josh', 'josh@email.com', 6),
    ('Jessica', 'jessica@email.com', 7),
    ('Joseph', 'joseph@email.com', 8),
    ('Jordan', 'jordan@email.com', 9),
    ('Jenny', 'jenny@email.com', 10);

INSERT INTO category (name)
VALUES ('Technology'),
    ('Housing'),
    ('Jobs'),
    ('For Sale'),
    ('Services'),
    ('Community'),
    ('Personals'),
    ('Discussion Forums');

INSERT INTO post (title, text, date, id_region, id_user, id_category)
VALUES ('Post 1', 'Craiglist is a great place to find great deals', '2017-01-01', 1, 1, 1),
    ('Post 2', 'Craiglist is a great place to find great deals', '2017-01-02', 2, 2, 2),
    ('Post 3', 'Craiglist is a great place to find great deals', '2017-01-03', 3, 3, 3),
    ('Post 4', 'Craiglist is a great place to find great deals', '2017-01-04', 4, 4, 4),
    ('Post 5', 'Craiglist is a great place to find great deals', '2017-01-05', 5, 5, 5),
    ('Post 6', 'Craiglist is a great place to find great deals', '2017-01-06', 6, 6, 6),
    ('Post 7', 'Craiglist is a great place to find great deals', '2017-01-07', 7, 7, 7),
    ('Post 8', 'Craiglist is a great place to find great deals', '2017-01-08', 8, 8, 8),
    ('Post 9', 'Craiglist is a great place to find great deals', '2017-01-09', 9, 9, 1),
    ('Post 10', 'Craiglist is a great place to find great deals', '2017-01-10', 10, 10, 2);

