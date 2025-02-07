-- Create the database
CREATE DATABASE IF NOT EXISTS maintenance_db;
USE maintenance_db;

-- Create the equipment maintenance table
CREATE TABLE IF NOT EXISTS maintenance_schedule (
    equipment_id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_name VARCHAR(255) NOT NULL,
    criteria_for_maintenance INT NOT NULL,  -- Number of days for next maintenance
    previous_maintenance_date DATE NOT NULL,
    due_maintenance_date DATE GENERATED ALWAYS AS (DATE_ADD(previous_maintenance_date, INTERVAL criteria_for_maintenance DAY)) STORED
);

INSERT INTO maintenance_schedule (equipment_name, criteria_for_maintenance, previous_maintenance_date)
VALUES
('Generator', 30, '2024-01-01'),
('Air Conditioner', 90, '2024-02-10'),
('Transformer', 180, '2023-11-15');
