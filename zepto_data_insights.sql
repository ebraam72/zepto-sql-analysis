-- ==========================================================
-- TOPIC 1: View All Data
-- ==========================================================
SELECT * 
FROM zepto;

-- ==========================================================
-- TOPIC 2: General Product Statistics
-- ==========================================================
-- Total number of products, available, and out of stock
SELECT  
    COUNT(*) AS total_products,
    SUM(CASE WHEN outOfStock = 1 THEN 1 ELSE 0 END) AS out_of_stock_products,
    SUM(CASE WHEN outOfStock = 0 THEN 1 ELSE 0 END) AS available_products
FROM zepto;

-- Total stock and total requested quantity
SELECT 
    SUM(availableQuantity) AS total_available_quantity,
    SUM(quantity) AS total_requested_quantity
FROM zepto;

-- Products with low stock (less than 2 units)
SELECT 
    name, 
    availableQuantity
FROM zepto
WHERE availableQuantity < 2
ORDER BY availableQuantity ASC;

-- Products with no discount
SELECT 
    name, 
    mrp, 
    discountPercent
FROM zepto
WHERE discountPercent = 0;

-- Top 10 most requested products
SELECT TOP 10
    name, 
    SUM(quantity) AS total_requested
FROM zepto
GROUP BY name
ORDER BY total_requested DESC;

-- ==========================================================
-- TOPIC 3: Price and Discount Analysis
-- ==========================================================
-- Overall summary of MRP, discounted price, and discount %
SELECT 
    ROUND(AVG(mrp), 2) AS average_mrp,
    ROUND(AVG(discountedSellingPrice), 2) AS average_discounted_price,
    ROUND(AVG(discountPercent), 2) AS average_discount_percent,
    MAX(discountPercent) AS max_discount_percent,
    MIN(discountPercent) AS min_discount_percent
FROM zepto;

-- Discount value per product
SELECT 
    name, 
    mrp, 
    discountedSellingPrice, 
    (mrp - discountedSellingPrice) AS actual_discount_value
FROM zepto;

-- Price per 100 grams (for valid weights only)
SELECT 
    name,
    mrp,
    weightInGms,
    ROUND((mrp / weightInGms) * 100, 2) AS price_per_100g
FROM zepto
WHERE weightInGms IS NOT NULL AND weightInGms > 0;

-- ==========================================================
-- TOPIC 4: Category-Based Analysis
-- ==========================================================
-- Number of products per category
SELECT 
    Category,
    COUNT(*) AS total_products
FROM zepto
GROUP BY Category
ORDER BY total_products DESC;

-- Average discount percent per category
SELECT 
    Category,
    ROUND(AVG(discountPercent), 2) AS average_discount_percent
FROM zepto
GROUP BY Category
ORDER BY average_discount_percent DESC;

-- Total available quantity per category
SELECT 
    Category,
    SUM(availableQuantity) AS total_available
FROM zepto  
GROUP BY Category
ORDER BY total_available DESC;

-- Out-of-stock product count per category
SELECT 
    Category,
    COUNT(*) AS out_of_stock_count
FROM zepto
WHERE outOfStock = 1
GROUP BY Category;

-- High demand and low stock products by category
SELECT 
    Category,
    name, 
    quantity, 
    availableQuantity
FROM zepto
WHERE quantity > 10 
  AND availableQuantity < 5
ORDER BY 
    Category,
    quantity DESC;

-- ==========================================================
-- TOPIC 5: Business Opportunities & Alerts
-- ==========================================================
-- Products with high discount and low stock
SELECT 
    name, 
    discountPercent, 
    availableQuantity
FROM zepto
WHERE discountPercent > 20 
  AND availableQuantity <= 2
ORDER BY discountPercent DESC;

-- High-price but low-demand products
SELECT 
    name, 
    mrp, 
    quantity 
FROM zepto 
WHERE mrp > 3000 
  AND quantity < 4
ORDER BY mrp DESC;
