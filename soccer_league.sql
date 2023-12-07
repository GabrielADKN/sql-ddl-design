DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE league
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(255),
    number_of_teams INTEGER,
    number_of_players INTEGER,
    number_of_matches INTEGER,
    number_of_referees INTEGER
);

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    rank INTEGER,
    points INTEGER,
    league_id INTEGER REFERENCES league
);

CREATE TABLE refrees
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    number_of_matches INTEGER,
    league_id INTEGER REFERENCES league
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INTEGER,
    position VARCHAR(255),
    team_id INTEGER REFERENCES teams
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    date DATE,
    time TIME,
    location VARCHAR(255),
    home_team_id INTEGER REFERENCES teams,
    away_team_id INTEGER REFERENCES teams,
    referee_id INTEGER REFERENCES refrees
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    time TIME,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches
);

INSERT INTO league (name, country, number_of_teams, number_of_players, number_of_matches, number_of_referees)
VALUES ('Premier League', 'England', 20, 200, 1000, 10),
       ('La Liga', 'Spain', 20, 200, 1000, 10),
       ('Bundesliga', 'Germany', 20, 200, 1000, 10),
       ('Serie A', 'Italy', 20, 200, 1000, 10),
       ('Ligue 1', 'France', 20, 200, 1000, 10),
       ('Ligue 2', 'Belgium', 20, 200, 1000, 10);

INSERT INTO teams (name, points, league_id)
VALUES ('Manchester United', 10, 1),
       ('Liverpool', 20, 1),
       ('Chelsea', 30, 1),
       ('Arsenal', 40, 1),
       ('Manchester City', 50, 1),
       ('Real Madrid', 10, 2),
       ('Barcelona', 20, 2),
       ('Atletico Madrid', 30, 2),
       ('Sevilla', 40, 2),
       ('Valencia', 50, 2),
       ('Bayern Munich', 10, 3),
       ('Borussia Dortmund', 20, 3),
       ('RB Leipzig', 30, 3),
       ('Bayer Leverkusen', 40, 3),
       ('Borussia Monchengladbach', 50, 3),
       ('Juventus', 10, 4),
       ('Inter Milan', 20, 4),
       ('AC Milan', 30, 4),
       ('Napoli', 40, 4),
       ('Roma', 50, 4),
       ('Paris Saint-Germain', 10, 5),
       ('Lille', 20, 5),
       ('Lyon', 30, 5),
       ('Monaco', 40, 5),
       ('Montpellier', 50, 5),
       ('Club Brugge', 10, 6),
       ('Gent', 20, 6),
       ('Standard Liege', 30, 6),
       ('Anderlecht', 40, 6),
       ('Genk', 50, 6);

INSERT INTO refrees (name, number_of_matches, league_id)
VALUES ('Jonh', 200, 1),
       ('Jane', 200, 2),
       ('Lucas', 200, 3),
       ('Gabriel', 200, 4),
       ('Ben', 200, 1),
       ('Jeny', 200, 2),
       ('Alex', 200, 3);

INSERT INTO players (name, age, position, team_id)
VALUES ('lloris', 25, 'Goalkeeper', 1),
       ('lionel', 25, 'Defender', 1),
       ('nani', 25, 'Midfielder', 2),
       ('messi', 25, 'striker', 2),
       ('ronaldo', 25, 'Goalkeeper', 3),
       ('neymar', 25, 'Defender', 3),
       ('suarez', 25, 'Midfielder', 4),
       ('hazard', 25, 'striker', 4),
       ('kane', 25, 'Goalkeeper', 5),
       ('pogba', 25, 'Defender', 5),
       ('mbappe', 25, 'Midfielder', 6),
       ('griezmann', 25, 'striker', 6),
       ('lewandowski', 25, 'Goalkeeper', 1),
       ('kroos', 25, 'Defender', 2),
       ('modric', 25, 'Midfielder', 3),
       ('bale', 25, 'striker', 4),
       ('hummels', 25, 'Goalkeeper', 5),
       ('reus', 25, 'Defender', 6),
       ('aubameyang', 25, 'Midfielder', 1),
       ('gotze', 25, 'striker', 4),
       ('dybala', 25, 'Goalkeeper', 5),
       ('icardi', 25, 'Defender', 3),
       ('higuain', 25, 'Midfielder', 2),
       ('douglas', 25, 'striker', 1),
       ('cavani', 25, 'Goalkeeper', 3),
       ('verratti', 25, 'Defender', 3),
       ('di maria', 25, 'Midfielder', 4),
       ('draxler', 25, 'striker', 4),
       ('hazard', 25, 'Goalkeeper', 5),
       ('de bruyne', 25, 'Defender', 5),
       ('lukaku', 25, 'Midfielder', 6),
       ('mertens', 25, 'striker', 6),
       ('mbappe', 25, 'Goalkeeper', 5),
       ('griezmann', 25, 'Defender', 5),
       ('pogba', 25, 'Midfielder', 6),
       ('kante', 25, 'striker', 1);

