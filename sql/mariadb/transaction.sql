BEGIN;

USE testdb;

-- Insert a new species
INSERT INTO species (id, name) VALUES ('4', 'Monstera');

-- Insert a new plant
INSERT INTO plant (id, name, species_id, date_added, location) VALUES ( 4, 'Monsu', '4', '2020-01-01', 'Living Room');

-- Insert a new watering
INSERT INTO watering (id, plant_id, watering_date) VALUES ('4', '4', '2024-12-13');

INSERT INTO fertilizer_type (id, fertilizing_name) VALUES ('4', 'NPK');

INSERT INTO fertilizing (id, plant_id, fertilizing_date, fertilizer_type) VALUES ('4', '4', '2024-12-13', '4');

-- If everything is successful, commit the transaction
COMMIT;

-- If an error occurs, rollback the transaction
ROLLBACK;

INSERT INTO species (id, name) VALUES ('2', 'Dracaena');

-- add a new plant
INSERT INTO plant (id, name, species_id, date_added, location) VALUES ( 2, 'Havisaba', '2', '2020-01-01', 'Living Room');

-- add watering
INSERT INTO watering (id, plant_id, watering_date)
VALUES (2, 2, '2024-12-13');

-- add fertilizer type
INSERT INTO fertilizer_type (id, fertilizing_name) VALUES ('2', 'NPK');

-- add fertilizing
INSERT INTO fertilizing (id, plant_id, fertilizing_date, fertilizer_type) VALUES ('2', '2', '2024-12-13', '2');


INSERT INTO species (id, name) VALUES ('3', 'Ficus');
INSERT INTO plant (id, name, species_id, date_added, location) VALUES ( 3, 'Fic', '3', '2020-01-01', 'Living Room');
INSERT INTO watering (id, plant_id, watering_date) VALUES ('3', '3', '2024-12-13');
INSERT INTO fertilizer_type (id, fertilizing_name) VALUES ('3', 'NPK');
INSERT INTO fertilizing (id, plant_id, fertilizing_date, fertilizer_type) VALUES ('3', '3', '2024-12-13', '3');

INSERT INTO species (id, name) VALUES ('1', 'Aloe Vera');
INSERT INTO plant (id, name, species_id, date_added, location) VALUES ( 1, 'Alo', '1', '2020-01-01', 'Living Room');
INSERT INTO watering (id, plant_id, watering_date) VALUES ('1', '1', '2024-12-13');
INSERT INTO fertilizer_type (id, fertilizing_name) VALUES ('1', 'NPK');
INSERT INTO fertilizing (id, plant_id, fertilizing_date, fertilizer_type) VALUES ('1', '1', '2024-12-13', '1');

INSERT INTO species (id, name) VALUES ('5', 'Pothos');
INSERT INTO plant (id, name, species_id, date_added, location) VALUES ( 5, 'Poth', '5', '2024-05-01', 'Bedroom');
INSERT INTO watering (id, plant_id, watering_date) VALUES ('5', '5', '2024-12-13');
INSERT INTO fertilizer_type (id, fertilizing_name) VALUES ('5', 'liquid');
INSERT INTO fertilizing (id, plant_id, fertilizing_date, fertilizer_type) VALUES ('5', '5', '2024-12-13', '5');

INSERT INTO plant (id, name, species_id, date_added, location) VALUES (6, 'Poth', 5, '2015-05-01', 'Bedroom');

COMMIT ;