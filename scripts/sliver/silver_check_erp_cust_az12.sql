--SELECT CASE WHEN cid LIKE'NAS%' THEN SUBSTRING(cid,4,LEN(cid))
--ELSE cid 
--END AS cid
--,bdate
--,gen
--FROM DataWarehouse.bronze.erp_cust_az12
--WHERE cid NOT IN (SELECT DISTINCT cst_key FROM silver.crm_cust_info )
--SELECT * FROM silver.crm_cust_info
---- Check if out of range dates
--SELECT DISTINCT bdate 
--FROM bronze.erp_cust_az12
--WHERE bdate < '1900-01-01' OR bdate > GETDATE()
-- Data Standardization & Consistency
SELECT DISTINCT
    gen
FROM
    bronze.erp_cust_az12
SELECT
    cst_key
FROM
    silver.crm_cust_info;