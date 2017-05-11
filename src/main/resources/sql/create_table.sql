DROP TABLE IF EXISTS role, character, card, player, event;


CREATE TABLE role
(
  role_id SERIAL PRIMARY KEY,
  name varchar(10),
  mission VARCHAR(100),
  amount INTEGER
);

CREATE TABLE character
(
  character_id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  initial_lives INTEGER,
  ability VARCHAR(200)
);

CREATE TABLE card
(
  card_id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  kind VARCHAR(50),
  effect VARCHAR(200),
  amount INTEGER
);

CREATE TABLE player
(
  player_id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  position INTEGER,
  role INTEGER,
  FOREIGN KEY (role) REFERENCES role(role_id),
  character INTEGER,
  FOREIGN KEY  (character) REFERENCES character(character_id),
  health INTEGER,
  gun INTEGER,
  FOREIGN KEY (gun) REFERENCES card(card_id),
  barrel BOOLEAN,
  mustang BOOLEAN,
  scope BOOLEAN,
  prison BOOLEAN,
  dynamite BOOLEAN
);

CREATE TABLE event
(
  event_id SERIAL PRIMARY KEY,
  turn INTEGER,
  player INTEGER,
  FOREIGN KEY (player) REFERENCES player(player_id),
  card INTEGER,
  FOREIGN KEY (card) REFERENCES card(card_id),
  target_player INTEGER,
  FOREIGN KEY (target_player) REFERENCES player(player_id)
);

INSERT INTO role(name, mission, amount) VALUES('Sheriff', 'kill the bad guys', 1);
INSERT INTO role(name, mission, amount) VALUES('Deputy', 'kill the bad guys', 2);
INSERT INTO role(name, mission, amount) VALUES('Bandit', 'kill the Sheriff', 3);
INSERT INTO role(name, mission, amount) VALUES('Renegade', 'kill everybody', 1);


INSERT INTO character(name, initial_lives, ability) VALUES('Bart Cassidy', 4, '');
INSERT INTO character(name, initial_lives, ability) VALUES('Black Jack', 4, '');
INSERT INTO character(name, initial_lives, ability) VALUES('Calamity Janet', 4, '');
INSERT INTO character(name, initial_lives, ability) VALUES('El Gringo', 3, '');
INSERT INTO character(name, initial_lives, ability) VALUES('Jesse Jones', 4, '');
INSERT INTO character(name, initial_lives, ability) VALUES('Jourdonnais', 4, '');
INSERT INTO character(name, initial_lives, ability) VALUES('Kit Carlson', 4, '');
INSERT INTO character(name, initial_lives, ability) VALUES('Lucky Duke', 4, '');
INSERT INTO character(name, initial_lives, ability) VALUES('Paul Regret', 3, '');
INSERT INTO character(name, initial_lives, ability) VALUES('Pedro Ramirez', 4, '');
INSERT INTO character(name, initial_lives, ability) VALUES('Rose Doolan', 4, '');
INSERT INTO character(name, initial_lives, ability) VALUES('Sid Ketchum', 4, '');
INSERT INTO character(name, initial_lives, ability) VALUES('Slab the Killer', 4, '');
INSERT INTO character(name, initial_lives, ability) VALUES('Suzy Lafayette', 4, '');
INSERT INTO character(name, initial_lives, ability) VALUES('Vulture Sam', 4, '');
INSERT INTO character(name, initial_lives, ability) VALUES('Willy the Kid', 4, '');


INSERT INTO card(name, kind, effect, amount) VALUES('Bang!', 'usable', '', 25);
INSERT INTO card(name, kind, effect, amount) VALUES('Missed!', 'usable', '', 12);
INSERT INTO card(name, kind, effect, amount) VALUES('Beer', 'usable', '', 6);
INSERT INTO card(name, kind, effect, amount) VALUES('Saloon', 'usable', '', 1);
INSERT INTO card(name, kind, effect, amount) VALUES('Stagecoach', 'usable', '', 2);
INSERT INTO card(name, kind, effect, amount) VALUES('Wells Fargo', 'usable', '', 1);
INSERT INTO card(name, kind, effect, amount) VALUES('General store', 'usable', '', 2);
INSERT INTO card(name, kind, effect, amount) VALUES('Panic!', 'usable', '', 4);
INSERT INTO card(name, kind, effect, amount) VALUES('Cat Balou', 'usable', '', 4);
INSERT INTO card(name, kind, effect, amount) VALUES('Gatling', 'usable', '', 1);
INSERT INTO card(name, kind, effect, amount) VALUES('Indians!', 'usable', '', 2);
INSERT INTO card(name, kind, effect, amount) VALUES('Duel', 'usable', '', 3);
INSERT INTO card(name, kind, effect, amount) VALUES('Mustang', 'item', '', 2);
INSERT INTO card(name, kind, effect, amount) VALUES('Scope', 'item', '', 1);
INSERT INTO card(name, kind, effect, amount) VALUES('Barrel', 'item', '', 2);
INSERT INTO card(name, kind, effect, amount) VALUES('Schofield', 'weapon', '', 3);
INSERT INTO card(name, kind, effect, amount) VALUES('Remington', 'weapon', '', 1);
INSERT INTO card(name, kind, effect, amount) VALUES('Rev. Carabine', 'weapon', '', 1);
INSERT INTO card(name, kind, effect, amount) VALUES('Winchester', 'weapon', '', 1);
INSERT INTO card(name, kind, effect, amount) VALUES('Volcanic', 'weapon', '', 2);
INSERT INTO card(name, kind, effect, amount) VALUES('Jail', 'punitive', '', 3);
INSERT INTO card(name, kind, effect, amount) VALUES('Dynamite', 'punitive', '', 1);


INSERT INTO player(name, position, role, character, health, gun, barrel, mustang, scope, prison, dynamite)
VALUES('Aladár', 1, 1, 1, 5, NULL, FALSE, FALSE, FALSE, FALSE, FALSE);
INSERT INTO player(name, position, role, character, health, gun, barrel, mustang, scope, prison, dynamite)
VALUES('Béla', 2, 2, 2, 4, NULL, FALSE, FALSE, FALSE, FALSE, FALSE);
INSERT INTO player(name, position, role, character, health, gun, barrel, mustang, scope, prison, dynamite)
VALUES('Cecil', 3, 3, 3, 4, NULL, FALSE, FALSE, FALSE, FALSE, FALSE);
INSERT INTO player(name, position, role, character, health, gun, barrel, mustang, scope, prison, dynamite)
VALUES('Dénes', 4, 4, 4, 3, NULL, FALSE, FALSE, FALSE, FALSE, FALSE);