CREATE TABLE Member (
    number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    passwd VARCHAR(255) NOT NULL,
    uname VARCHAR(50) NOT NULL
);

CREATE TABLE Likes (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cname VARCHAR(20) NOT NULL,
    uname VARCHAR(50) NOT NULL
);

INSERT INTO Member (uname, password, email) VALUES ('test', '1234', 'test2@test.com');