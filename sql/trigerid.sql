-- loon logitabeli
CREATE TABLE plant_log (
id INT PRIMARY KEY AUTO_INCREMENT,
plant_id INT,
old_status VARCHAR(255),
new_status VARCHAR(255),
changed_by VARCHAR(255),
changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- loon after update triggeri
CREATE TRIGGER after_plant_update
    AFTER UPDATE ON plant
    FOR EACH ROW
BEGIN
    INSERT INTO plant_log (plant_id, old_status, new_status, changed_by, changed_at)
    VALUES (OLD.id, OLD.name,   NEW.name ,USER(), NOW());
END;

-- andmete terviklikkuse tabel
CREATE TRIGGER before_insert_plants
    BEFORE INSERT ON plant
    FOR EACH ROW
BEGIN
    -- Kontrolli, et taime nimi ei ole tühi
    IF NEW.name IS NULL OR NEW.name = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Taime nimi ei tohi olla tühi';
    END IF;

    -- Kui `date_added` puudub, määra sellele praegune kuupäev
    IF NEW.date_added IS NULL THEN
        SET NEW.date_added = CURRENT_DATE;
    END IF;
END;