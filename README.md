<h3 align="center"> 📈 Sales Data Warehouse & Analysis </h3>

## 💬 Overview
This project is a comprehensive data warehousing and analytics solution that demonstrates the end-to-end design and implementation of a modern sales data warehouse. It covers data ingestion, ETL processes, dimensional data modeling, and analytical querying to support business reporting and decision-making.

## 🎯 Objective
- **Data Architecture**: Design and implement a modern data warehouse using the Medallion Architecture (Bronze, Silver, and Gold layers).
- **ETL Pipelines**: Extract, transform, and load data from source systems into the data warehouse.
- **Data Modeling**: Develop fact and dimension tables optimized for analytical queries.
- **Analytics & Reporting**: Create SQL-based reports and dashboards to deliver actionable insights.

## 🛠 Tech Stack
- **Database**: Microsoft SQL Server  
- **ETL (Extract, Transform, Load)**: SQL-based data ingestion and transformation  
- **Data Modeling**: Star Schema using Fact and Dimension tables  
- **Analytics & Reporting**: Analytical SQL queries
  
## 🔎 Project Breakdown
### Part 1: Data Warehousing (SQL Server)
### 📋 Specifications
- **Data Sources**: Ingest data from two source systems (ERP and CRM) delivered as CSV files.
- **Data Quality**: Identify, clean, and resolve data quality issues before analysis.
- **Data Integration**: Merge both data sources into a unified, analytics-friendly data model.
- **Project Scope**: Work only with the most recent data; historical tracking is out of scope.
- **Documentation**: Create clear and structured data model documentation for business users and analytics teams.

### 🧱 Data Architecture (Medallion Architecture)
![architecture](https://github.com/christy-ly/medallion-data-warehouse/blob/main/docs/architecture.jpg)


| Item | 🥉 Bronze Layer | 🥈 Silver Layer | 🥇 Gold Layer |
|-----|---------------|---------------|--------------|
| **Purpose** | Raw data ingestion | Cleaned and standardized data | Analytics-ready data |
| **Data Source** | Source systems | Bronze layer | Silver layer |
| **Transformations** | Minimal or none | Cleansing, standardization | Business aggregations |
| **Data Quality** | Not enforced | Deduplication and validation | Fully validated |
| **Schema / Model** | Mirrors source data | Refined relational schema | Star schema |
| **Tables** | Raw tables | Cleaned tables | Fact and Dimension tables |
| **Optimization** | None | Moderate | Optimized for reporting |


### Part 2: Data Analysis & Business Intelligence (BI)
- TBC

  
## 📂 Folder Structure
```
medallion-data-warehouse/
│
├── datasets/ # Contains raw datasets from ERP and CRM systems (CSV files)
│
├── docs/ # Project documentation, including architecture and data model details
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts to extract and load raw data into the Bronze layer
│   ├── silver/                         # Scripts to clean, standardize, and transform data in the Silver layer
│   ├── gold/                           # Scripts to build analytics-ready models (fact and dimension tables) in the Gold layer
├── README.md 
```
