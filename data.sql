
INSERT INTO animals VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals VALUES ('Gabumon', '2018-11-15', 2, TRUE, 8);
INSERT INTO animals VALUES ('Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals VALUES ('Devimon', '2017-05-12', 5, TRUE, 11);


INSERT INTO animals VALUES ('Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals VALUES ('Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals VALUES ('Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals VALUES ('Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';

UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

