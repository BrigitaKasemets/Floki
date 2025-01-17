SELECT count(*)
FROM plant;

SELECT *
FROM plant
WHERE date_added = '2020'
   or location = 'living room';

SELECT
    plant.location,
    -- counts plants in every location
    COUNT(*) AS plant_count,
    -- finds the earliest planting date on each location
    MIN(date_added) AS earliest_planting_date
FROM plant
-- plants added after 2020
WHERE
    date_added > 2020
-- group by location
GROUP BY
    plant.location
-- sorts the result by plant count in descending order
ORDER BY
    plant_count DESC;
