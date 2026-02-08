CREATE TABLE users (
user_id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL
);

CREATE TABLE movies (
movie_id SERIAL PRIMARY KEY,
title VARCHAR(100) NOT NULL
);

CREATE TABLE ratings (
user_id INT REFERENCES users(user_id),
movie_id INT REFERENCES movies(movie_id),
rating INT CHECK (rating >= 1 AND rating <= 5),
PRIMARY KEY (user_id, movie_id)
);

INSERT INTO movies (title)
VALUES ('Sinners'), ('One battle after another'), ('The Housemaid'), ('Marty Supreme'), ('F1: The movie'), ('Avatar: Fire and Ash');

INSERT INTO users (name)
VALUES ('Alice'), ('Bob'), ('Charlie'), ('Dana'), ('Eli');

INSERT INTO ratings (user_id, movie_id, rating) VALUES 
(1, 1, 5), (1, 2, 4), (1, 3, 5), (1, 4, 3), (1, 5, 4), (1, 6, 5),
(2, 1, 3), (2, 2, NULL), (2, 3, 4), (2, 4, NULL), (2, 5, 2), (2, 6, 4),
(3, 1, 4), (3, 6, 5),
(4, 2, 3), (4, 3, 4), (4, 4, 5), (4, 6, 4),
(5, 1, 2), (5, 5, 3), (5, 6, 5);

SELECT 
u.name AS person, 
m.title AS movie, 
r.rating
FROM ratings r
JOIN users u ON r.user_id = u.user_id
JOIN movies m ON r.movie_id = m.movie_id
ORDER BY person;