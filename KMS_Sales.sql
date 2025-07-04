CREATE DATABASE KMS_db

CREATE TABLE KMS_Sales (
    [Row ID] INT,
    [Order ID] INT,
    [Order Date] DATE,
    [Order Priority] VARCHAR(50),
    [Order Quantity] INT,
    Sales DECIMAL(18,2),
    Discount DECIMAL(5,2),
    [Ship Mode] VARCHAR(100),
    Profit DECIMAL(18,2),
    [Unit Price] DECIMAL(18,2),
    [Shipping Cost] DECIMAL(18,2),
    [Customer Name] VARCHAR(Max),
    Province VARCHAR(100),
    Region VARCHAR(100),
    [Customer Segment] VARCHAR(Max),
    [Product Category] VARCHAR(Max),
    [Product Sub Category] VARCHAR(Max),
    [Product Name] VARCHAR(Max),
    [Product Container] VARCHAR(Max),
    [Product Base Margin] DECIMAL(5,2),
    [Ship Date] DATE
    Primary key ([Row ID])
);

Select * From KMS_Sales


------1. Product Category Highest Sales----

Select Product_Category,
Sum(Sales) As Total_Sales
From KMS_Sales
Group By Product_Category
Order By Total_Sales Desc;

-----2.Top 3 and Bottom 3 regions in terms of sales-----

----Top 3

Select top 3  Row_ID, Region, Sales
    From KMS_Sales
    Order by Sales desc

------Lowest 3

Select top 3  Row_ID, Region, Sales
    From KMS_Sales
    Order by Sales asc

------3.  The total sales of appliances in Ontario----

Select Sum (Sales) As [Total Appliances Sales in Ontario]
From KMS_Sales
Where
    Product_Category = 'Appliances'
    AND Region = 'Ontario'

Select * From KMS_Sales

-----4  The revenue from the bottom 10 customers----

Select Top 10 Customer_Name,
Sum(Sales) As Total_Sales
From KMS_Sales
Group By Customer_Name
Order By Total_Sales Asc;

--------5  KMS incurred the most shipping cost using which shipping method------

Select Top 1 Ship_Mode,
Sum(Shipping_Cost) As [Total Shipping Cost]
From KMS_Sales
Group By Ship_Mode
Order By [Total Shipping Cost] Desc;

------6  Most valuable customers, and what products or services do they typically purchase------

Select Top 5 Customer_Name,
Sum(Sales) As [Total Sales]
From KMS_Sales
Group By Customer_Name
Order By [Total Sales] Desc; 

 ----7 Small business customer with highest sales-----

Select Top 1  Customer_Name,
Sum(Sales) As [Total Sales]
From KMS_Sales
Where Customer_Segment = 'Small Business'
Group By Customer_Name
Order By [Total Sales] Desc;

-----8. Which Corporate Customer placed the most number of orders in 2009 – 2012-----

Select Top 1 Customer_Name,
count (Distinct Order_Quantity) as Total_Order
From KMS_Sales
Where Customer_Segment = 'Corporate'
Between 2009 and 2012
Group By Customer_Name
Order By Total_Order Desc;



------9 . Which consumer customer was the most profitable one?-----

Select Top 1 Customer_Name,
Sum(Profit) As Total_Profit
From KMS_Sales
Where Customer_Segment = 'Consumer'
Group By Customer_Name
Order By Total_Profit Desc;


----- 10. Which customer returned items, and what segment do they belong to?-------

Select KMS_Sales.Order_ID,
        KMS_Sales.Customer_Name,
        KMS_Sales.Sales,
        Order_Status.Status
From KMS_Sales
Join Order_Status
On KMS_Sales.Order_ID = Order_Status.Order_ID

Select Distinct
    ks.Customer_Name,
    ks.Customer_Segment,
    ks.Order_ID,
    os.status
From
    KMS_Sales ks
Inner Join 
    order_status os
    On ks.Order_ID = os.order_id
Where
    os.status = 'Returned';

Select * From KMS_Sales

select * From Order_status

------11. If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer------

SELECT Order_Priority,
Ship_Mode,
Count(*) AS Total_Orders,
Sum(Shipping_Cost) As Total_Shipping_Cost,
Sum(Sales) As Total_Sales
From KMS_Sales
Group By Order_Priority, Ship_Mode
Order By Order_Priority, Ship_Mode
Desc;