create database items_customers_db;

use items_customers_db;

/*(Comparison Operators)*/

/*1. From the items_ordered table, select a list of all items purchased for customerid 10449.
Display the customerid, item, and price for this customer.*/

select customerid,item,price
from items
where customerid = 10449;

/*2. Select all columns from the items_ordered table for whoever purchased a Tent.*/

select *
from items
where item = "tent";

/*3. Select the customerid, order_date, and item values from the items_ordered table for any
items in the item column that start with the letter "S".*/

select customerid, order_date, price
from items
where item like "s%";

/*4. Select the distinct items in the items_ordered table. In other words, display a listing of each
of the unique items from the items_ordered table.*/

select distinct(item)
from items;

/* (Aggregate Functions)*/

/*1. Select the maximum price of any item ordered in the items_ordered table. */

select item ,max(price) as max_price
from items
group by item;

/*2. Select the average price of all of the items ordered that were purchased
 in the month of Dec.*/
 
 select item, avg(price) as avg_price
 from items
 where order_date;
 
 alter table items
 add column newdob date;
 
set sql_safe_updates = 0;

select str_to_date(order_date,"%d-e%-Y%"),newdob
from items;
  
update items
set newdob = str_to_date(order_date,"%d-%m-Y%");
 
/*3. What are the total number of rows in the items_ordered table?*/

select count(*) as total_rows
from items;

/*4. For all of the tents that were ordered in the items_ordered table, 
what is the price of the lowes tent? */

select min(price)
from items
where item = "tent";

/*(Group By clause)*/

/*1. How many people are in each unique state in the customers table?
 Select the state and display the number of people in each.*/

select state, count(state) as cntste
from customers
group by state;

/*2. From the items_ordered table, select the item, maximum price, and minimum price for each
specific item in the table. */

select item, max(price) as max_price, min(price) as min_price
from items
group by item;

/*3. How many orders did each customer make?*/

select customerid, count(customerid) as n0of_order, sum(price*quantity) as Sum_order
from items
group by customerid;

/*(HAVING clause)*/

/*1. How many people are in each unique state in the customers table that have more than one
person in the state? Select the state and display the number of how many people are in each if
it's greater than 1.*/

select state, count(*) as No_ofpeople
from customers
group by state
having count(*) > 1;

/*2. From the items_ordered table, select the item, maximum price, and minimum price for each
specific item in the table. Only display the results if the maximum price for one of the items is
greater than 190.00.*/

select item, max(price), min(price)
from items
group by item
having max(price) > 190;

/*3. How many orders did each customer make? Use the items_ordered table. Select the
customerid, number of orders they made, and the sum of their orders if they purchased more
than 1 item.*/

select customerid, count(*) as no_order, sum(price*quantity) as sumOforder
from items
group by customerid
having no_order > 1;

/*(ORDER BY clause)*/

/*1. Select the lastname, firstname, and city for all customers in the customers table. Display the
results in Ascending Order based on the lastname.*/

select lastname,firstname,city
from customers
order by lastname asc;

/*2. display the results in Descending order.*/

select lastname,firstname,city
from customers
order by lastname desc;

/*3. Select the item and price for all of the items in the items_ordered table that the price is greater
than 10.00. Display the results in Ascending order based on the price.*/

select item, price
from items
where price > 10.00
order by price asc;

/*(Combining Conditions & Boolean Operators)*/

/*1. Select the customerid, order_date, and item from the items_ordered table for all items unless
they are 'Snow Shoes' or if they are 'Ear Muffs'. Display the rows as long as they are not either of
these two items.*/

select customerid,order_date,item
from items
where item not like "Snow Shoes" and item not like "Ear Muffs";

/*2. Select the item and price of all items that start with the letters 'S', 'P', or 'F'.
 (IN & Between)*/

select item, price 
from items 
where item like "S%" or item like "P%" or item like "F%"; 

select item, price 
from items 
where item regexp"^[s,p,f]" ;

/*1. Select the date, item, and price from the items_ordered table for all of the rows that have a
price value ranging from 10.00 to 80.00.*/

select order_date,item,price
from items
where price between 10 and 80;

/*2. Select the firstname, city, and state from the customers table for all of the rows where the state
value is either: Arizona, Washington, Oklahoma, Colorado, or Hawaii.*/

select firstname, city, state
from customers
where state in ("Arizona", "Washington", "Oklahoma", "Colorado", "Hawaii");

/*1. Select the item and per unit price for each item in the items_ordered table. */

select item, sum(price)/sum(quantity) as perunit_price 
from items
group by item;

/*(Table Joins)*/

/*1. Write a query using a join to determine which items were ordered by each of the customers in
the customers table. Select the customerid, firstname, lastname, order_date, item, and price for
everything each customer purchased in the items_ordered table.*/

select cs.customerid, firstname, lastname, order_date, item, price
from customers cs inner join items its using (customerid);

/* #1 display the results sorted by state in descending order.*/

select cs.customerid, firstname, lastname, order_date, item, price,state
from customers cs inner join items its using (customerid)
order by state desc;