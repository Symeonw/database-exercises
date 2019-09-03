use albums_db;
show create table albums;
describe albums;
select * from albums where artist = "Pink Floyd";
Select release_date from albums where name = "Sgt. Pepper's Lonely Hearts Club Band";
select genre from albums where name = "Nevermind";
select * from albums where release_date > "1989"AND release_date < "2000";
select * from albums where sales < "20";
-- the way the table is formatted would prohibit showing us something exctly matching "Rock" with anything else that doesn't meet that criteria exactly, if we wanted to find all songs within the album with "Rock" or any of its listed sub-catogories we would need to search it with the LIKE function. 