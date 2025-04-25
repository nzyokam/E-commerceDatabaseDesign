# 🛍️ E-Commerce Database Project

Welcome to the **E-Commerce Database Design Project**! This project defines a robust relational schema for an e-commerce platform, including product listings, inventory, size/color variations, and flexible product attributes.

---

## 📁 Project Structure

📦 ecommerce-database/ 

├── E-commerce Database Design ERD.png # ERD

├── ecommerce.sql        # SQL script to create all database tables 

└── README.md            # Project documentation (this file)

---

## 🚀 Tech Stack

- **Database:** MySQL  
- **ERD Tool:** dbdiagram.io  
- **Version Control:** Git + GitHub

---

## 🧱 ERD Tables Overview

| Table                | Description |
|----------------------|-------------|
| `brand`              | Brand information |
| `product_category`   | Categories of products (e.g. clothing, electronics) |
| `product`            | Product info (name, description, brand, price) |
| `product_image`      | Product image URLs and alt text |
| `color`              | Color options for product variations |
| `size_category`      | Categories for size types (e.g. clothes, shoes) |
| `size_option`        | Specific size entries (e.g. M, L, 42) |
| `product_item`       | Individual purchasable units (SKU, stock, price) |
| `product_variation`  | Connects product items with color and size |
| `attribute_category` | Groups for custom product attributes |
| `attribute_type`     | Type of attribute values (text, number, boolean) |
| `product_attribute`  | Specific attribute entries per product |

---

## 🔄 Data Flow Summary

- A **product** belongs to a **brand** and a **category**.
- A **product** has multiple **product_items**, each representing a unique combination of size and color.
- **product_variation** connects items to **color** and **size_option**.
- **product_image** holds references to product visuals.
- **product_attribute** supports extensible custom properties like material, weight, etc.

---

## ⚙️ Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/ecommerce-database.git
   cd ecommerce-database
