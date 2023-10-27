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

/* day 4 project */

SELECT animals.name, date_of_visits FROM visits JOIN animals ON visits.animals_id = animals.id WHERE visits.vets_id = (SELECT id FROM vets WHERE name = 'William Tatcher') ORDER BY visits.date_of_visits DESC LIMIT 1;

SELECT DISTINCT(animals.name) FROM visits JOIN animals ON visits.animals_id = animals.id WHERE visits.vets_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez');

SELECT vets.name, species.name FROM specializations LEFT JOIN vets ON specializations.vets_id = vets.id LEFT JOIN species ON specializations.species_id = species.id;

SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Stephanie Mendez' and visits.date_of_visits BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, COUNT(visits.animals_id) AS count FROM animals JOIN visits ON animals.id = visits.animals_id GROUP BY animals.name ORDER BY count DESC LIMIT 1;

SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visits LIMIT 1;

SELECT animals.name, visits.date_of_visits, vets.name FROM visits JOIN animals ON visits.animals_id = animals.id JOIN vets ON visits.vets_id = vets.id ORDER BY visits.date_of_visits DESC LIMIT 1;

SELECT COUNT(*) FROM visits JOIN animals ON visits.animals_id = animals.id JOIN vets ON visits.vets_id = vets.id LEFT JOIN specializations s ON vets.id = s.vets_id AND animals.species_id = s.species_id WHERE s.vets_id IS NULL;

SELECT s.name AS specialty_name, COUNT(*) AS animal_count FROM visits v JOIN animals a ON v.animals_id = a.id JOIN vets vet ON v.vets_id = vet.id JOIN specializations spec ON vet.id = spec.vets_id JOIN species s ON spec.species_id = s.id WHERE vet.name = 'Maisy Smith' GROUP BY s.name ORDER BY animal_count DESC LIMIT 1;