CREATE DATABASE IMDB

USE IMDB

CREATE TABLE Movies
(
	Id int PRIMARY KEY IDENTITY,
	[Name] nvarchar(50),
	Point float,
	Duration float
)


CREATE TABLE Directors
(
	Id int PRIMARY KEY IDENTITY,
	[FullName] nvarchar(50),
)
CREATE TABLE Actors
(
	Id int PRIMARY KEY IDENTITY,
	[FullName] nvarchar(50),
)
CREATE TABLE Genres
(
	Id int PRIMARY KEY IDENTITY,
	[Name] nvarchar(50),
)

CREATE TABLE Films
(
	Id int PRIMARY KEY IDENTITY,
	MovieId int REFERENCES Movies(id),
	GenreId int REFERENCES Genres(id),
	DirectorId int REFERENCES Directors(id),
	ActorsId int REFERENCES Actors(id)
)

SELECT Movies.Name , Movies.Point , Genres.Name, Actors.FullName, Directors.FullName 
FROM Films 
JOIN Movies ON Films.MovieId = Movies.Id
JOIN Genres ON Films.GenreId = Genres.Id
JOIN Actors ON Films.ActorsId = Actors.Id
JOIN Directors ON Films.DirectorId = Directors.Id
WHERE Movies.Point>6

SELECT Movies.Point , Genres.Name FROM Films
JOIN Movies ON Films.MovieId = Movies.Id
JOIN Genres ON Films.GenreId = Genres.Id
WHERE Genres.Name LIKE'%a%'

SELECT Movies.Point, Movies.Duration , Genres.Name FROM Films
JOIN Movies ON Films.MovieId = Movies.Id
JOIN Genres ON Films.GenreId = Genres.Id
WHERE LEN(Movies.Name)>10 AND Movies.Name LIKE'%t'

SELECT Movies.Point, Genres.Name, Directors.FullName, Actors.FullName FROM Films
JOIN Movies ON Films.MovieId = Movies.Id
JOIN Genres ON Films.GenreId = Genres.Id
JOIN Actors ON Films.ActorsId = Actors.Id
JOIN Directors ON Films.DirectorId = Directors.Id
ORDER BY Movies.Point DESC