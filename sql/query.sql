SELECT count(*)
FROM plant;

SELECT *
FROM plant
WHERE name = 'cactus'
   or location = 'living room';

SELECT plant.name, species_id
    FROM plant
    INNER JOIN species ON plant.species_id = species.id
    WHERE species.name = 'cactus';