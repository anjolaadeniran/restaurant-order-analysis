# Restaurant Order Analysis (SQL)

## Project Overview  
This project analyzes restaurant order data to identify **customer ordering patterns, menu performance, and revenue drivers**. Using SQL, the analysis explores item popularity, order composition, and high-value transactions to support **menu optimization and strategic decision-making**.

The project focuses on translating raw transactional data into **clear, business-ready insights**.

---

## Business Objectives  
The analysis was guided by three core objectives:

1. Explore the structure and pricing of the menu  
2. Analyze order volume and item distribution  
3. Understand customer behavior and high-spend orders  

---

## Dataset Description  

The analysis uses two relational tables:

### `menu_items`
Contains menu-level information:
- `menu_item_id`
- `item_name`
- `category`
- `price`

### `order_details`
Contains transactional order data:
- `order_details_id`
- `order_id`
- `order_date`
- `item_id`

---

##  Key Questions Answered  

- What is the price distribution across menu categories?
- Which menu items are ordered most and least frequently?
- How many orders contain unusually large item counts?
- Which orders generated the highest total spend?
- What categories dominate high-value orders?

---

## Analytical Approach  

- Used SQL aggregations (`COUNT`, `SUM`, `AVG`) to measure order frequency and value
- Applied `GROUP BY` and `HAVING` clauses to identify high-volume and high-value orders
- Joined transactional and menu datasets to enrich analysis
- Ranked and filtered results to surface top-performing items and orders

---

## Key Insights  

- **American cuisine** dominates order frequency, driven by popular staples such as burgers and fries.
- **Italian cuisine** consistently appears in the **highest-spend orders**, indicating strong contribution to revenue despite lower order frequency.

---

## Business Recommendations  

- Retain high-volume American items to sustain consistent order flow.
- Strategically prioritize Italian dishes for bundles and promotions due to their role in high-value orders.
- Review low-performing items for potential repricing, repositioning, or removal.
- Leverage insights from large orders to design group-oriented meal offerings.

---

## Tools & Skills Used  

- SQL (Joins, Aggregations, Subqueries, CTEs)
- Data exploration and customer behavior analysis
- Translating data findings into business insights



## SQL Queries  

All SQL queries used in this analysis can be found here:

➡️ [restaurant_analysis.sql](sql/restaurant_analysis.sql)

---

## 📌 Notes  

This project is part of a broader data analytics portfolio focused on **real-world business questions**, clean SQL logic, and insight-driven storytelling.
