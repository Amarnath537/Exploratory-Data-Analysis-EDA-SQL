-- #1 Database Exploration
-- Explore all objects in the Database
SELECT * FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'datawarehouseanalytics_db';

-- Explore all columns in the Database
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'datawarehouseanalytics_db';
