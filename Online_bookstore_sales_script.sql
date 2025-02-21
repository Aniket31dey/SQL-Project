SELECT* FROM books
;
SELECT* FROM customers
;
SELECT* FROM orders
;
1) Retrieve all books in the "Fiction" genre -

SELECT* FROM books
where Genre='Fiction'
;

2) Find books published after the year 1950 - 

SELECT* FROM books
where Published_Year>1950
;

3) List all customers from the Canada -

SELECT* FROM customers
where Country='Canada'
;

4) Show orders placed in November 2023 -

SELECT* FROM orders
where Order_Date BETWEEN '2023-11-01' AND '2023-11-30'
;

5) Retrieve the total stock of books available - 

SELECT sum(Stock) Total_Stock
FROM books
;

6) Find the details of the most expensive book - 

SELECT* FROM books
ORDER BY price DESC
LIMIT 1
;

7) Show all customers who ordered more than 1 quantity of a book -

SELECT* FROM orders
WHERE Quantity>1
;
 
8) Retrieve all orders where the total amount exceeds $20 -

SELECT* FROM orders
WHERE Total_Amount>20.00
;

9) List all genres available in the Books table -

SELECT distinct genre FROM books
;

SELECT * FROM books
ORDER BY Stock asc  
limit 1
;

10) Find the book with the lowest stock -

SELECT sum(Total_Amount) As Revenue 
from orders
;

11) Calculate the total revenue generated from all orders -

SELECT genre, SUM(Quantity) AS Total_books_sold FROM books AS B 
JOIN orders AS O
	ON B.Book_ID=O.Book_ID
	GROUP BY B.Genre
;

1) Retrieve the total number of books sold for each genre -

SELECT Genre, avg(Price) as Avg_price FROM books
GROUP BY Genre
;

2) Find the average price of books in the "Fantasy" genre -

SELECT* FROM orders
where Quantity>=2
;

3) List customers who have placed at least 2 orders -

SELECT c.Customer_ID, c.Name, count(Order_ID) AS Count_of_Orders
FROM customers as c
JOIN orders as o
	ON c. Customer_ID=O. Customer_ID
    GROUP BY c.Customer_ID, C.name
    HAVING count(Order_ID)>=2
    ORDER BY Count_of_Orders DESC
;
    
4) Find the most frequently ordered book -

SELECT O.Book_ID, B.Title, count(Order_ID) AS Order_Count
FROM books AS B
JOIN orders AS O
	ON B. Book_ID=O.Book_ID
    GROUP BY O.Book_ID,B.Title
    ORDER BY Order_Count DESC
    LIMIT 1
;
    
5) Show the top 3 most expensive books of 'Fantasy' Genre -

SELECT* FROM books
WHERE Genre='Fantasy'
ORDER BY Price DESC
LIMIT 3
;

6) Retrieve the total quantity of books sold by each author -

SELECT Author, SUM(Quantity) AS SOLD_BOOKS
FROM books AS B
JOIN orders AS O
	ON B.Book_ID=O.Book_ID
	GROUP BY Author
	ORDER BY SOLD_BOOKS DESC
;

7) List the cities where customers who spent over $30 are located -

SELECT C.City, Total_Amount
FROM customers AS C
JOIN orders AS O
	ON C.Customer_ID=O.Customer_ID
    WHERE Total_Amount>30
;

8) Find the customer who spent the most on orders -

SELECT C.Customer_ID, C.Name, sum(O.Total_Amount) AS Total_Spent
FROM customers AS C
JOIN orders AS O
	ON C.Customer_ID=O.Customer_ID
    GROUP BY C.Customer_ID, C.Name
    ORDER BY Total_Spent DESC LIMIT 1
;

9) Calculate the stock remaining after fulfilling all orders -

SELECT B.Book_ID, Title, Author, Genre, Published_Year, Price, stock as Initial_stock, Quantity as Ordering_Quantity,
(Stock-Quantity) AS Remaining_stock
FROM books AS B
JOIN orders AS O
	ON B.Book_ID=O.Book_ID
	ORDER BY Remaining_stock desc
;