DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS character;
DROP TABLE IF EXISTS card;


CREATE TABLE player
(
player_id SERIAL PRIMARY KEY,
name VARCHAR(50),
role VARCHAR(10),
character VARCHAR(50)
);

CREATE TABLE role
(
  role_id INTEGER,
  name varchar(10),
  mission VARCHAR(100),
  amount INTEGER
);

CREATE TABLE character
(
  name VARCHAR(50),
  initial_lives INTEGER,
  ability VARCHAR(200)
);

CREATE TABLE card
(
  name VARCHAR(50),
  kind VARCHAR(50),
  effect VARCHAR(200),
  amount INTEGER
);

