-- Species data
HMSET species:1 id 1 name "Monstera"
HMSET species:2 id 2 name "Pothos"
HMSET species:3 id 3 name "Snake Plant"
HMSET species:4 id 4 name "Peace Lily"

-- Fertilizer types
HMSET fertilizer_type:1 id 1 name "Universal Plant Food"
HMSET fertilizer_type:2 id 2 name "Organic Fertilizer"

-- Plants
HMSET plant:1 id 1 name "Monty" species_id 1 date_added "2024-01-10" location "Living Room"
HMSET plant:2 id 2 name "Potty" species_id 2 date_added "2024-01-12" location "Kitchen"
HMSET plant:3 id 3 name "Snakey" species_id 3 date_added "2024-01-15" location "Bedroom"
HMSET plant:4 id 4 name "Lily" species_id 4 date_added "2024-01-17" location "Office"

-- Watering records (using lists for dates)
RPUSH plant:1:watering_dates "2024-01-11" "2024-01-15" "2024-01-19"
RPUSH plant:2:watering_dates "2024-01-13" "2024-01-17"

-- Also store as hash for additional data if needed
HMSET watering:1 id 1 plant_id 1 watering_date "2024-01-11"
HMSET watering:2 id 2 plant_id 1 watering_date "2024-01-15"
HMSET watering:3 id 3 plant_id 2 watering_date "2024-01-13"
HMSET watering:4 id 4 plant_id 2 watering_date "2024-01-17"

-- Fertilizing records
HMSET fertilizing:1 id 1 plant_id 1 fertilizing_date "2024-01-12" fertilizer_type 1
HMSET fertilizing:2 id 2 plant_id 2 fertilizing_date "2024-01-14" fertilizer_type 2

-- Store fertilizing dates in a list for easy access
RPUSH plant:1:fertilizing_date "2024-01-12"
RPUSH plant:2:fertilizing_date "2024-01-14"