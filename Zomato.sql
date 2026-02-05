	CREATE DATABASE Zomato_DB;

	USE Zomato_DB;



	CREATE TABLE Customers (
	Customer_id INT PRIMARY KEY AUTO_INCREMENT,
	Full_name VARCHAR (50),
	Email VARCHAR (50),
	Phone_Number VARCHAR (15),
	City VARCHAR (50),
	Signup_Date DATE);

	CREATE TABLE Restaurants (
	Restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
	Restaurant_name VARCHAR (50),
	Cuisine_type VARCHAR (50),
	City VARCHAR (50),
	Rating INT, 
	Opened_date DATE);


	CREATE TABLE Menu_items(
	Item_id INT PRIMARY KEY AUTO_INCREMENT,
	Restaurant_id INT,
	FOREIGN KEY (Restaurant_id) REFERENCES Restaurants(Restaurant_id),
	Item_name VARCHAR (50),
	Category VARCHAR (50),
	Price DECIMAL (8,2),
	Is_available BOOLEAN);



	CREATE TABLE Orders (
	Order_id INT PRIMARY KEY AUTO_INCREMENT,
	Customer_id INT,
	FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id),
	Restaurant_id INT,
	FOREIGN KEY (Restaurant_id) REFERENCES Restaurants(Restaurant_id),
	Order_date DATETIME,
	Total_amount DECIMAL (8,2),
	Payment_Method VARCHAR (50),
	Order_status  VARCHAR (50));

	CREATE TABLE Order_details(
	Order_details_id INT PRIMARY KEY AUTO_INCREMENT,
	Order_id INT,
	FOREIGN KEY (Order_id) REFERENCES Orders(Order_id),
	Item_id INT,
	FOREIGN KEY (Item_id) REFERENCES Menu_items(Item_id),
	Quantity INT,
	Item_price DECIMAL (8,2));

	CREATE TABLE Delivery_agents (
	Agent_id INT PRIMARY KEY AUTO_INCREMENT,
	Full_name VARCHAR (50),
	Phone VARCHAR (15),
	City VARCHAR (50),
	Is_active BOOLEAN,
	Joined_date DATE);

	CREATE TABLE Deliveries (
	Delivery_id INT PRIMARY KEY AUTO_INCREMENT,
	Order_id INT,
	FOREIGN KEY (Order_id) REFERENCES Orders(Order_id),
	Agent_id INT,
	FOREIGN KEY (Agent_id) REFERENCES Delivery_agents(Agent_id),
	Pick_up_time DATETIME,
	Delivery_time DATETIME,
	Delivery_Status VARCHAR (50));

	CREATE TABLE Reviews(
	Review_id INT PRIMARY KEY AUTO_INCREMENT,
	Customer_id INT,
	FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id),
	Restaurant_id INT,
	FOREIGN KEY (Restaurant_id) REFERENCES Restaurants(Restaurant_id),
	Rating DECIMAL (2,1),
	Review_text VARCHAR(500),
	Review_date DATE);



INSERT INTO Customers (Full_name, Email, Phone_Number, City, Signup_Date) VALUES
('Aarav Patil','aarav.patil@gmail.com','9000000001','Mumbai','2025-01-01'),
('Isha Deshmukh','isha.deshmukh@gmail.com','9000000002','Pune','2025-01-02'),
('Rohan More','rohan.more@gmail.com','9000000003','Nagpur','2025-01-03'),
('Neha Shinde','neha.shinde@gmail.com','9000000004','Nashik','2025-01-04'),
('Karan Jadhav','karan.jadhav@gmail.com','9000000005','Thane','2025-01-05'),
('Priya Kulkarni','priya.kulkarni@gmail.com','9000000006','Mumbai','2025-01-06'),
('Siddhesh Pawar','siddhesh.pawar@gmail.com','9000000007','Pune','2025-01-07'),
('Ananya Chavan','ananya.chavan@gmail.com','9000000008','Nagpur','2025-01-08'),
('Manav Gawande','manav.gawande@gmail.com','9000000009','Nashik','2025-01-09'),
('Simran Bhosale','simran.bhosale@gmail.com','9000000010','Thane','2025-01-10');