INSERT INTO matches (date, time, location, home_team_id, away_team_id, referee_id)
VALUES ('2018-07-07', '12:00:00', 'London', 1, 2, 1),
       ('2018-07-07', '12:00:00', 'London', 1, 3, 2),
       ('2018-07-07', '12:00:00', 'London', 1, 4, 3),
       ('2018-07-07', '12:00:00', 'London', 1, 5, 4),
       ('2018-07-07', '12:00:00', 'London', 1, 6, 5),
       ('2018-07-07', '12:00:00', 'London', 2, 1, 6),
       ('2018-07-07', '12:00:00', 'London', 2, 3, 7),
       ('2018-07-07', '12:00:00', 'London', 2, 4, 1),
       ('2018-07-07', '12:00:00', 'London', 2, 5, 2),
       ('2018-07-07', '12:00:00', 'London', 2, 6, 1),
       ('2018-07-07', '12:00:00', 'London', 3, 1, 1),
       ('2018-07-07', '12:00:00', 'London', 3, 2, 2),
       ('2018-07-07', '12:00:00', 'London', 3, 4, 3),
       ('2018-07-07', '12:00:00', 'London', 3, 5, 4),
       ('2018-07-07', '12:00:00', 'London', 3, 6, 5),
       ('2018-07-07', '12:00:00', 'London', 4, 1, 6),
       ('2018-07-07', '12:00:00', 'London', 4, 2, 7),
       ('2018-07-07', '12:00:00', 'London', 4, 3, 4),
       ('2018-07-07', '12:00:00', 'London', 4, 5, 3),
       ('2018-07-07', '12:00:00', 'London', 4, 6, 1),
       ('2018-07-07', '12:00:00', 'London', 5, 1, 1),
       ('2018-07-07', '12:00:00', 'London', 5, 2, 2),
       ('2018-07-07', '12:00:00', 'London', 5, 3, 3),
       ('2018-07-07', '12:00:00', 'London', 5, 4, 4),
       ('2018-07-07', '12:00:00', 'London', 5, 6, 5);

INSERT INTO goals (time, player_id, match_id)
VALUES ('12:00:00', 1, 1),
       ('12:00:00', 2, 1),
       ('12:00:00', 3, 2),
       ('12:00:00', 4, 2),
       ('12:00:00', 5, 3),
       ('12:00:00', 6, 3),
       ('12:00:00', 7, 4),
       ('12:00:00', 8, 4),
       ('12:00:00', 9, 5),
       ('12:00:00', 10, 5),
       ('12:00:00', 11, 6),
       ('12:00:00', 12, 6),
       ('12:00:00', 13, 7),
       ('12:00:00', 14, 7),
       ('12:00:00', 15, 8),
       ('12:00:00', 16, 8),
       ('12:00:00', 17, 9),
       ('12:00:00', 18, 9),
       ('12:00:00', 19, 10),
       ('12:00:00', 20, 10),
       ('12:00:00', 21, 11),
       ('12:00:00', 22, 11),
       ('12:00:00', 23, 12),
       ('12:00:00', 24, 12),
       ('12:00:00', 25, 13),
       ('12:00:00', 26, 13),
       ('12:00:00', 27, 14),
       ('12:00:00', 28, 14),
       ('12:00:00', 29, 5),
       ('12:00:00', 30, 5),
       ('12:00:00', 31, 6),
       ('12:00:00', 32, 6),
       ('12:00:00', 33, 7),
       ('12:00:00', 34, 7),
       ('12:00:00', 35, 8);


-- The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).
-- SELECT name, rank
-- FROM teams
-- WHERE league_id = 1
-- ORDER BY points ASC;