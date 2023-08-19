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
--Joining three tables at once (playlists and playlist_track) and then (playlists and tracks)
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
Where genres.Name = "Rock" -- Find the playlist with the most/least songs(will need a group by count)
select playlists.Name,
    count(*)
from playlists
    join playlist_track on playlists.playlistId = playlist_track.PlaylistId
group by playlists.Name
order by count(*) desc
limit 1;
select playlists.Name,
    count(*)
from playlists
    join playlist_track on playlists.playlistId = playlist_track.PlaylistId
group by playlists.Name
order by count(*) asc
limit 1;
select playlists.Name,
    count(*) as SongCount
from playlists
    join playlist_track on playlists.playlistId = playlist_track.PlaylistId
group by playlists.Name
order by count(*) desc
limit 1;
--  Find the total for a given invoice (will need a sum)
select *
from invoices
where invoices.InvoiceId = 17;
--  Find the biggest/smallest invoice amounts (needs group by)
select Total
from invoices
where invoices.InvoiceId = 17;
-- answer
select InvoiceId,
    min(Total)
from invoices;
select InvoiceId,
    max(Total)
from invoices;
--  Find the artist with the most/least songs (needs group by) (edited) 
SELECT -- count(DISTINCT artists.Name)
    -- artists.Name
    artists.Name,
    count(*) as TrackCount
from artists
    join albums on albums.ArtistId = artists.ArtistId
    join tracks on tracks.AlbumId = albums.AlbumId
group by artists.Name
order by TrackCount DESC
limit 5 offset 5;