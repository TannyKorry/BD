
--Создание таблиц

CREATE TABLE IF NOT EXISTS MusicGenre(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Performer(
	id SERIAL PRIMARY KEY,
	name VARCHAR(120) NOT NULL
);


CREATE TABLE IF NOT EXISTS MusicGenrePerformer(
	GenreID INTEGER REFERENCES MusicGenre(id),
	PerformerID INTEGER REFERENCES Performer(id),
	CONSTRAINT pk PRIMARY KEY (GenreID, PerformerID)
);

CREATE TABLE IF NOT EXISTS Album(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	ProductuonYear NUMERIC
);

CREATE TABLE IF NOT EXISTS AlbumPerformer(
	AlbumID INTEGER REFERENCES Album(id),
	PerformerID INTEGER REFERENCES Performer(id),
	CONSTRAINT pkap PRIMARY KEY (AlbumID, PerformerID)
);

CREATE TABLE IF NOT EXISTS Trek(
	id SERIAL PRIMARY KEY,
	AlbumID INTEGER REFERENCES Album(id),
	name TEXT NOT NULL,
	duration INTERVAL MINUTE
);

CREATE TABLE IF NOT EXISTS Playlist(
	id SERIAL PRIMARY KEY,
	name VARCHAR(120) NOT NULL,
	ProductuonYear INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS PlaylistTrek(
	PlaylistID INTEGER REFERENCES Playlist(id),
	TrekID INTEGER REFERENCES Trek(id),
	CONSTRAINT pkpt PRIMARY KEY (PlaylistID, trekID)
);





