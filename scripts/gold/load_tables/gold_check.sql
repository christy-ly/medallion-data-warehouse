-- Check if duplicated reords
SELECT cst_id, COUNT(*) From (
SELECT
cst_id,
cst_key
cst_firstname,
cst_lastname,
cst_marital_status,
cst_gndr,
cst_create_date,
ca.bdate,
ca.gen,
la.cntry
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_cust_az12 ca
ON ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 la
ON ci.cst_key = la.cid
) t 
GROUP BY cst_id 
HAVING COUNT(*) > 1

-- Check gender & data intergation
SELECT DISTINCT
cst_gndr,
ca.gen,
CASE WHEN ci.cst_gndr != 'N/A' THEN ci.cst_gndr
ELSE COALESCE(ca.gen, 'N/A')
END As new_gen
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_cust_az12 ca
ON ci.cst_key = ca.cid
LEFT JOIN silver.erp_loc_a101 la
ON ci.cst_key = la.cid
ORDER BY 1,2