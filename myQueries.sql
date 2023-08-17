-- SQLite queries
SELECT *
FROM playlists;
--Counting all the instances in table genres
select count(*)
FROM genres;
--Selecting all instances starting with s
SELECT *
FROM playlists
WHERE name LIKE '%s';
--Selecting all instances in artists table where name = Lost
select *
from artists
where Name = "Lost";
--Selecting all instances where ArtistId = 150
select *
from albums
where ArtistId = 150;
--Selecting all instances from both tables (artists and albums) joining on their ids and where name = Lost
select *
from artists
    join albums on artists.ArtistId = albums.ArtistId
where Name = "Lost";
--Joining artists and albums using their id and selecting the artist whose id = 20 in both tables.
select *
from artists
    join albums on artists.ArtistId = albums.ArtistId
where artists.ArtistId = 20;
-- Selecting particular columns from the joined tables where the artist Id = 10
select Name,
    AlbumId,
    Title
from artists
    join albums on artists.ArtistId = albums.ArtistId
where artists.ArtistId = 10;
--Selecting all instances from tracks
select *
from tracks --Selecting from joined (inner join) tables (Tracks and Genres) where Name = Blues
select *
from Genres
    join tracks on Genres.GenreId = tracks.GenreId
where Genres.Name = "Blues";
--Counting all the instances which meet the condition of the previous query
select count(*)
from Genres
    join tracks on Genres.GenreId = tracks.GenreId
where Genres.Name = "Blues";
--Selecting form joined tables (Genres and tracks) where GenreId = 5
select *
from Genres
    join tracks on Genres.GenreId = tracks.GenreId
where Genres.GenreId = 5;
--More inner joins
select *
from playlists
    join playlist_track on playlist_track.playlistid = tracks.TrackId
where playlists.Name = "Music";
-- Joining three tables at once (playlists and playlist_track) and then (playlists and tracks)
select *
from playlists
    join playlist_track on playlist_track.playlistId = playlists.PlaylistId
    join tracks on playlist_track.TrackId = tracks.TrackId
where playlists.Name = "Classical";
--selecting all the instances in genres where Name = Jazz
select *
from genres
where Name = "Jazz" --Joining 4 tables at once
select count (DISTINCT artists.Name)
from genres
    join tracks on tracks.GenreId = genres.GenreId
    join albums on albums.AlbumId = genres.GenreId
    join artists on artists.ArtistId = genres.GenreId
Where genres.Name = "Rock"