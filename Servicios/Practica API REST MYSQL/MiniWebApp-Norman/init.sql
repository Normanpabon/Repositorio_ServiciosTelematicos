
CREATE DATABASE myflaskapp;
use myflaskapp;



CREATE TABLE users (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(255),
    email varchar(255),
    username varchar(255),
    password varchar(255)
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price FLOAT NOT NULL,
    description VARCHAR(255)
);

CREATE USER 'flaskAdmin'@'localhost' IDENTIFIED BY '1234567';


GRANT ALL PRIVILEGES ON myflaskapp.* TO 'flaskAdmin'@'localhost';

INSERT INTO products VALUES(null, "pan", 2500, "pan de 2500");


INSERT INTO users VALUES(null, "juan", "juan@gmail.com", "juan", "123"),
    (null, "maria", "maria@gmail.com", "maria", "456");
