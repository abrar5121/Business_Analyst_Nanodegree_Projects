/* =========================================
   Business Analyst – Sales Analysis Project
   ========================================= */

-- 1. Create sales table
CREATE TABLE sales_data (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    region VARCHAR(50),
    product_category VARCHAR(50),
    sales_amount DECIMAL(10,2),
    profit DECIMAL(10,2)
);

-- 2. Insert sample business data
INSERT INTO sales_data VALUES
(101, '2024-01-05', 1001, 'East', 'Electronics', 1200.00, 300.00),
(102, '2024-01-06', 1002, 'West', 'Furniture', 800.00, 150.00),
(103, '2024-01-07', 1003, 'East', 'Office Supplies', 200.00, 40.00),
(104, '2024-01-08', 1004, 'South', 'Electronics', 1500.00, 400.00),
(105, '2024-01-09', 1005, 'North', 'Furniture', 950.00, 200.00);

-- 3. Total sales by region
SELECT 
    region,
    SUM(sales_amount) AS total_sales
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;

-- 4. Profit analysis by product category
SELECT 
    product_category,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY product_category
ORDER BY total_profit DESC;

-- 5. Average order value
SELECT 
    AVG(sales_amount) AS avg_order_value
FROM sales_data;

-- 6. Identify high-performing orders
SELECT 
    order_id,
    region,
    sales_amount,
    profit
FROM sales_data
WHERE profit > 200;

-- 7. Business insight: profit margin
SELECT
    order_id,
    sales_amount,
    profit,
    (profit / sales_amount) * 100 AS profit_margin_percentage
FROM sales_data;
