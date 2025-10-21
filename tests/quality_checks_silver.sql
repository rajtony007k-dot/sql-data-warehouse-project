-- ====================================================
-- Checking 'silver.crm_cust_info'
-- ====================================================
-- Check for nulls or duplicates in primary key
-- Expectation: no result

SELECT 
cst_id,
COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

-- Check for unwanted spaces
-- Expectation: No results
SELECT cst_firstname
FROM 
silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

-- Data Standardization & Consistency
-- 
SELECT DISTINCT cst_gndr 
FROM
silver.crm_cust_info;

SELECT DISTINCT cst_marital_status 
FROM
silver.crm_cust_info 

select * from silver.crm_cust_info


-- ====================================================
-- Checking 'silver.crm_prd_info'
-- ====================================================
-- Check for nulls or duplicates in primary key
-- Expectation: no result
SELECT 
prd_id,
COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

-- Check for unwanted spaces
-- Expectation: No spaces
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

-- Check for NULLS or negative number
-- Expectation: No results
SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL

-- Data Standardization & Consistency
SELECT DISTINCT prd_line
FROM silver.crm_prd_info

-- Check for Invalid Date Orders
SELECT * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt


-- ====================================================
-- Checking 'silver.crm_sales_details'
-- ====================================================
--Check for invalid date orders
SELECT
*
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt
OR sls_order_dt > sls_due_dt;

-- Check data consistency: Between sales, quantity and price
-- >> Sales = Quantity * Price
-- >> Values must not be null, zero or negative

SELECT DISTINCT
sls_sales,
sls_quantity,
sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales < 0 OR sls_quantity < 0 OR sls_price < 0
ORDER BY sls_sales, sls_quantity, sls_price;


-- ====================================================
-- Checking 'silver.erp_cust_az12'
-- ====================================================
--Identify out of range dates 
SELECT DISTINCT 
bdate from silver.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE();

-- Data standardization and Inconsistency
SELECT DISTINCT 
gen
FROM silver.erp_cust_az12


-- ====================================================
-- Checking 'silver.erp_loc_a101'
-- ====================================================
-- Data standardization & consistency
SELECT DISTINCT cntry
FROM silver.erp_loc_a101
ORDER BY cntry;

select * from silver.erp_loc_a101


-- ====================================================
-- Checking 'silver.erp_px_cat_g1v2'
-- ====================================================
-- Check for unwanted spaces
SELECT * FROM silver.erp_px_cat_g1v2
WHERE TRIM(cat) != cat OR TRIM(subcat) != subcat
OR TRIM(maintenance) != maintenance;

-- Data standardization & Consistency
SELECT DISTINCT maintenance FROM silver.erp_px_cat_g1v2