INSERT INTO Restaurants (Restaurant_name, Cuisine_type, City, Rating, Opened_date) VALUES
('Maharashtrian Thali','Indian','Mumbai',5,'2020-01-10'),
('Pune Spice','Indian','Pune',4,'2019-06-15'),
('Nagpur Tandoor','North Indian','Nagpur',4,'2021-03-20'),
('Nashik Bites','Street Food','Nashik',4,'2018-11-10'),
('Thane Treats','Fast Food','Thane',4,'2022-07-25');


INSERT INTO Menu_items (Restaurant_id, Item_name, Category, Price, Is_available) VALUES
(1,'Puran Poli','Dessert',60.00,TRUE),
(1,'Misal Pav','Main Course',120.00,TRUE),
(1,'Vada Pav','Snack',40.00,TRUE),
(2,'Bhakri Sabzi','Main Course',100.00,TRUE),
(2,'Batata Vada','Snack',35.00,TRUE),
(2,'Puran Poli','Dessert',60.00,TRUE),
(3,'Paneer Butter Masala','Main Course',150.00,TRUE),
(3,'Tandoori Roti','Bread',20.00,TRUE),
(3,'Gulab Jamun','Dessert',50.00,TRUE),
(4,'Kebabs','Starter',120.00,TRUE),
(4,'Bhel Puri','Snack',50.00,TRUE),
(4,'Pav Bhaji','Main Course',80.00,TRUE),
(5,'Cheese Burger','Main Course',150.00,TRUE),
(5,'French Fries','Snack',60.00,TRUE),
(5,'Chocolate Shake','Beverage',80.00,TRUE);


INSERT INTO Delivery_agents (Full_name, Phone, City, Is_active, Joined_date) VALUES
('Ramesh Patil','9000010001','Mumbai',TRUE,'2024-01-01'),
('Sanjay Deshmukh','9000010002','Pune',TRUE,'2024-02-01'),
('Vikas More','9000010003','Nagpur',TRUE,'2024-03-01'),
('Rajesh Shinde','9000010004','Nashik',TRUE,'2024-04-01'),
('Ajay Jadhav','9000010005','Thane',TRUE,'2024-05-01');


INSERT INTO Orders (Customer_id, Restaurant_id, Order_date, Total_amount, Payment_Method, Order_status) VALUES
(1,1,'2025-06-01 12:30:00',220.00,'Cash','Delivered'),
(2,2,'2025-06-02 13:15:00',195.00,'Card','Delivered'),
(3,3,'2025-06-03 14:00:00',220.00,'UPI','Delivered'),
(4,4,'2025-06-04 15:10:00',250.00,'Card','Pending'),
(5,5,'2025-06-05 16:20:00',290.00,'Cash','Delivered'),
(6,1,'2025-06-06 17:30:00',160.00,'Card','Delivered'),
(7,2,'2025-06-07 18:00:00',195.00,'UPI','Delivered'),
(8,3,'2025-06-08 19:10:00',220.00,'Cash','Delivered'),
(9,4,'2025-06-09 20:15:00',180.00,'Card','Delivered'),
(10,5,'2025-06-10 21:30:00',290.00,'UPI','Pending');


INSERT INTO Order_details (Order_id, Item_id, Quantity, Item_price) VALUES
(1,1,1,60.00),
(1,2,1,120.00),
(1,3,1,40.00),
(2,4,1,100.00),
(2,5,1,35.00),
(2,6,1,60.00),
(3,7,1,150.00),
(3,8,1,20.00),
(3,9,1,50.00),
(4,10,1,120.00),
(4,11,1,50.00),
(4,12,1,80.00),
(5,13,1,150.00),
(5,14,1,60.00),
(5,15,1,80.00);


