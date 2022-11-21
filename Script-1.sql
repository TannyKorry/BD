CREATE TABLE IF NOT EXISTS Collections(
	id SERIAL PRIMARY KEY,
	name VARCHAR(80),
	productionyear INTEGER,
	trekID INTEGER NOT NULL REFERENCES trek(id),
	albumID INTEGER NOT NULL REFERENCES album(id)
);


DELETE FROM trek 
WHERE id=6;

UPDATE performer 
SET Name = 'Мельница'
WHERE id=7;

INSERT INTO performer (GenreID, Name)
VALUES(4, 'Louis Armstrong');

SELECT * FROM collection;

INSERT INTO album (performerid, Name, productionyear)
VALUES(2,'Metallica', 1991);

INSERT INTO trek (albumid, Name, duration)
VALUES(13,'The Unforgiven', '6:27');

UPDATE collection  
SET Trekid  = 5
WHERE id=1;

INSERT INTO musicgenreperformer  (performerid,genreid)
VALUES(1, 1);

INSERT INTO collection (id,"name",productionyear ,albumid,  trekID)
VALUES(1,'Mix1',2021,1, 1);

ALTER TABLE collection
ADD COLUMN trekID INTEGER;

DROP table collection;
