CREATE TABLE movies (
    ID SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL DEFAULT '',
    imdb bool NOT NULL DEFAULT false
);

INSERT INTO
    movies (title)
VALUES
    ('Inception');