# Zepto SQL Product Analysis

This project provides a comprehensive SQL-based data analysis of a retail dataset inspired by Zepto, a quick-commerce company. The dataset (zepto\_v2.csv) contains detailed information on various products including pricing, stock levels, discounts, categories, and customer demand.

# Dataset Overview

The dataset includes the following columns:

* Category: Product category (e.g., Personal Care, Fruits & Vegetables)
* name: Product name
* mrp: Maximum Retail Price (original price)
* discountPercent: Percentage of discount applied
* availableQuantity: Current stock level
* discountedSellingPrice: Price after discount
* weightInGms: Weight of the product in grams
* outOfStock: Boolean (1 = out of stock, 0 = available)
* quantity: Requested quantity (customer demand)

# Analysis Topics

The SQL script is divided into five key sections to explore different aspects of the data:

# 1. View All Data

* Simple SELECT to preview the full dataset

# 2. General Product Statistics

* Count of total products
* In-stock vs out-of-stock
* Total stock and total demand
* Products with low stock
* Products with no discounts
* Top 10 most requested products

# 3. Price and Discount Analysis

* Average MRP and discount price
* Discount percent stats (avg, max, min)
* Actual discount value per product
* Price per 100g for products with weight

# 4. Category-Based Analysis

* Number of products by category
* Average discount % by category
* Total stock by category
* Out-of-stock count per category
* High-demand, low-stock products by category

# 5. Business Opportunities and Alerts

* Products with high discount and low stock (urgency)
* High-price but low-demand products (marketing or promotion candidates)

# Tools Used

* Microsoft SQL Server

# Files

* zepto\_v2.csv – Sample dataset
* zepto\_data\_insights.sql – Full SQL analysis script (well-documented)

# How to Use

1. Import the zepto\_v2.csv file into your SQL Server as a table (zepto)
2. Run the SQL script zepto\_data\_insights.sql
3. Review the outputs for insights into pricing, stock levels, and business opportunities

# Author

Ebraam Gerges – Data Analyst
