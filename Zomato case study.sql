Create database zomato;

Use zomato;

create table zomat(
RestaurantID double,
Res_identify char(50),
CountryCode	int,
City char(100),
Cuisines char(200),
Has_Table_booking char(10),
Has_Online_delivery	char(10),
Is_delivering_now	char(10),
Switch_to_order_menu char(10),
Price_range	int,
Votes int,
Average_Cost_for_two int,
Rating double);

select *
from zomat;

/*Business Questions: 
1) Help Zomato in identifying the cities with poor Restaurant ratings*/

select City,Rating
from zomat
order by Rating asc;

/*2) Mr.roy is looking for a restaurant in kolkata which provides online 
delivery. Help him choose the best restaurant*/

select City,Rating,Has_Online_delivery,RestaurantID
from zomat
where Has_Online_delivery = "yes" and City = "kolkata" And Rating > 4;

/*3) Help Peter in finding the best rated Restraunt for Pizza in New Delhi.*/

select City,Cuisines,Rating,RestaurantID,Res_identify
from zomat
where Cuisines like "%Pizza%" and City = "New Delhi" 
order by 3 desc
limit 1;


/*4)Enlist most affordable and highly rated restaurants city wise.*/

select RestaurantID,city ,Price_range,Rating
from zomat 
where Price_range between 1 and 2 and rating >4.5
order by 3,4 desc;

/*5)Help Zomato in identifying the restaurants with poor offline services*/

select RestaurantID,city,Has_Online_delivery,Has_Table_booking,rating
from zomat
where Has_Table_booking = "yes" and Rating between 1 and 2 
and Has_Online_delivery="no";

/*6)Help zomato in identifying those cities which have atleast 3 restaurants with ratings >= 4.9
  In case there are two cities with the same result, sort them in alphabetical order.*/
  
  select city, count(RestaurantID) as noOfRestaurants
  from zomat
  where Rating >= 4.9 
  group by City
  having count(RestaurantID) >=3
 ORDER BY NoOfRestaurants DESC, city ASC;

  use zomato;
  
  create table country
  (CountryCode int,
  Country char (30));

  select *
  from country;
  
/*7) What are the top 5 countries with most restaurants linked with Zomato?*/

select z.CountryCode,  count(*) as cnt
from zomat z inner join country c on z.CountryCode = c.CountryCode
group by z.CountryCode
order by 2 desc
limit 5;

/*8) What is the average cost for two across all Zomato listed restaurants? */
Select Average_Cost_for_two, Count(*) as Cnt
from zomat
group by Average_Cost_for_two;

/*9) Group the restaurants basis the average cost for two into: 
Luxurious Expensive, Very Expensive, Expensive, High, Medium High, Average. 
Then, find the number of restaurants in each category.*/ 
Select case 
		When Average_Cost_for_two > 20000 then "Luxurious Fooding"
        When Average_Cost_for_two between 15000 and 19999 then "Ultra Expensive"
        When Average_Cost_for_two between 10000 and 14999 then "Very Expensive"
        When Average_Cost_for_two between 5000 and 9999 then "Expensive"
        When Average_Cost_for_two between 3000 and 4999 then "High"
        When Average_Cost_for_two between 1500 and 2999 then "Medium high"
		Else "Average"
        End as Price_Category, Count(*) as Cnt
From zomat
Group by case 
		When Average_Cost_for_two > 20000 then "Luxurious Fooding"
        When Average_Cost_for_two between 15000 and 19999 then "Ultra Expensive"
        When Average_Cost_for_two between 10000 and 14999 then "Very Expensive"
        When Average_Cost_for_two between 5000 and 9999 then "Expensive"
        When Average_Cost_for_two between 3000 and 4999 then "High"
        When Average_Cost_for_two between 1500 and 2999 then "Medium high"
		Else "Average"
        End
Order by 2 DESC; 

/*10) List the two top 5 restaurants with highest rating with maximum votes. 
*/
select RestaurantID,Votes, Rating
from zomat
 order by 2 desc,3 desc
 limit 5 ;
