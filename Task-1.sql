-- Задание 1

INSERT INTO MusicGenre (Name)
VALUES('Шансон');

INSERT INTO Performer (GenreID, Name)
VALUES(5,'Ирина Аллегрова');

INSERT INTO MusicGenrePerformer (GenreID, PerformerID)
VALUES(5, 10);

INSERT INTO Album (PerformerID, Name, ProductionYear)
VALUES(4,'The Best', 2002);

INSERT INTO AlbumPerformer (AlbumID, PerformerID)
VALUES(18, 10);

INSERT INTO Trek (Name, AlbumID, Duration)
VALUES('Суженый мой', 18, '3:29');

INSERT INTO Playlist (Name, ProductionYear)
VALUES('Mix_1', 2018);

INSERT INTO PlaylistTrek (PlaylistID, TrekID)
VALUES(8, 34);