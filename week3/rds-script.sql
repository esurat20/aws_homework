CREATE DATABASE TOR;

CREATE TABLE CHARACTERS (
  ID INTEGER PRIMARY KEY,
  NAME VARCHAR(200)
);

INSERT INTO CHARACTERS (ID, NAME) VALUES
    (1, 'Loki'),
    (2, 'Jane Foster');

SELECT * FROM CHARACTERS;