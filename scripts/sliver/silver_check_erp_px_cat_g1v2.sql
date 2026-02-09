SELECT
    id,
    cat,
    subcat,
    maintenance
FROM
    bronze.erp_px_cat_g1v2
    ---- check cat
    ---- Check if unwanted spaces
    --SELECT *
    --FROM bronze.erp_px_cat_g1v2
    --WHERE cat = TRIM(cat) OR subcat = TRIM(subcat) OR  maintenance = TRIM(maintenance)
    -- maintaince
    -- Data Standard
SELECT DISTINCT
    maintenance
FROM
    bronze.erp_px_cat_g1v2