INSERT INTO Deliveries (Order_id, Agent_id, Pick_up_time, Delivery_time, Delivery_Status) VALUES
(1,1,'2025-06-01 12:45:00','2025-06-01 13:15:00','Delivered'),
(2,2,'2025-06-02 13:25:00','2025-06-02 13:50:00','Delivered'),
(3,3,'2025-06-03 14:15:00','2025-06-03 14:50:00','Delivered'),
(4,4,'2025-06-04 15:25:00','2025-06-04 16:00:00','Pending'),
(5,5,'2025-06-05 16:45:00','2025-06-05 17:20:00','Delivered');


INSERT INTO Reviews (Customer_id, Restaurant_id, Rating, Review_text, Review_date) VALUES
(1,1,5.0,'Delicious Maharashtrian thali!','2025-06-01'),
(2,2,4.5,'Spicy and tasty!','2025-06-02'),
(3,3,4.0,'Good food and fast service.','2025-06-03'),
(4,4,3.5,'Average, could be better.','2025-06-04'),
(5,5,4.5,'Loved the burgers and shakes!','2025-06-05'),
(6,1,4.0,'Nice flavors but a bit oily.','2025-06-06'),
(7,2,5.0,'Excellent food!','2025-06-07'),
(8,3,3.5,'Good, but slow delivery.','2025-06-08');




-- 1. Aggregate Functions (COUNT, SUM, AVG, MIN, MAX)

-- Find the total number of customers registered.

SELECT COUNT(Customer_id)
FROM Customers;

-- Find the total number of orders placed.

SELECT COUNT(order_id)
FROM Orders;

-- Calculate the average rating of all restaurants.

SELECT AVG(Customer_id)
FROM Customers;

-- Find the highest and lowest menu item price.
SELECT MAX(Price) AS Highest_price, MIN(Price) AS Lowest_price 
FROM Menu_items;

-- Calculate the total revenue generated by each restaurant.

SELECT Restaurant_name, SUM(Total_amount) as Total_revenue
FROM Restaurants
JOIN Orders on Orders.Restaurant_id = Restaurants.Restaurant_id
GROUP BY Restaurant_name
ORDER BY Total_revenue DESC;


-- Find the average total order amount for each city.

SELECT City, Round(AVG(Total_amount),2) as Total_amount
FROM Customers
JOIN Orders on Orders.Customer_id = Customers.Customer_id
GROUP BY City
ORDER BY Total_revenue DESC;

-- Count how many orders are currently marked as “Delivered”.

SELECT COUNT(Order_id)
FROM Orders
WHERE Order_status = 'Delivered';

-- Find the restaurant with the maximum total sales.

SELECT r.Restaurant_name AS Restaurant, MAX(o.Total_amount) AS Total_sales
FROM Restaurants r
JOIN Orders o on O.Restaurant_id = r.Restaurant_id
GROUP BY Restaurant
ORDER BY Total_sales DESC
LIMIT 1;



-- 2. String Functions (UPPER, LOWER, CONCAT, LENGTH, SUBSTRING)

-- Show restaurant names in uppercase.

SELECT UPPER(Restaurant_name) as Restaurant
FROM Restaurants;

-- Display customer full names in lowercase.

SELECT LOWER(Full_name) as Customer
FROM Customers;


-- Combine Full_name and City as “Customer_Location”.

SELECT CONCAT(Full_name, ' ' , City) AS Customer_data
FROM Customers;

-- Extract the first 5 characters of each restaurant name.

SELECT  Restaurant_name AS `Name`, LEFT(Restaurant_name,5) AS First_Five_Characters
FROM Restaurants;

SELECT  Restaurant_name AS `Name`, SUBSTRING(Restaurant_name,1,5) AS First_Five_Characters
FROM Restaurants;

-- Show customers whose email length is greater than 15.

SELECT *, LENGTH(Email)
FROM Customers
WHERE LENGTH(email) >15;

-- Display restaurant names with ‘Indian’ cuisine and append “ - Authentic Taste” to them.

SELECT CONCAT(Restaurant_name, '- Authentic Taste') AS Restaurant
FROM Restaurants
WHERE Cuisine_type = 'Indian';



