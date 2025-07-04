# SQL Case Study – KMS Sales Analysis

This project is a complete SQL-based analysis of the "KMS Sales" dataset.  
It explores customer behavior, shipping performance, product sales, and profitability using real SQL queries on Microsoft SQL Server.

## Project Objectives

- Analyze product performance by category and segment
- Identify most and least profitable customers
- Evaluate shipping cost efficiency
- Investigate return behavior and customer impact

## Dataset Summary

The dataset contains the following key tables:
- `KMS_Sales`: Main sales transactions
- `Order_Status`: Return status of each order

## Sample Queries

### 1. Product Category Highest Sales
```sql
Select Product_Category,
Sum(Sales) As Total_Sales
From KMS_Sales
Group By Product_Category
Order By Total_Sales Desc;

### 2.Top 3 and Bottom 3 regions in terms of sales
```sql
Top 3

Select top 3  Row_ID, Region, Sales
    From KMS_Sales
    Order by Sales desc

Lowest 3

Select top 3  Row_ID, Region, Sales
    From KMS_Sales
    Order by Sales asc
