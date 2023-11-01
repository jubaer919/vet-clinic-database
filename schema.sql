/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts INT NOT NULL,
  neutered BOOL NOT NULL,
  weight_kg DECIMAL(8, 2) NOT NULL
);


ALTER TABLE animals ADD COLUMN species VARCHAR(100);


/* day 3 project */

CREATE TABLE owners(
  id BIGSERIAL NOT NULL PRIMARY KEY,
  full_name VARCHAR(100),
  age INT
);

CREATE TABLE species(
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(100)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id ADD CONSTRAINT fk_species_id FOREIGN KEY(species_id) REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owners_id ADD CONSTRAINT fk_owners_id FOREIGN KEY(owners_id) REFERENCES owners(id);


/* day 4 project */

CREATE TABLE vets (id BIGSERIAL NOT NULL PRIMARY KEY, name VARCHAR(100), age INT, date_of_graduation DATE);

CREATE TABLE specializations(species_id BIGINT, vets_id BIGINT, PRIMARY KEY(species_id, vets_id), FOREIGN KEY (species_id) REFERENCES species(id), FOREIGN KEY (vets_id) REFERENCES vets (id));

CREATE TABLE visits(animals_id BIGINT, vets_id BIGINT, date_of_visits DATE, PRIMARY KEY(animals_id, vets_id), FOREIGN KEY(animals_id) REFERENCES animals(id), FOREIGN KEY(vets_id) REFERENCES vets (id));


/* day 1 week 2 project */

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animals_id_asc_order ON visits (animals_id ASC);

/* Henary Update*/
CREATE INDEX vets_id_asc_order ON visits (vets_id ASC);
CREATE INDEX owner_email ON oweners (email ASC);