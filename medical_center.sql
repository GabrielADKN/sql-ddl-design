DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE center
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone INTEGER NOT NULL DEFAULT 0123456789,
    email VARCHAR(255) NOT NULL DEFAULT 'center@email',
    is_active BOOLEAN NOT NULL DEFAULT true
);

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone INTEGER DEFAULT 0123456789,
    email VARCHAR(255) DEFAULT 'doctor@email',
    is_active BOOLEAN DEFAULT true,
    center_id INTEGER REFERENCES center
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone INTEGER DEFAULT 0123456789,
    email VARCHAR(255) DEFAULT 'patient@email'
);

CREATE TABLE visit
(
    id SERIAL PRIMARY KEY,
    date DATE,
    doctor_id INTEGER REFERENCES doctors,
    patient_id INTEGER REFERENCES patients
);

CREATE TABLE disease
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    symptoms VARCHAR(255)
);

CREATE TABLE visit_disease
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visit,
    disease_id INTEGER REFERENCES disease
);

INSERT INTO center (name, address, phone, email, is_active)
VALUES ('NewYork Center', '3726 NY', 22346789, 'centrer@ny.com', true),
       ('Paris Center', '3726 Paris', 22576789, 'centrer@paris.com', true),
       ('London Center', '3726 London', 22316769, 'centrer@london.com', true);

INSERT INTO doctors (name, address, phone, email, is_active, center_id)
VALUES ('Dr. Jonh', '464 NY', 22346789, 'doctor@ny.com', true, 1),
       ('Dr. Jane', '464 Paris', 22576789, 'doctor@paris.com', true, 2),
       ('Dr. Anna', '464 London', 22316769, 'doctor@london.com', true, 3);

INSERT INTO patients (name, address, phone, email)
VALUES ('Oliver', '464 NY', 22346789, 'patient@ny.com'),
       ('Lily', '464 Paris', 22576789, 'patient@paris.com'),
       ('Mike', '464 London', 22316769, 'patient@london.com');

INSERT INTO visit (date, doctor_id, patient_id)
VALUES ('2021-01-01', 1, 1),
       ('2021-01-02', 2, 2),
       ('2021-01-03', 3, 3);

INSERT INTO disease (name, description, symptoms)
VALUES ('HeadEach', 'bla bla bla', 'Disease 1 Symptoms'),
       ('LegEach', 'bla bla bla', 'Disease 2 Symptoms'),
       ('EyeEach', 'bla bla bla', 'Disease 3 Symptoms');

INSERT INTO visit_disease (visit_id, disease_id)
VALUES (1, 1),
       (2, 2),
       (3, 3);


