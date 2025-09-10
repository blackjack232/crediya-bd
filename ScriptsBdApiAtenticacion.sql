
create database authentication_db

-- Optional: create schema (to organize objects)
CREATE SCHEMA auth;

-- Table: role
CREATE TABLE auth.role (
    uniqueid SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- Table: users
CREATE TABLE auth.users (
    id_user SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    identity_document VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(50),
    base_salary NUMERIC(12,2),
    id_role INT NOT NULL,
    CONSTRAINT fk_user_role FOREIGN KEY (id_role) REFERENCES auth.role(uniqueid)
);
INSERT INTO auth.role (name, description)
VALUES ('Administrador', 'Usuario con todos los permisos')
RETURNING uniqueid;

-- insertar un usuario 
INSERT INTO auth.users (
    first_name,
    last_name,
    email,
    identity_document,
    phone,
    base_salary,
    id_role
) VALUES (
    'Juan',
    'Pérez',
    'juan.perez@example.com',
    'DNI123456',
    '+123456789',
    2500.00,
    2  -- este es el id del rol creado
);

select * from users