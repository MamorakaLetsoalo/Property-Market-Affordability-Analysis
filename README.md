
# 🏠 South Africa Property Affordability & Investment Analysis

## 📌 Project Overview

This project analyzes residential property data across South Africa to assess:

* Housing affordability risk
* Income qualification thresholds
* Provincial price disparities
* Investment attractiveness
* First-time buyer accessibility

The goal is to build a data-driven framework that helps:

* 🏦 Banks assess credit affordability risk
* 🏗️ Developers identify underserved markets
* 📊 Investors compare provinces
* 🏠 Buyers identify financially viable areas

---

## South African Context

South Africa faces:

* High interest rates and bond qualification constraints
* Large income inequality
* Significant provincial price differences
* Growing affordability pressure on middle-income earners

Banks typically apply the **30% affordability rule**, meaning monthly bond repayments should not exceed 30% of gross monthly income.

This analysis evaluates how properties perform against that benchmark.

---

## 📂 Dataset Description

The dataset contains property-level information:

| Field                    | Description                |
| ------------------------ | -------------------------- |
| PROPERTY_ID              | Unique identifier          |
| COUNTRY                  | Country (South Africa)     |
| PROVINCE                 | Province                   |
| CITY                     | City                       |
| PROPERTY_PRICE           | Listing price              |
| BEDROOMS                 | Number of bedrooms         |
| BATHROOMS                | Number of bathrooms        |
| PARKING                  | Parking spaces             |
| FLOOR_SIZE               | Property size (sqm)        |
| Monthly_Repayment        | Estimated bond repayment   |
| Total_Once_off_Costs     | Transfer & bond costs      |
| Min_Gross_Monthly_Income | Income required to qualify |

---

## 🎯 Business Problem

Which provinces and cities in South Africa are:

1. Most affordable relative to income?
2. Exposing buyers to financial overstretch risk?
3. Most attractive for property investment?
4. Accessible to first-time buyers?

---

## 🧮 Analytical Approach (SQL-Driven)

A master SQL transformation query was created to:

### ✔ Clean Data

* Handle division-by-zero using `NULLIF`
* Standardize calculated ratios

### ✔ Feature Engineering

* Price per Square Meter
* Affordability Ratio
* Income Segments
* Price Bands
* Risk Classification
* Provincial Ranking (Window Function)

### ✔ Business Rule Encoding

* 30% rule → Affordable
* 30–40% → Moderate Risk
* > 40% → High Risk

---

## 📊 Power BI Dashboard Structure

### 🔷 Executive Overview   🔷 Affordability Risk  🔷 Investment Insights

<img width="1316" height="744" alt="image" src="https://github.com/user-attachments/assets/b43b7886-11b6-48bb-9bb1-f78f58ffe2e5" />

---

## 📈 Business Insights

* Western Cape shows highest price per SQM
* Gauteng has highest affordability risk concentration
* Limpopo,Free State and notheren cape show strongest affordability ratios
* ~48.47% of properties exceed 30% affordability threshold
* luxary-market properties dominate national supply

---

## 🧠 Problem-Solving Demonstrated

This project demonstrates:

* Financial ratio modeling
* Risk classification logic
* Income segmentation
* SQL window functions
* Business rule encoding
* Executive-level dashboard design
* Data-to-strategy storytelling

---

## 🛠 Tools Used

* SQL (Data transformation & modeling)
* Power BI (Dashboard & visualization)
* Excel (Data export layer)

---

## 📁 Repository Structure

```
South-Africa-Property-Affordability-Analysis
│
├── SQL_Master_Query.sql
├── PowerBI_Dashboard.pbix
├── Property_Affordability_Dataset.xlx
└── README.md
```

---

## 🚀 Strategic Impact

This framework can be extended to:

* Interest rate scenario modeling
* Loan default risk scoring
* Property investment ROI modeling
* Time-series price forecasting
* Geospatial demand analysis

---

## 👩🏾‍💻 Author

Mamoraka Letsoalo
Certified Business Data Analyst (IIBA CBDA)

---

