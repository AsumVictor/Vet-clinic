SELECT name FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- Second transaction

 BEGIN;
 UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
 UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
 COMMIT;
 SELECT * FROM animals

-- Third transacions
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals

-- fourth transaction
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT weight_point;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO weight_point;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;


-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempt = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, COUNT(*) FROM animals GROUP BY neutered ORDER BY COUNT(*) DESC LIMIT 1;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- What animals belong to Melody Pond?
SELECT * FROM animals JOIN owners ON animals.owner_id = owners.id where full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT A.name, S.name FROM animals A JOIN species S ON A.species_id = S.id WHERE S.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT * FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT count(*) AS count, S.name FROM animals A JOIN species S ON A.species_id = S.id GROUP BY S.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT A.name FROM animals A JOIN owners O ON A.owner_id = O.id JOIN species S ON A.species_id = S.id WHERE O.full_name = 'Jennifer Orwell' AND S.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * FROM animals A JOIN owners O ON A.owner_id = O.id WHERE O.full_name = 'Dean Winchester' AND A.escape_attempts = 0;

-- Who owns the most animals?
SELECT O.full_name, count(*) AS count FROM animals A JOIN owners O ON A.owner_id = O.id GROUP BY O.full_name ORDER BY count DESC LIMIT 1;

-- Who was the last animal seen by William Tatcher?
SELECT * FROM animals WHERE id = (SELECT animal_id FROM visits WHERE vet_id = 1 ORDER BY visit_date DESC LIMIT 1);

-- How many different animals did Stephanie Mendez see?

SELECT count(DISTINCT animal_id) FROM visits WHERE vet_id = 3;

-- List all vets and their specialties, including vets with no specialties.

SELECT v.name, s.species_id FROM vets v LEFT JOIN specializations s ON v.id = s.vet_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

SELECT a.name FROM animals a JOIN visits v ON a.id = v.animal_id WHERE v.vet_id = 3 AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT a.name, count(v.animal_id) FROM animals a JOIN visits v ON a.id = v.animal_id GROUP BY a.name ORDER BY count(v.animal_id) DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT a.name FROM animals a JOIN visits v ON a.id = v.animal_id WHERE v.vet_id = 2 ORDER BY v.visit_date ASC LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT a.name, v.visit_date, v.vet_id FROM animals a JOIN visits v ON a.id = v.animal_id ORDER BY v.visit_date DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT count(*) FROM visits v JOIN specializations s ON v.vet_id = s.vet_id WHERE v.animal_id = s.species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT s.species_id FROM specializations s JOIN visits v ON s.vet_id = v.vet_id WHERE v.vet_id = 2 GROUP BY s.species_id ORDER BY count(s.species_id) DESC LIMIT 1;
