# E-Commerce-SQL-Analysis
Advanced SQL analysis of the Olist Brazilian E-Commerce dataset.
# 🛒 E-Commerce Sales & Logistics Analytics (Olist)

> **✅ Status: Completed**

## 📖 Project Overview
This repository contains advanced SQL analytics performed on the [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce). The goal of this project is to extract actionable business insights regarding logistics bottlenecks, customer purchasing behavior, and revenue trends using Senior-level SQL techniques.

## 🛠️ Tech Stack
- **Database:** SQLite
- **Techniques Used:** Complex JOINs, Aggregations, Date Manipulation, Common Table Expressions (CTEs), and Window Functions.

## 📅 Daily Progress Tracker
- [x] **Day 1:** Environment Setup & Database Architecture
- [x] **Day 2:** Logistics Bottlenecks & VIP Customer Identification (`JOIN`, `GROUP BY`, Date Math)
- [x] **Day 3:** Category Best-Sellers (`Window Functions`, `PARTITION BY`) 
- [x] **Day 4:** Customer Retention Analysis (`HAVING` clause)
- [x] **Day 5:** Executive Summary & Business Insights

## 💡 Key Business Insights (The "So What?")
Through SQL analysis, several critical business opportunities were identified:
1. **The Logistics Bottleneck:** Delivery times to Northern Brazilian states (RR, AP, AM, PA) average nearly 30 days. Optimizing supply chain routes in the Amazon region is critical for customer satisfaction.
2. **Untapped B2B Potential:** Analysis of top spenders revealed single-order values exceeding $13,000, strongly suggesting Olist has a hidden B2B (Business-to-Business) customer base that requires a dedicated VIP or bulk-purchasing program.
3. **The Retention Problem:** Despite having ~96,000 unique customers, the repeat-purchase rate is extremely low (only ~3.1% have made more than one order). Implementing a targeted loyalty program is the #1 highest-ROI opportunity for the marketing team.

---
*Note: Due to data privacy and size constraints, the raw 100MB+ database file is not hosted in this repository. All queries are designed to run on the standard Kaggle Olist schema.*
