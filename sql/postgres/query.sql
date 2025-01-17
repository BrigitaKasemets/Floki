SELECT count(*)
FROM plant;

SELECT
    location,
    COUNT(*) AS plant_count,
    MIN(date_added) AS earliest_planting_date
FROM
    plant
WHERE
    date_added > '2015-01-01'
GROUP BY
    location
ORDER BY
    plant_count DESC;
;