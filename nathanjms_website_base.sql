-- -------------------------------------------------------------
-- TablePlus 3.12.8(368)
--
-- https://tableplus.com/
--
-- Database: nathanjms_website
-- Generation Time: 2021-06-06 15:08:43.1240
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."imdb_movies";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."imdb_movies" (
    "title" varchar(255) NOT NULL,
    "rank" int4 NOT NULL,
    PRIMARY KEY ("title")
);

DROP TABLE IF EXISTS "public"."imdb_movies_seen";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS imdb_movies_seen_id_seq;

-- Table Definition
CREATE TABLE "public"."imdb_movies_seen" (
    "id" int4 NOT NULL DEFAULT nextval('imdb_movies_seen_id_seq'::regclass),
    "imdb_movie_id" int4 NOT NULL,
    "group_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."movie_group_members";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS movie_group_members_id_seq;

-- Table Definition
CREATE TABLE "public"."movie_group_members" (
    "id" int4 NOT NULL DEFAULT nextval('movie_group_members_id_seq'::regclass),
    "user_id" int4 NOT NULL,
    "group_id" int4 NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."movie_groups";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS movie_groups_id_seq;

-- Table Definition
CREATE TABLE "public"."movie_groups" (
    "id" int4 NOT NULL DEFAULT nextval('movie_groups_id_seq'::regclass),
    "name" varchar(64) NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."movies";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS movies_id_seq;

-- Table Definition
CREATE TABLE "public"."movies" (
    "id" int4 NOT NULL DEFAULT nextval('movies_id_seq'::regclass),
    "title" varchar(255) NOT NULL,
    "group_id" int4 NOT NULL,
    "seen" bool NOT NULL DEFAULT false,
    "rating" int4,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "id" int4 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    "firebase_id" varchar(64) NOT NULL,
    "name" varchar(100),
    PRIMARY KEY ("id")
);

INSERT INTO "public"."imdb_movies" ("title", "rank") VALUES
('12 Angry Men', 7),
('2001: A Space Odyssey', 94),
('A Clockwork Orange', 67),
('Alien', 40),
('Aliens', 56),
('All About Eve', 95),
('Amadeus', 93),
('American Beauty', 58),
('American History X', 33),
('Amélie', 69),
('Apocalypse Now', 34),
('Back to the Future', 44),
('Bicycle Thieves', 85),
('Braveheart', 83),
('Casablanca', 25),
('Chinatown', 86),
('Cinema Paradiso', 74),
('Citizen Kane', 48),
('City Lights', 38),
('City of God', 21),
('Das Boot', 72),
('Django Unchained', 53),
('Double Indemnity', 54),
('Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb', 39),
('Eternal Sunshine of the Spotless Mind', 80),
('Fight Club', 10),
('Forrest Gump', 18),
('Full Metal Jacket', 81),
('Gladiator', 60),
('Goodfellas', 15),
('Grave of the Fireflies', 99),
('Inception', 14),
('Indiana Jones and the Last Crusade', 100),
('It''s a Wonderful Life', 29),
('L.A. Confidential', 84),
('Lawrence of Arabia', 68),
('Life Is Beautiful', 45),
('Léon: The Professional', 31),
('M', 50),
('Memento', 37),
('Metropolis', 90),
('Modern Times', 41),
('Monty Python and the Holy Grail', 89),
('North by Northwest', 43),
('Oldboy', 82),
('Once Upon a Time in America', 78),
('Once Upon a Time in the West', 24),
('One Flew Over the Cuckoo''s Nest', 13),
('Paths of Glory', 51),
('Princess Mononoke', 88),
('Psycho', 30),
('Pulp Fiction', 4),
('Raiders of the Lost Ark', 27),
('Rashomon', 91),
('Rear Window', 28),
('Requiem for a Dream', 79),
('Reservoir Dogs', 71),
('Saving Private Ryan', 36),
('Schindler''s List', 8),
('Se7en', 22),
('Seven Samurai', 17),
('Singin'' in the Rain', 87),
('Some Like It Hot', 92),
('Spirited Away', 42),
('Star Wars', 16),
('Star Wars: Episode V - The Empire Strikes Back', 11),
('Star Wars: Episode VI - Return of the Jedi', 75),
('Sunset Blvd.', 32),
('Taxi Driver', 57),
('Terminator 2: Judgment Day', 35),
('The Apartment', 98),
('The Dark Knight', 6),
('The Dark Knight Rises', 55),
('The Departed', 49),
('The Godfather', 2),
('The Godfather: Part II', 3),
('The Good, the Bad and the Ugly', 5),
('The Great Dictator', 65),
('The Green Mile', 59),
('The Intouchables', 61),
('The Lion King', 73),
('The Lives of Others', 63),
('The Lord of the Rings: The Fellowship of the Ring', 12),
('The Lord of the Rings: The Return of the King', 9),
('The Lord of the Rings: The Two Towers', 20),
('The Matrix', 19),
('The Pianist', 47),
('The Prestige', 66),
('The Shawshank Redemption', 1),
('The Shining', 46),
('The Silence of the Lambs', 23),
('The Sting', 97),
('The Third Man', 77),
('The Treasure of the Sierra Madre', 76),
('The Usual Suspects', 26),
('To Kill a Mockingbird', 70),
('Toy Story 3', 64),
('Vertigo', 52),
('WALL·E', 62),
('Witness for the Prosecution', 96);

INSERT INTO "public"."movie_group_members" ("id", "user_id", "group_id") VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 5, 2);

INSERT INTO "public"."movie_groups" ("id", "name") VALUES
(1, 'Group 1'),
(2, 'Group 2');

INSERT INTO "public"."movies" ("id", "title", "group_id", "seen", "rating") VALUES
(1, 'TestMovie', 1, 't', NULL),
(2, 'Movie 1', 1, 't', NULL),
(3, 'Movie 2', 1, 'f', NULL),
(4, 'Movie 3', 1, 'f', NULL),
(5, 'Movie 4', 1, 'f', NULL),
(6, 'Movie 5', 1, 'f', NULL),
(7, 'Movie 6', 1, 'f', NULL),
(8, 'Movie 7', 1, 'f', NULL),
(9, 'Movie 8', 1, 'f', NULL),
(10, 'Movie 9', 1, 't', NULL),
(11, 'Movie 10', 1, 'f', NULL),
(13, 'Movie 11', 2, 't', NULL),
(14, 'Movie 12', 2, 'f', NULL),
(15, 'Movie 13', 2, 'f', NULL),
(16, 'Movie 14', 2, 'f', NULL),
(17, 'Movie 15', 2, 'f', NULL),
(18, 'Movie 16', 1, 't', NULL);

INSERT INTO "public"."users" ("id", "firebase_id", "name") VALUES
(1, '', 'NathanDev');