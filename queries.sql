/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2020-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* day 2 project */

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL OR species = '';
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT my_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO my_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) as average_weight
FROM animals;

SELECT neutered, COUNT(escape_attempts) as escape_attempts_count
FROM animals
GROUP BY neutered
ORDER BY escape_attempts_count DESC;

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth >= '1990/01/01' AND date_of_birth <= '2000/12/31'
GROUP BY species;


/* day 3 project */

select * FROM animals JOIN oweners ON animals.owner_id = oweners.id WHERE oweners.full_name = 'Melody Pond';

SELECT * FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT oweners.full_name, animals.name FROM oweners LEFT JOIN animals ON oweners.id = animals.owner_id;

SELECT species.name, COUNT(species.name) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

SELECT * FROM animals JOIN species ON animals.species_id = species.id JOIN oweners ON animals.owner_id = oweners.id WHERE oweners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT * FROM animals JOIN oweners ON animals.owner_id = oweners.id JOIN species ON animals.species_id = species.id WHERE oweners.full_name ='Dean Winchester' AND animals.escape_attempts = 0;

SELECT oweners.full_name, COUNT(animals.id) AS num_animals_owned FROM oweners LEFT JOIN animals ON oweners.id = animals.owner_id GROUP BY oweners.full_name ORDER BY num_animals_owned DESC LIMIT 1;