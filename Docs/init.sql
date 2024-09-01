



#CREATE USER 'notes_user1'@'%' IDENTIFIED BY 'notes_user1';
#CREATE USER 'notes_user1' IDENTIFIED BY 'notes_user1';



#SELECT User FROM mysql.global_priv;

#SELECT * FROM INFORMATION_SCHEMA.USER_PRIVILEGES  GROUP BY GRANTEE;


CREATE DATABASE IF NOT EXISTS notes_manager;

#CREATE USER 'notes_user1' IDENTIFIED BY 'notes_user1';
#GRANT ALL PRIVILEGES ON notes_manager.* TO 'notes_user1'@'%' WITH GRANT OPTION;





CREATE TABLE IF NOT EXISTS notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    importance INT NOT NULL CHECK (importance >= 1 AND importance <= 5),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)



USE notes_manager;

CREATE TABLE IF NOT EXISTS notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    importance INT NOT NULL CHECK (importance >= 1 AND importance <= 5),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