-- 3. Date Functions (YEAR, MONTH, DAY, CURDATE, DATEDIFF)

-- Find customers who signed up this year.

SELECT *
FROM Customers
WHERE YEAR(Signup_date) = YEAR(CURDATE());


-- Calculate how many days ago each customer signed up.

SELECT Full_name AS Customer, DATEDIFF(CURDATE(),Signup_date) AS Days_signed_up
FROM Customers;


-- List all orders placed in the last 30 days.

SELECT Order_id
FROM Orders 
WHERE DATEDIFF(CURDATE(),Order_date) <= 30;

-- Find the month with the most number of orders.

SELECT Concat(MONTHNAME(Order_date),' - ', YEAR(Order_date)) AS `Month,Year`,
		Count(Order_id) AS No_of_orders
FROM Orders
GROUP BY `Month,Year`
ORDER BY No_of_orders DESC
LIMIT 1;

-- Show restaurants opened before 2020.

SELECT Restaurant_name AS Restaurant, Opened_date
FROM Restaurants
WHERE YEAR(Opened_date) < 2020;

-- Find delivery agents who joined before 2022.

SELECT Full_name AS Agent, Joined_date
FROM Delivery_agents
WHERE YEAR(Joined_date) < 2022;

-- Calculate the time taken for each delivery using
--  TIMESTAMPDIFF(MINUTE, Pick_up_time, Delivery_time).

SELECT da.Full_name, TIMESTAMPDIFF(MINUTE, Pick_up_time, Delivery_time) AS Time_taken_in_minutes
FROM Deliveries d
JOIN Delivery_agents da on da.agent_id = d.agent_id;


-- 🔹 4. Numeric & Conditional Functions (ROUND, CEIL, FLOOR, IF, CASE)

-- Round off all menu prices to 0 decimals.

SELECT Item_name, Round(Price,0)
FROM Menu_items;

-- Display a column called “Rating_Level”:

-- ‘Excellent’ if Rating >= 4.5

-- ‘Good’ if between 3 and 4.5

-- ‘Average’ otherwise.

SELECT Restaurant_name AS Restaurant, 
		CASE WHEN Rating >= 4.5 THEN 'Excellent'
				WHEN Rating BETWEEN 3 AND 4.5 THEN 'Good'
                ELSE 'Average'
                END AS Rating_level
FROM Restaurants;

-- Use IF to mark orders as ‘High Value’ if total_amount > 200, else ‘Normal’.

SELECT Order_id, Total_amount,
IF (total_amount > 200,'High value','Normal') AS Order_type
FROM Orders;

-- Show average order value per city, rounded to 2 decimals.

SELECT c.City AS City, ROUND(AVG(o.Total_amount),2) AS Order_value
FROM Orders O
JOIN Customers c ON O.Customer_id = c. Customer_id
GROUP BY City;

-- 🔹 5. Subqueries & Derived Calculations

-- Find customers who have placed more than 5 orders.

SELECT c.Full_name AS Customer, COUNT(Order_id) AS 'Number_of_orders'
FROM Orders o
JOIN Customers c ON c.Customer_id = o.Customer_id 
GROUP BY Customer
HAVING COUNT(Order_id) > 5
ORDER BY 'Number_of_orders' DESC; 

-- Show the top 3 restaurants by average review rating.

SELECT r.Restaurant_name as Restaurant, ROUND(AVG(rv.Rating),2) AS Avg_rating
FROM Restaurants r
JOIN Reviews rv ON rv.Restaurant_id = r.Restaurant_id
GROUP BY Restaurant 
ORDER BY Avg_rating DESC 
LIMIT 3;


-- Find the menu item with the highest total quantity sold (using Order_Details).

SELECT mi.Item_name AS Item, SUM(od.Quantity) AS Total_quantity
FROM Menu_items mi
JOIN Order_details od ON od.item_id = mi.item_id
GROUP BY Item
ORDER BY Total_quantity DESC
LIMIT 1;

