-- inquiry table schema
-- sql query to create inquiry table
CREATE TABLE inquiry (
    inquiry_id INT AUTO_INCREMENT PRIMARY KEY,
    inquiry_name VARCHAR(100) NOT NULL,
    inquiry_message TEXT NOT NULL,
    inquiry_submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT NOT NULL,
    CONSTRAINT fk_inquiry_user FOREIGN KEY (user_id) REFERENCES user(user_id)
);
