# Mini E-Commerce Database: Sales & Customer Analytics

## 📌 Project Overview

This project is a mini e-commerce database built using PostgreSQL.

The objective is to design a relational database for an online store and use SQL queries to analyze customers, products, orders, sales and business trends.

The project demonstrates both fundamental and intermediate SQL concepts through practical e-commerce scenarios.

---

## 🎯 Objectives

- Design a relational e-commerce database
- Create tables with appropriate constraints
- Insert and manage sample business data
- Retrieve and filter data using SQL
- Handle NULL values
- Perform aggregate calculations
- Use different types of JOINs
- Apply conditional logic using CASE
- Use string and date/time functions
- Perform business-oriented sales analysis

---

## 🛠️ Technologies Used

- PostgreSQL
- SQL
- pgAdmin 4
- Visual Studio Code
- Git & GitHub

---

## 🗄️ Database Structure

The database contains five main tables:

### 1. Categories

Stores product categories.

### 2. Customers

Stores customer information such as name, email, city and phone number.

### 3. Products

Stores product information including category, price, stock and description.

### 4. Orders

Stores customer orders, order dates and order status.

### 5. Order Items

Stores individual products included in each order.

### Relationship

```text
Categories
     │
     ▼
 Products
     │
     ▼
Order Items
     │
     ▼
 Orders
     │
     ▼
Customers