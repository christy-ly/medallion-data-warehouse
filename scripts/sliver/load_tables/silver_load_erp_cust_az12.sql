INSERT INTO
    silver.erp_cust_az12 (cid, bdate, gen)
SELECT
    cid,
    CASE
        WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN (cid))
        ELSE cid
    END AS cid,
    CASE
        WHEN bdate > GETDATE () THEN NULL
        ELSE bdate
    END AS bdate,
    CASE
        WHEN UPPER(TRIM(gen)) IN ('F', 'FEMALE') THEN 'Female'
        WHEN UPPER(TRIM(gen)) IN ('M', 'MALE') THEN 'Male'
        ELSE 'N/A'
    END AS gen
FROM
    DataWarehouse.bronze.erp_cust_az12