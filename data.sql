/* Populate database with sample data. */

INSERT INTO animals (
  id,
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg,
)
VALUES 
(1, 'Agumon', '2020-02-03', 0, true, 10.23),
(2, 'Gabumon', '2018-11-15', 2, true, 8),
(3, 'Pikachu', '2021-01-07', 1, false, 15.04),
(4, 'Devimon', '2017-05-12', 5, true, 11),
(5, 'Charmander', '2020-02-08', 0, false, -11),
(6, 'Plantmon', '2021-11-15', 2, true, -5.7),
(7, 'Squirtle', '1993-04-02', 3, false, -12.13),
(8, 'Angemon', '2005-06-12', 1, true, -45),
(9, 'Boarmon', '2005-06-07', 7, true, 20.4),
(10, 'Blossom', '1998-10-13', 3, true, 17),
(11, 'Ditto', '2022-05-14', 4, true, 22);


/* day 3 project */

INSERT INTO oweners(full_name, age)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 34);


INSERT INTO species(name) VALUES ('Pokemon'), ('Digimon');


UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animals SET species_id = COALESCE(species_id, 1) WHERE species_id IS NULL;

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';

UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';


/* day 4 project */

INSERT INTO vets(name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations(species_id, vets_id) SELECT species.id AS species_id, vets.id AS vets_id FROM species, vets WHERE species.name = 'Pokemon' AND vets.name = 'William Tatcher';

INSERT INTO specializations(species_id, vets_id) SELECT species.id AS species_id, vets.id AS vets_id FROM species, vets WHERE  (species.name = 'Digimon' AND vets.name = 'Stephanie Mendez') OR (species.name = 'Pokemon' AND vets.name = 'Stephanie Mendez');

INSERT INTO specializations(species_id, vets_id) SELECT species.id AS species_id, vets.id AS vets_id FROM species, vets WHERE species.name = 'Digimon' AND vets.name = 'Jack Harkness';

INSERT INTO visits (animals_id, vets_id, date_of_visits)
VALUES (3, 3, '2021-05-04'),
(8, 4, '2021-02-24'),
(4, 2, '2019-12-21'),
(4, 1, '2020-08-10'),
(4, 2, '2021-04-07'),
(9, 3, '2019-09-29'),
(5, 4, '2020-10-03'),
(5, 4, '2020-11-04'),
(6, 2, '2019-01-24'),
(6, 2, '2019-05-15'),
(6, 2, '2020-02-27'),
(6, 2, '2020-08-03'),
(10, 3, '2020-05-24'),
(10, 1, '2021-01-11');
