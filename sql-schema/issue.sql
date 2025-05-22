-- issue table schema
-- sql query to create issue table
CREATE TABLE issue (
    issue_id INT AUTO_INCREMENT PRIMARY KEY,
    issue_description TEXT NOT NULL,
    issue_status ENUM('pending', 'in_progress', 'resolved') NOT NULL DEFAULT 'pending',
    issue_admin_comment TEXT,
    image_data blob,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    CONSTRAINT fk_issue_user FOREIGN KEY (user_id) REFERENCES user(user_id),
    CONSTRAINT fk_issue_category FOREIGN KEY (category_id) REFERENCES category(category_id)
);