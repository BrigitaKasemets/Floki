BEGIN;

-- Insert a new plant
INSERT INTO plant (id, name, species_id, date_added, location) VALUES ( 4, 'Plant 1', '1', '2020-01-01', 'Living Room');

-- Insert a new species
INSERT INTO species (id, name) VALUES ('4', 'Species 1');

-- Insert a new watering
INSERT INTO watering (id, plant_id, watering_date) VALUES ('4', '4', '2024-12-13');

-- If everything is successful, commit the transaction
COMMIT;

-- If an error occurs, rollback the transaction
ROLLBACK;


BEGIN;

-- add a new plant
INSERT INTO plant (id, name, species_id, date_added, location) VALUES ( 6, 'Havisaba', '1', '2020-01-01', 'Living Room');

-- add watering (it will fail)
INSERT INTO watering (id, plant_id, watering_date)
VALUES (999, '2024-12-12');

-- as one of the queries failed, we need to rollback the transaction
ROLLBACK;