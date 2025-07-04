# SQL Case Study – KMS Sales Analysis

This is a structured SQL case study project analyzing the KMS Sales dataset using Microsoft SQL Server.  
It demonstrates practical SQL skills in data cleaning, joining, grouping, filtering, and business insights extraction.

## Project Objectives

- Analyze total and segment-based sales performance
- Identify the most valuable and least profitable customers
- Evaluate shipping methods and their cost-effectiveness
- Study return patterns by segment and customer
- Provide actionable insights for management

## Dataset Summary

The dataset contains the following key tables:
- `KMS_Sales`: Main sales transactions
- `Order_Status`: Return status of each order

![KMS Sales](KMS_Sales.sql)

## Sample Queries

### 1. Product Category Highest Sales
```sql
Select Product_Category,
Sum(Sales) As Total_Sales
From KMS_Sales
Group By Product_Category
Order By Total_Sales Desc;

2. Most Profitable Customers
```sql
Select Top 1 Customer_Name,
Sum(Profit) As Total_Profit
From KMS_Sales
Where Customer_Segment = 'Consumer'
Group By Customer_Name
Order By Total_Profit Desc;

3.Small business customer with highest sales
```sql
Select Top 1  Customer_Name,
Sum(Sales) As [Total Sales]
From KMS_Sales
Where Customer_Segment = 'Small Business'
Group By Customer_Name
Order By [Total Sales] Desc;

Key Insights
Some high-priority orders used slower shipping methods, increasing customer risk
Corporate customers dominated total sales between 2009–2012
The Consumer segment returned the most items, indicating either poor fit or expectation gaps
Appliances underperformed in specific provinces like Ontario

Tools Used
SQL Server Management Studio (SSMS)
Microsoft Excel (for data pre-cleaning)
GitHub (to publish and document analysis)

Author
Babalola Kehinde Vincent
Email: kenny19059@gmail.com
LinkedIn: linkedin.com/in/kehinde-babalola25
