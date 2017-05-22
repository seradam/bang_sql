DROP TABLE IF EXISTS role, character, card, player, event, playing_field;


CREATE TABLE role
(
  role_id SERIAL PRIMARY KEY,
  name varchar(10),
  mission VARCHAR(100),
  initial_amount INTEGER,
  current_amount INTEGER
);

CREATE TABLE character
(
  character_id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  initial_lives INTEGER,
  ability VARCHAR(200),
  choosable BOOLEAN
);

CREATE TABLE card
(
  card_id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  kind VARCHAR(50),
  effect VARCHAR(200),
  initial_amount INTEGER,
  current_amount INTEGER
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
  health INTEGER
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

CREATE TABLE playing_field
(
  temporary_id SERIAL PRIMARY KEY,
  player INTEGER,
  FOREIGN KEY (player) REFERENCES player(player_id),
  card INTEGER,
  FOREIGN KEY (card) REFERENCES card(card_id),
  location VARCHAR(5)
);

INSERT INTO role(name, mission, initial_amount, current_amount) VALUES('Sheriff', 'kill the bad guys', 1, 1);
INSERT INTO role(name, mission, initial_amount, current_amount) VALUES('Deputy', 'kill the bad guys', 2, 2);
INSERT INTO role(name, mission, initial_amount, current_amount) VALUES('Bandit', 'kill the Sheriff', 3, 3);
INSERT INTO role(name, mission, initial_amount, current_amount) VALUES('Renegade', 'kill everybody', 1, 1);


INSERT INTO character(name, initial_lives, ability, choosable) VALUES('Bart Cassidy', 4, '', TRUE );
INSERT INTO character(name, initial_lives, ability, choosable) VALUES('Black Jack', 4, '', TRUE );
INSERT INTO character(name, initial_lives, ability, choosable) VALUES('Calamity Janet', 4, '', TRUE );
INSERT INTO character(name, initial_lives, ability, choosable) VALUES('El Gringo', 3, '', TRUE );
INSERT INTO character(name, initial_lives, ability, choosable) VALUES('Jesse Jones', 4, '', TRUE );
INSERT INTO character(name, initial_lives, ability, choosable) VALUES('Jourdonnais', 4, '', TRUE );
INSERT INTO character(name, initial_lives, ability, choosable) VALUES('Kit Carlson', 4, '', TRUE );
INSERT INTO character(name, initial_lives, ability, choosable) VALUES('Lucky Duke', 4, '', TRUE );
INSERT INTO character(name, initial_lives, ability, choosable) VALUES('Paul Regret', 3, '', TRUE );
INSERT INTO character(name, initial_lives, ability, choosable) VALUES('Pedro Ramirez', 4, '', TRUE );
INSERT INTO character(name, initial_lives, ability, choosable) VALUES('Rose Doolan', 4, '', TRUE );
INSERT INTO character(name, initial_lives, ability, choosable) VALUES('Sid Ketchum', 4, '', TRUE );
INSERT INTO character(name, initial_lives, ability, choosable) VALUES('Slab the Killer', 4, '', TRUE );
INSERT INTO character(name, initial_lives, ability, choosable) VALUES('Suzy Lafayette', 4, '', TRUE );
INSERT INTO character(name, initial_lives, ability, choosable) VALUES('Vulture Sam', 4, '', TRUE );
INSERT INTO character(name, initial_lives, ability, choosable) VALUES('Willy the Kid', 4, '', TRUE );


INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Bang!', 'usable', '', 25, 25);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Missed!', 'usable', '', 12, 12);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Beer', 'usable', '', 6, 6);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Saloon', 'usable', '', 1, 1);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Stagecoach', 'usable', '', 2, 2);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Wells Fargo', 'usable', '', 1, 1);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('General store', 'usable', '', 2, 2);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Panic!', 'usable', '', 4, 4);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Cat Balou', 'usable', '', 4, 4);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Gatling', 'usable', '', 1, 1);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Indians!', 'usable', '', 2, 2);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Duel', 'usable', '', 3, 3);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Mustang', 'item', '', 2, 2);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Scope', 'item', '', 1, 1);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Barrel', 'item', '', 2, 2);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Schofield', 'weapon', '', 3, 3);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Remington', 'weapon', '', 1, 1);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Rev. Carabine', 'weapon', '', 1, 1);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Winchester', 'weapon', '', 1, 1);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Volcanic', 'weapon', '', 2, 2);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Jail', 'punitive', '', 3, 3);
INSERT INTO card(name, kind, effect, initial_amount, current_amount) VALUES('Dynamite', 'punitive', '', 1, 1);




