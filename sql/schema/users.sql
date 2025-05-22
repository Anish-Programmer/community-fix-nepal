-- users table schema
-- sql query to create users table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('citizen', 'admin') NOT NULL DEFAULT 'citizen',
    email VARCHAR(100),
    phone VARCHAR(20),
    CONSTRAINT chk_username CHECK (username REGEXP '^[a-zA-Z0-9]{3,20}$'),
    CONSTRAINT chk_password CHECK (LENGTH(password) >= 6)
);

