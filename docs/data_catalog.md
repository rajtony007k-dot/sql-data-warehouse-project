# Data Dictionary for Gold Layer

## Overview
The Gold Layer is the business-level data representation, structured to support analytical and reporting use cases. It consists of **dimension tables** and **fact tables** for specific business metrics.

## 1. gold.dim_customers

- **Purpose**: Stores customer details enriched with demographic and geographic data.
- **Columns**:

| Column Name | Datatype | Description |
|---|---|---|
| customer_key | INT | Surrogate key identifying each customer record in the dimension table. | 
| customer_id | INT | Unique numerical identifier assigned to each customer. |
| customer_number | NVARCHAR(50) | Alphanumeric identifier representing the customer, used for tracking and referencing. |
| first_name | NVARCHAR(50) | The customer's firstname, as recorded in the system. |