-- Get the most active delivery agent (max deliveries completed).

SELECT da.Full_name AS Delivery_agent, Count(Delivery_id) AS Number_of_deliveries
FROM Delivery_agents da
JOIN Deliveries d ON d.Agent_id = da.Agent_id
GROUP BY Delivery_agent
ORDER BY Number_of_deliveries DESC
LIMIT 1;

-- Find the customer who spent the most overall.

SELECT c.Full_name AS Customer, SUM(o.Total_amount) AS Overall_expenditure
FROM Customers c
JOIN Orders o ON o.Customer_id = c.Customer_id
GROUP BY Customer
ORDER BY Overall_expenditure DESC
LIMIT 1;

-- 🔹 6. Bonus — Combine Multiple Functions

-- Display the most recent order for each customer (use MAX + GROUP BY).

SELECT c.Full_name AS Customer, DATEDIFF(CURDATE(),MAX(o.Order_date)) AS DateDifference,
								 MAX(o.Order_date) AS Most_Recent_Order
FROM Customers c
JOIN Orders o ON o.Customer_id = c.Customer_id
GROUP BY Customer
ORDER BY DateDifference ASC;


-- Find average delivery time (in minutes) per city (use JOIN + TIMESTAMPDIFF).

SELECT c.City AS City, ROUND(AVG(TIMESTAMPDIFF(Minute,d.Pick_up_time,d.Delivery_time)),2) AS Avg_delivery_time
FROM Customers c
JOIN Orders o ON o.Customer_id = c.Customer_id
JOIN Deliveries d ON d.Order_id = o.Order_id
GROUP BY City;


-- Show total orders, total revenue, and average order value per restaurant
--  (use SUM, COUNT, AVG).

SELECT Restaurant_name AS Restaurant, 
				COUNT(o.Order_id) AS Total_orders, 
				SUM(o.Total_amount) Total_revenue,
                ROUND(AVG(Total_amount),2) AS Average_order_value
FROM Orders o
JOIN Restaurants r ON r.Restaurant_id = o.Restaurant_id
GROUP BY Restaurant;


                


-- Create a column alias called Customer_Summary = CONCAT(Full_name, ' from ', City, ' placed ', COUNT(Orders.Order_id), ' orders') — use GROUP BY and CONCAT.

SELECT CONCAT(Full_name, ' from ', City, ' placed ', 
		COUNT(o.Order_id), ' orders') AS Customer_Summary
FROM Customers c
JOIN Orders o ON o.Customer_id = c.Customer_id
GROUP BY Full_name, City;

--  SUBQUERY

-- Q1. Find customers who have spent more than the average order value.

SELECT c.Full_name AS Customer, SUM(o.Total_amount) AS Total_spent
FROM Customers c 
JOIN Orders o ON o.Customer_id = c.Customer_id
GROUP BY Customer
HAVING SUM(Total_amount) > (SELECT AVG(Total_amount)
						FROM Orders);


-- Use a subquery to calculate the average order value first.

SELECT ROUND(AVG(Total_amount),2)
FROM Orders;

-- Q2. List all restaurants that have more than 10 orders.

-- Use a subquery to count orders per restaurant.

SELECT r.Restaurant_name AS Restaurant,
				COUNT(o.Order_id) AS Number_of_orders
FROM Restaurants r
JOIN Orders o ON o.Restaurant_id = r.Restaurant_id
GROUP BY Restaurant
HAVING COUNT(o.Order_id) > 10;



-- Q1. Find the top 3 delivery agents with the highest total deliveries.

-- Use a CTE to calculate total deliveries per agent first.

WITH Total_delivery_per_agent AS (SELECT da.Full_name AS Agent, COUNT(d.Delivery_id) AS No_of_deliveries
FROM Deliveries d
JOIN Delivery_agents da ON d.Agent_id = da.Agent_id
GROUP BY Agent)

SELECT Agent, No_of_deliveries
FROM Total_delivery_per_agent
ORDER BY No_of_deliveries DESC
LIMIT 3;



