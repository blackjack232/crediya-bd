-- 1. Crear la base de datos
CREATE DATABASE loan_system;

-- 2. Crear el usuario con contraseña
CREATE USER loan_user WITH PASSWORD '123456789';


-- 3. Conceder permisos sobre la base de datos
GRANT ALL PRIVILEGES ON DATABASE loan_system TO loan_user;


-- 4. Conectarse a la base de datos
\c loan_system;

-- 5. Crear el esquema
CREATE SCHEMA loan_schema AUTHORIZATION loan_user;


-- 6. Dar permisos sobre el esquema
GRANT ALL PRIVILEGES ON SCHEMA loan_schema TO loan_user;

-- Switch to the correct database
\c loan_system;

-- Ensure you are using the schema
SET search_path TO loan_schema;

-- Table: states
CREATE TABLE loan_schema.states (
    id_state SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Table: loan_type
CREATE TABLE loan_schema.loan_type (
    id_loan_type SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    minimum_amount DECIMAL(12,2) NOT NULL,
    maximum_amount DECIMAL(12,2) NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL, -- e.g. 12.50 for 12.5%
    automatic_validation BOOLEAN DEFAULT FALSE
);

-- Table: request
CREATE TABLE loan_schema.request (
    id_request SERIAL PRIMARY KEY,
    amount DECIMAL(12,2) NOT NULL,
    term INT NOT NULL, -- loan term in months
    email VARCHAR(150) NOT NULL,
    id_state INT NOT NULL,
    id_loan_type INT NOT NULL,
    CONSTRAINT fk_request_state FOREIGN KEY (id_state) REFERENCES loan_schema.states (id_state),
    CONSTRAINT fk_request_loan_type FOREIGN KEY (id_loan_type) REFERENCES loan_schema.loan_type (id_loan_type)
);

-- Grant permissions on tables
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA loan_schema TO loan_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA loan_schema TO loan_user;


SELECT * FROM loan_type

----

-- 1. Crear la base de datos
CREATE DATABASE loan_system;

-- 2. Crear el usuario con contraseña
CREATE USER loan_user WITH PASSWORD '123456789';


-- 3. Conceder permisos sobre la base de datos
GRANT ALL PRIVILEGES ON DATABASE loan_system TO loan_user;


-- 4. Conectarse a la base de datos
\c loan_system;

-- 5. Crear el esquema
CREATE SCHEMA loan_schema AUTHORIZATION loan_user;


-- 6. Dar permisos sobre el esquema
GRANT ALL PRIVILEGES ON SCHEMA loan_schema TO loan_user;

-- Switch to the correct database
\c loan_system;

-- Ensure you are using the schema
SET search_path TO loan_schema;

-- Table: states
CREATE TABLE loan_schema.states (
    id_state SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Table: loan_type
CREATE TABLE loan_schema.loan_type (
    id_loan_type SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    minimum_amount DECIMAL(12,2) NOT NULL,
    maximum_amount DECIMAL(12,2) NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL, -- e.g. 12.50 for 12.5%
    automatic_validation BOOLEAN DEFAULT FALSE
);

-- Table: request
CREATE TABLE loan_schema.request (
    id_request SERIAL PRIMARY KEY,
    amount DECIMAL(12,2) NOT NULL,
    term INT NOT NULL, -- loan term in months
    email VARCHAR(150) NOT NULL,
    id_state INT NOT NULL,
    id_loan_type INT NOT NULL,
    CONSTRAINT fk_request_state FOREIGN KEY (id_state) REFERENCES loan_schema.states (id_state),
    CONSTRAINT fk_request_loan_type FOREIGN KEY (id_loan_type) REFERENCES loan_schema.loan_type (id_loan_type)
);

-- Grant permissions on tables
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA loan_schema TO loan_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA loan_schema TO loan_user;


SELECT * FROM loan_type
select * from loan_schema.request
select * from loan_schema.states
select * from loan_schema.loan_type





