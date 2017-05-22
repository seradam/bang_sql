-- Initialize players

DO $$
BEGIN

FOR i IN 1..4 LOOP
INSERT INTO player(name, position, role, character)
VALUES(CASE WHEN i = 1 THEN 'Aladár'
            WHEN i = 2 THEN 'Béla'
            WHEN i = 3 THEN 'Cecil'
            WHEN i = 4 THEN 'Dénes'
            END,
       i, i, i);
UPDATE player
SET health = CASE
             WHEN role = 1 THEN (SELECT initial_lives FROM character WHERE character_id =
                                (SELECT character FROM player WHERE player_id = i)) + 1
             ELSE (SELECT initial_lives FROM character WHERE character_id =
                  (SELECT character FROM player WHERE player_id = i))
             END
WHERE player_id = i;

-- remove player's role from the role table
UPDATE role
SET current_amount = current_amount -1
WHERE role_id = (SELECT role FROM player WHERE player_id = i);

-- remove player's character from the character table
UPDATE character
SET choosable = FALSE
WHERE character_id = (SELECT character FROM player WHERE player_id = i);
END LOOP;

END $$;


-- Draw cards before game:

INSERT INTO playing_field(player, card, location) VALUES (1,1,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 1;
INSERT INTO playing_field(player, card, location) VALUES (1,1,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 1;
INSERT INTO playing_field(player, card, location) VALUES (1,2,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 2;
INSERT INTO playing_field(player, card, location) VALUES (1,15,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 15;
INSERT INTO playing_field(player, card, location) VALUES (1,16,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 16;
INSERT INTO playing_field(player, card, location) VALUES (2,1,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 1;
INSERT INTO playing_field(player, card, location) VALUES (2,2,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 2;
INSERT INTO playing_field(player, card, location) VALUES (2,2,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 2;
INSERT INTO playing_field(player, card, location) VALUES (2,13,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 13;
INSERT INTO playing_field(player, card, location) VALUES (3,1,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 1;
INSERT INTO playing_field(player, card, location) VALUES (3,1,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 1;
INSERT INTO playing_field(player, card, location) VALUES (3,21,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 21;
INSERT INTO playing_field(player, card, location) VALUES (3,9,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 9;
INSERT INTO playing_field(player, card, location) VALUES (4,1,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 1;
INSERT INTO playing_field(player, card, location) VALUES (4,1,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 1;
INSERT INTO playing_field(player, card, location) VALUES (4,2,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 2;


-- Events of the game:
--1st turn:
-- player1's turn:
INSERT INTO playing_field(player, card, location) VALUES (1,1,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 1;
INSERT INTO playing_field(player, card, location) VALUES (1,22,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 22;
INSERT INTO event(turn, player, card) VALUES(1, 1, 15);
UPDATE playing_field SET location = 'board' WHERE player = 1 AND card = 15;
INSERT INTO event(turn, player, card) VALUES(1, 1, 16);
UPDATE playing_field SET location = 'board' WHERE player = 1 AND card = 16;
INSERT INTO event(turn, player, card, target_player) VALUES(1, 1, 1, 2);
DELETE FROM playing_field WHERE temporary_id = (SELECT temporary_id FROM playing_field
WHERE player = 1 AND card = 1 LIMIT 1);
DELETE FROM playing_field WHERE temporary_id = (SELECT temporary_id FROM playing_field
WHERE player = 2 AND card = 2 LIMIT 1);
--player2's turn:
INSERT INTO playing_field(player, card, location) VALUES (2,1,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 1;
INSERT INTO playing_field(player, card, location) VALUES (2,2,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 2;
INSERT INTO event(turn, player, card) VALUES(1, 2, 13);
UPDATE playing_field SET location = 'board' WHERE player = 2 AND card = 13;
INSERT INTO event(turn, player, card, target_player) VALUES(1, 2, 1, 3);
DELETE FROM playing_field WHERE temporary_id = (SELECT temporary_id FROM playing_field
WHERE player = 2 AND card = 1 LIMIT 1);
UPDATE player SET health = health -1 WHERE player_id = 3;
--player3's turn:
INSERT INTO playing_field(player, card, location) VALUES (3,1,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 1;
INSERT INTO playing_field(player, card, location) VALUES (3,2,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 2;
INSERT INTO event(turn, player, card, target_player) VALUES(1, 3, 1, 4);
DELETE FROM playing_field WHERE temporary_id = (SELECT temporary_id FROM playing_field
WHERE player = 3 AND card = 1 LIMIT 1);
DELETE FROM playing_field WHERE temporary_id = (SELECT temporary_id FROM playing_field
WHERE player = 4 AND card = 2 LIMIT 1);
INSERT INTO event(turn, player, card, target_player) VALUES(1, 3, 21, 2);
UPDATE playing_field SET location = 'board', player = 2 WHERE player = 3 AND card = 21;
INSERT INTO event(turn, player, card, target_player) VALUES(1, 3, 9, 1);
DELETE FROM playing_field WHERE player = 3 AND card = 9;
DELETE FROM playing_field WHERE player = 1 AND card = 15;
--player4's turn:
INSERT INTO playing_field(player, card, location) VALUES (4,1,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 1;
INSERT INTO playing_field(player, card, location) VALUES (4,2,'hand');
UPDATE card SET current_amount = current_amount -1 WHERE card_id = 2;
INSERT INTO event(turn, player, card, target_player) VALUES(1, 4, 1, 1);
DELETE FROM playing_field WHERE temporary_id = (SELECT temporary_id FROM playing_field
WHERE player = 4 AND card = 1 LIMIT 1);
DELETE FROM playing_field WHERE temporary_id = (SELECT temporary_id FROM playing_field
WHERE player = 1 AND card = 2 LIMIT 1);
--2nd turn:
