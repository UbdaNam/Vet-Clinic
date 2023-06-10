/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Agumon', TO_DATE('03/02/2020','DD/MM/YYYY'), 10.23, '1', 0),
('Gabumon', TO_DATE('15/11/2018','DD/MM/YYYY'), 8, '1', 2),
('Pikachu', TO_DATE('07/01/2021','DD/MM/YYYY'), 15.04, '0', 1),
('Devimon', TO_DATE('12/05/2017','DD/MM/YYYY'), 11, '1', 5);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Charmander', TO_DATE('08/02/2020','DD/MM/YYYY'), 11, '0', 0),
('Plantmon', TO_DATE('15/11/2021','DD/MM/YYYY'), 5.7, '1', 2),
('Squirtle', TO_DATE('02/04/1993','DD/MM/YYYY'), 12.13, '0', 3),
('Angemon', TO_DATE('12/06/2005','DD/MM/YYYY'), 45, '1', 1),
('Boarmon', TO_DATE('07/06/2005','DD/MM/YYYY'), 20.4, '1', 7),
('Blossom', TO_DATE('13/10/1998','DD/MM/YYYY'), 17, '1', 3),
('Ditto', TO_DATE('14/05/2022','DD/MM/YYYY'), 22, '1', 4);

INSERT INTO owners(full_name, age) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES('Pokemon'),('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE name='Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name='Pokemon') WHERE species_id IS NULL;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Sam Smith') WHERE name='Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');