-- Q2. Find customers with more than 3 orders in the last 30 days.

-- Use a CTE to filter recent orders first.

WITH Orders_from_last_30_days AS 
		(SELECT Full_name AS Customer, COUNT(Order_id) AS No_of_orders
FROM Customers c
JOIN Orders o ON o.Customer_id = c.Customer_id
WHERE DATEDIFF(CURDATE(),Order_date) < 30
GROUP BY Customer)

SELECT Customer, No_of_orders
FROM Orders_from_last_30_days
WHERE No_of_orders > 3;


-- VIEW

-- Q1. Create a view Customer_Orders_View showing:

-- Customer name, city, total orders, total spent, average order value.



 CREATE VIEW Customer_Orders_View AS
			SELECT c.Full_name AS Customer, City, 
            COUNT(o.Order_id) AS Total_orders,
			SUM(o.Total_amount) AS Total_spent,
            ROUND(AVG(o.Total_amount),2) AS Average_order_value
FROM Customers c
JOIN Orders o ON o.Customer_id = c.Customer_id
GROUP BY Customer,City;
	


-- Q2. Create a view Restaurant_Revenue_View showing:

-- Restaurant name, total orders, total revenue, average order value.

CREATE VIEW Restaurant_Revenue_View AS
		SELECT r.Restaurant_name AS Restaurant,
		COUNT(o.Order_id) AS Total_orders, 
        SUM(o.Total_amount) AS total_revenue,
		ROUND(AVG(o.Total_amount),2) AS Average_order_value
FROM Restaurants r
JOIN Orders o ON o.Restaurant_id = r.Restaurant_id
GROUP BY Restaurant;


-- WINDOW FUNCTIONS

-- Q1. Rank restaurants by total revenue using RANK() or DENSE_RANK().

SELECT Restaurant_name AS Restaurant, 
		RANK () OVER (ORDER BY SUM(Total_amount) DESC) AS `Rank`
FROM Restaurants r
JOIN Orders o ON o.Restaurant_id = r.Restaurant_id
GROUP BY Restaurant;

-- Q2. Show each order along with the average order amount of the customer 
-- using OVER(PARTITION BY Customer_id).

-- Q2. Show each order along with the average order amount of the customer 
-- using OVER(PARTITION BY Customer_id).

SELECT 
    c.Full_name AS Customer,
    o.Order_id,
    o.Total_amount,
    ROUND(AVG(o.Total_amount) OVER (PARTITION BY o.Customer_id), 2) AS Avg_order_for_customer,
    RANK() OVER (PARTITION BY o.Customer_id ORDER BY o.Total_amount DESC) AS Order_Rank
FROM Customers c
JOIN Orders o ON o.Customer_id = c.Customer_id
ORDER BY c.Full_name, o.Order_id DESC;


-- STORED PROCEDURE

-- Q1. Create a procedure GetCustomerOrders that accepts a customer_id and returns 
-- all their orders with total amount and order date.


DELIMITER //
CREATE PROCEDURE GetCustomerOrders (IN C_1 INT)
BEGIN
SELECT Full_name AS Customer, Order_id, Total_amount, Order_date 
FROM Orders O
JOIN Customers c ON c.Customer_id = o.Customer_id
WHERE c.Customer_id = C_1;
END //

DELIMITER ;


CALL GetCustomerOrders (3);
 

-- Q2. Create a procedure TopRestaurantsByCity that accepts a city name and returns 
-- the top 5 restaurants by total revenue in that city


DELIMITER //
CREATE PROCEDURE TopRestaurantsByCity (IN City VARCHAR(50))
BEGIN
SELECT Restaurant_name AS Restaurant , City, SUM(Total_amount) AS Total_revenue
FROM Restaurants r 
JOIN Orders o ON o.Restaurant_id = r.Restaurant_id
WHERE r.City = City
GROUP BY Restaurant, City
ORDER BY Total_revenue DESC
LIMIT 5;
END //
DELIMITER ;

CALL TopRestaurantsByCity ('Nagpur');




