INSERT INTO
    silver.erp_loc_a101 (cid, cntry)
SELECT
    REPLACE (cid, '-', '') AS cid,
    CASE
        WHEN TRIM(cntry) = 'DE' THEN 'Germnay'
        WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
        WHEN TRIM(cntry) = ''
        OR cntry IS NULL THEN 'N/A'
    END AS cntry
FROM
    DataWarehouse.bronze.erp_loc_a101