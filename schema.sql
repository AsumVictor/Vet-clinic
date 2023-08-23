/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
     id INT GENERATED ALWAYS AS IDENTITY, 
    name VARCHAR(100) NOT NULL, 
    date_of_birth DATE NOT NULL, 
    escape_attempt INT, 
    neutered BOOLEAN, 
    weight_kg DECIMAL NOT NULL
);
