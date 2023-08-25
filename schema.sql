/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
     id INT GENERATED ALWAYS AS IDENTITY, 
    name VARCHAR(100) NOT NULL, 
    date_of_birth DATE NOT NULL, 
    escape_attempt INT, 
    neutered BOOLEAN, 
    weight_kg DECIMAL NOT NULL
);

ALTER TABLE animals ADD COLUMN species VARCHAR(100);

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name TEXT,
    age INT,
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT,
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY (id)
);

CREATE TABLE specializations (
    vet_id INT REFERENCES vets(id),
    species_id INT REFERENCES species(id),
);

CREATE TABLE visits (
    vet_id INT REFERENCES vets(id),
    animal_id INT REFERENCES animals(id),
    visit_date DATE,
);
