# 📉 Layoff Data Analytics

A SQL-based data cleaning and exploratory analysis project that uncovers insights from real-world layoff data. The dataset spans several years and industries across global companies, enabling deep analysis of economic and employment trends.

---

## 📌 Project Overview

This project focuses on:
- **Cleaning and preprocessing** raw layoff data using SQL
- Performing **Exploratory Data Analysis (EDA)** to extract trends
- Understanding **industry-wise**, **country-wise**, and **time-based** layoff patterns
- Preparing clean and structured data for future predictive modeling

---

## 🗃️ Dataset

The dataset used was sourced from [Layoffs.fyi](https://layoffs.fyi) and contains over **200,000+ records** of company layoffs including:
- Company name, location, industry
- Number and percentage laid off
- Stage of the company (e.g., Series A, IPO)
- Country, date, and funds raised

---

## 🧹 Data Cleaning (`DATA CLEANING PROJECT.sql`)

**Main Tasks:**
- ✅ Removed duplicate records using `ROW_NUMBER()` window function  
- ✅ Handled null and blank values  
- ✅ Standardized industry names, trimmed white spaces, and fixed country formats  
- ✅ Converted date strings into proper `DATE` format  
- ✅ Imputed missing industry data by joining on company names  
- ✅ Dropped unnecessary columns after processing  

🔧 Final cleaned data stored in `layoffs_staging2`

---

## 📊 Exploratory Data Analysis (`EDA.sql`)

**Key Analyses Performed:**
- 📅 Year-wise and month-wise layoff trends  
- 🌍 Country-wise layoffs  
- 🏭 Industry-wise layoffs  
- 🏢 Company-wise total layoffs  
- 🔄 Rolling totals of layoffs over time  
- 🥇 Top 5 companies by layoffs per year  

All queries were performed using SQL aggregate functions, window functions (`DENSE_RANK`, `ROLLING SUM`), and CTEs.

---

## 📌 Key Insights

- **Tech and Crypto sectors** observed the highest layoffs
- **United States** led globally in layoff numbers
- Significant layoffs peaked around **early 2023**
- Top companies (e.g., Google, Amazon) dominated the charts for layoffs in their respective years

---

## 🛠️ Tech Stack

- **SQL (MySQL)** for cleaning and analysis  
- **VS Code / MySQL Workbench** for running queries  
- **Spreadsheet tools / Python (optional)** for further visualization  

---

## 📈 Future Work

- Integrate visual dashboards using Python (Matplotlib/Seaborn or Tableau)  
- Build predictive models to forecast layoff trends  
- Automate data refresh and pipeline setup

---

## 🙌 Acknowledgements

- Dataset: [Layoffs.fyi](https://layoffs.fyi)
- SQL Learning Inspiration: Alex The Analyst YouTube channel

---

## 📎 Author

**Mohammad Amanullah**  
📍 Hyderabad, India  
📫 [amanullahmohammed402@gmail.com](mailto:amanullahmohammed402@gmail.com)

---

> _Feel free to fork or star this repo if you find it helpful!_
