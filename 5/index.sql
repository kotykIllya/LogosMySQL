CREATE DATABASE IF NOT EXISTS football_club;

USE football_club;

CREATE TABLE IF NOT EXISTS club_owner (
    club_owner_id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    amount_of_money INT NOT NULL,
    PRIMARY KEY (club_owner_id)
);

CREATE TABLE IF NOT EXISTS coach (
    coach_id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    PRIMARY KEY (coach_id),
    club_owner_id INT UNIQUE,
    FOREIGN KEY (club_owner_id) REFERENCES club_owner(club_owner_id)
);

CREATE TABLE IF NOT EXISTS players (
    players_id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (players_id),
    coach_id INT NOT NULL,
    FOREIGN KEY (coach_id) REFERENCES coach(coach_id)
);


CREATE TABLE IF NOT EXISTS position_of_player (
    position_of_player_id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(50) NOT NULL,
    PRIMARY KEY (position_of_player_id)
);

CREATE TABLE IF NOT EXISTS players_position_of_player (
    players_id INT NOT NULL,
    position_of_player_id INT NOT NULL,
    CONSTRAINT id PRIMARY KEY (players_id, position_of_player_id),
    FOREIGN KEY (players_id) REFERENCES players(players_id),
    FOREIGN KEY (position_of_player_id) REFERENCES position_of_player(position_of_player_id)
);

INSERT INTO club_owner (name, amount_of_money)
VALUES
    ('Vasiliy Petrovich', 255000000),
    ('Bogdan Oleksandrovych', 365000000);

INSERT INTO coach (name, nationality, club_owner_id)
VALUES
    ('Francesco Totti', 'Italian', 1),
    ('Jose Bohres', 'Portugal', 2);

INSERT INTO players (name, age, coach_id)
VALUES
    ('Gareth Bale', 27, 2),
    ('Radja Naingolan', 29, 2),
    ('Oleksandr Zinchenko', 21, 2),
    ('Leonardo Gatusso', 18, 1),
    ('Fernando Torres', 34, 2),
    ('Aaron Ramsey', 27, 1),
    ('Olivier Geroud', 27, 1),
    ('Karim Benzema', 27, 1),
    ('Andriy Lunin', 19, 1),
    ('Ganluigi Buffon', 40, 2);

INSERT INTO position_of_player (name, type)
VALUES
    ('RM', 'Midfielder'),
    ('CM', 'Midfielder'),
    ('CF', 'Offencive'),
    ('S', 'Offencive'),
    ('DM', 'Defensive'),
    ('AM', 'Midfielder'),
    ('GK', 'Defensive');

INSERT INTO players_position_of_player (players_id, position_of_player_id)
VALUES
    (1, 1),
    (3, 2),
    (2, 5),
    (4, 3),
    (4, 2),
    (7, 4),
    (6, 2),
    (5, 3),
    (10, 7),
    (8, 3),
    (9, 7);

SELECT * FROM players WHERE age > 25;
SELECT * FROM players WHERE age = (SELECT MAX(age) FROM players);
SELECT SUM(amount_of_money) FROM club_owner;
SELECT * FROM position_of_player WHERE type = 'Midfielder';

SELECT * FROM players INNER JOIN coach ON players.coach_id = coach.coach_id WHERE players.coach_id = 2;

SELECT * FROM club_owner INNER JOIN coach ON club_owner.club_owner_id = coach.club_owner_id WHERE coach.coach_id = 1;

SELECT * FROM players_position_of_player INNER JOIN players
    ON players_position_of_player.players_id = players.players_id WHERE players_position_of_player.position_of_player_id = 2;

SELECT * FROM players INNER JOIN players_position_of_player
    ON players.players_id = players_position_of_player.players_id WHERE players.name = 'Olivier Geroud';

SELECT * FROM position_of_player INNER JOIN players_position_of_player ON position_of_player.position_of_player_id =
    players_position_of_player.position_of_player_id WHERE position_of_player.name = 'DM';