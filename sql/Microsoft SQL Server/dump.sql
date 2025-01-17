CREATE DATABASE floki_db;

USE floki_db;

-- Create schema if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'floki_schema')
    BEGIN
        EXEC('CREATE SCHEMA floki_schema')
    END
GO

-- First, create tables without foreign keys
-- Species table
CREATE TABLE floki_schema.species (
        id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
        name NVARCHAR(191) NOT NULL
);

-- Create fertilizer_type table
CREATE TABLE floki_schema.fertilizer_type (
                                 id INT IDENTITY(1,1) PRIMARY KEY,
                                 name NVARCHAR(191) NOT NULL
);

-- Create plant table with foreign key
CREATE TABLE floki_schema.plant (
                       id INT IDENTITY(1,1) PRIMARY KEY,
                       name NVARCHAR(191) NOT NULL,
                       species_id INT NOT NULL,
                       date_added DATE NOT NULL,
                       location NVARCHAR(191) NOT NULL
);
-- Add foreign key for plant after table creation
ALTER TABLE floki_schema.plant
    ADD CONSTRAINT plant_species_id_fk
        FOREIGN KEY (species_id) REFERENCES floki_schema.species(id);

-- Create fertilizing table
CREATE TABLE floki_schema.fertilizing (
                                          id INT IDENTITY(1,1) PRIMARY KEY,
                                          plant_id INT NOT NULL,
                                          fertilizing_date DATE NOT NULL,
                                          fertilizer_type INT NOT NULL
);

-- Add foreign keys for fertilizing
ALTER TABLE floki_schema.fertilizing
    ADD CONSTRAINT fertilizing_plant_fk
        FOREIGN KEY (plant_id) REFERENCES floki_schema.plant(id);

ALTER TABLE floki_schema.fertilizing
    ADD CONSTRAINT fertilizing_type_fk
        FOREIGN KEY (fertilizer_type) REFERENCES floki_schema.fertilizer_type(id);

-- Create watering table
CREATE TABLE floki_schema.watering (
                                       id INT IDENTITY(1,1) PRIMARY KEY,
                                       plant_id INT NOT NULL,
                                       watering_date DATE NOT NULL
);

-- Add foreign key for watering
ALTER TABLE floki_schema.watering
    ADD CONSTRAINT watering_plant_fk
        FOREIGN KEY (plant_id) REFERENCES floki_schema.plant(id);