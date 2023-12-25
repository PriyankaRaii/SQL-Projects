Create Database Boxoffice;

Use Boxoffice;

/*  1. Show the list of movies released in 2020.*/

alter table movie_details
Add column NewDob date;

select release_date,
Str_To_Date(release_date,"%d-%m-%y") as NewDob
from movie_details;

update movie_details
set NewDob = Str_To_Date(release_date,"%d-%M-%y"); 

set sql_safe_updates = 0;

select movie_name, extract(year from NewDob) as Yr
from movie_details
where extract(year from NewDob) = 2020;

ALTER TABLE movie_details
DROP Column NewBob;

/* 2. List the top 5 movies which grossed the highest collections across all years.  */
select movie_name,movie_total_worldwide
from movie_commercials
order by movie_total_worldwide desc
limit 5;

/*3. List the name of the producers who has produced comedy movies in 2019.   */

select movie_name,NewDob,movie_genre
from movie_details
where movie_genre = "Comedy" and extract(Year from NewDob) =2019;

/* 4. Which movie in 2020 had the shortest duration */

select movie_name,NewDob,runtime
from movie_details
where year(newDob) = 2020
order by runtime asc
limit 1;

/* 5. List the movie with the highest opening weekend. Is this the same movie which had the highest overall collection? */

select movie_name,movie_weekend
from movie_commercials
order by movie_weekend desc
limit 1;


select movie_name,movie_total_worldwide
from movie_commercials
order by movie_weekend desc
limit 1;

/*Ans yes*/

/*  6. List the movies which had the weekend collectio same as the first week collection*/

select movie_name,movie_weekend,movie_firstweek
from movie_commercials
where movie_firstweek =movie_weekend;


/*  7. List the top 3 movies with the highest foreign collection. */

select movie_name,movie_total_worldwide
from movie_commercials
order by movie_total_worldwide desc
limit 3;

/* 8. List the movies that were released on a non-weekend day.  */
select movie_name,release_date,NewDob,
weekday(NewDob) as D, dayname(newDob) as name
from movie_details 
where dayname(NewDob) in (1,2,3,4,0);

select movie_name, release_date, weekDay(NewDob), 
dayname(NewDob) 
from movie_details
where dayname(NewDob) <> "Saturday" or 
	dayname(NewDob) <> "Sunday";


/*  9. List the movies by Reliance Entertainment which were non comedy.*/


select movie_name,NewDob,movie_genre,banner
from movie_details
where movie_genre not like "Comedy" and banner = "Reliance Entertainment";

select movie_name, banner, movie_genre
from movie_details
where banner = "Reliance Entertainment" 
	and movie_genre <> "Comedy";


/*10. List the movies produced in the month of October, November, and December that were released on the weekends.
*/

select movie_name,NewDob, monthname(NewDob),dayname(NewDob)
from movie_details
where (monthname(NewDob) IN ("October", "November", "December")) and
    (dayname(NewDob) IN ("Saturday", "Sunday"));
    
select movie_name, monthname(NewDob), dayname(NewDob)
from movie_details
where (monthname(NewDob) = "October" or 
	monthname(NewDob) = "November" or 
	monthname(NewDob) = "December") and 
    (dayname(NewDob) = "Saturday" or 
    dayname(NewDob) = "Sunday");
