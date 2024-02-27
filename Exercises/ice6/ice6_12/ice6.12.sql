CREATE DATABASE ice6_12;
USE ice6_12;
CREATE TABLE customers
	(CustomerID int not null,
    CustomerName varchar(30), 
    City varchar(30),
    Country varchar(30),
    CONSTRAINT performance_pk PRIMARY KEY (CustomerID));
INSERT INTO customers VALUES
	(1, 'Alfreds', 'Berlin', 'Germany'),
    (2, 'Ana Trujillo', 'Mexico D.F.', 'Mexico'),
    (3, 'Antonio Moreno', 'Mexico D.F.', 'Mexico'),
    (4, 'Around the Horn', 'London', 'UK'),
    (5, 'Berglunds', 'Lulea', 'Sweden');
SELECT country, COUNT(CustomerID) FROM customers GROUP BY country;