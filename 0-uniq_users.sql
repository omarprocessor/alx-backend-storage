-- Task: Create a users table with unique email attribute and auto-incrementing ID
-- This script creates the 'users' table if it doesn't exist already.

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255)
);
