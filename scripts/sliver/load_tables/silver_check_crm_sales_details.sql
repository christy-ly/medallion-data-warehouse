-- Check data column by cloums
SELECT
  sls_ord_num,
  sls_prd_key,
  sls_cust_id,
  sls_order_dt,
  sls_ship_dt,
  sls_due_dt,
  sls_sales,
  sls_quantity,
  sls_price
FROM
  silver.crm_sales_details
  
--   -- Check sls_ord_num
-- SELECT
--   sls_ord_num
-- FROM
--   silver.crm_sales_details
-- WHERE
--   sls_ord_num != TRIM(sls_ord_num)
--   -- Check sls_prd_key
-- SELECT
--   sls_prd_key
-- FROM
--   silver.crm_sales_details
-- WHERE
--   sls_prd_key NOT IN (
--     SELECT
--       sls_prd_key
--     FROM
--       silver.crm_prd_info
--   )
--   -- Check sls_cust_id
-- SELECT
--   sls_cust_id
-- FROM
--   silver.crm_sales_details
-- WHERE
--   sls_cust_id NOT IN (
--     SELECT
--       cst_id
--     FROM
--       silver.crm_cust_info
--   )
--   -- Check sls_order_dt
-- SELECT
--   NULLIF(sls_order_dt, 0) sls_order_dt
-- FROM
--   silver.crm_sales_details
-- WHERE
--   sls_order_dt <= 0
--   OR LEN (sls_order_dt) != 8
--   OR sls_order_dt > 20500101
--   OR sls_order_dt < 19000101
--   -- Check sls_order_dt
-- SELECT
--   NULLIF(sls_ship_dt, 0) sls_order_dt
-- FROM
--   silver.crm_sales_details
-- WHERE
--   sls_ship_dt <= 0
--   OR LEN (sls_ship_dt) != 8
--   OR sls_ship_dt > 20500101
--   OR sls_ship_dt < 19000101
-- SELECT
--   *
-- FROM
--   silver.crm_sales_details
-- WHERE
--   sls_order_dt > sls_ship_dt
--   OR sls_order_dt > sls_due_dt

SELECT DISTINCT
  sls_sales AS old_sls_sales,
  sls_quantity,
  sls_price AS old_sls_price,
  CASE
    WHEN sls_sales IS NULL
    OR sls_sales <= 0
    OR sls_sales != sls_quantity * ABS(sls_price) THEN sls_quantity * ABS(sls_price)
    ELSE sls_sales
  END AS sls_sales,
  CASE
    WHEN sls_price IS NULL
    OR sls_price <= 0 THEN sls_sales / NULLIF(sls_quantity, 0)
  END AS sls_price
FROM
  silver.crm_sales_details
WHERE
  sls_sales != sls_quantity * sls_price
  OR sls_sales IS NULL
  OR sls_quantity IS NULL
  OR sls_price IS NULL
  OR sls_sales <= 0
  OR sls_quantity <= 0
  OR sls_price <= 0
ORDER BY
  sls_sales,
  sls_quantity,
  sls_price