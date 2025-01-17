BEGIN;

-- Insert a new species
INSERT INTO species (id, name) VALUES ('1', 'Monstera');

-- Insert a new plant
INSERT INTO plant (id, name, species_id, date_added, location) VALUES ( 1, 'Monsu', '1', '2020-01-01', 'Living Room');

-- Insert a new watering
INSERT INTO watering (id, plant_id, watering_date) VALUES ('1', '1', '2024-12-13');

-- Insert a new fertilizer type
INSERT INTO fertilizer_type (id, name) VALUES ('1', 'NPK');

-- Insert a new fertilizing
INSERT INTO fertilizing (id, plant_id, fertilizing_date, fertilizer_type) VALUES ('1', '1', '2024-12-13', '1');

INSERT INTO species (id, name) VALUES ('2', 'Dracaena');

INSERT INTO plant (id, name, species_id, date_added, location) VALUES ( 2, 'draakonipuu', '2', '2020-01-01', 'bedroom');

INSERT INTO watering (id, plant_id, watering_date) VALUES ('2', '2', '2024-12-08');

INSERT INTO fertilizer_type (id, name) VALUES ('2', 'NPK-14-14-14');

INSERT INTO fertilizing (id, plant_id, fertilizing_date, fertilizer_type) VALUES ('2', '2', '2024-12-08', '2');

INSERT INTO species (id, name) VALUES ('3', 'Ficus');

INSERT INTO plant (id, name, species_id, date_added, location) VALUES ( 3, 'Fic', '3', '2024-01-21', 'Living Room');

INSERT INTO watering (id, plant_id, watering_date) VALUES ('3', '3', '2024-12-13');

INSERT INTO fertilizer_type (id, name) VALUES ('3', 'NPK-7-14-21');

INSERT INTO fertilizing (id, plant_id, fertilizing_date, fertilizer_type) VALUES ('3', '3', '2023-12-13', '3');

INSERT INTO species (id, name) VALUES ('4', 'Aloe Vera');

INSERT INTO plant (id, name, species_id, date_added, location) VALUES ( 4, 'Alo', '4', '2015-01-21', 'Bedroom');

INSERT INTO watering (id, plant_id, watering_date) VALUES ('4', '4', '2025-01-01');

INSERT INTO fertilizing (id, plant_id, fertilizing_date, fertilizer_type) VALUES ('4', '4', '2025-01-01', '1');

INSERT INTO plant (id, name, species_id, date_added, location) VALUES ( 5, 'Pos', '3', '2025-05-01', 'Bedroom');

INSERT INTO watering (id, plant_id, watering_date) VALUES ('5', '5', '2025-01-01');

INSERT INTO fertilizing (id, plant_id, fertilizing_date, fertilizer_type) VALUES ('5', '5', '2025-01-01', '1');


-- If everything is successful, commit the transaction
COMMIT ;