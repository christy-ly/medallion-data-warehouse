/*Step 1: Check if there is any nulls or duplicates in primary key*/
SELECT
    prd_id,
    COUNT(*)
FROM
    bronze.crm_prd_info
GROUP BY
    prd_id
HAVING
    COUNT(*) > 0
    OR prd_id IS NULL
    
/* Step 2: Check if there is unwanted spaces*/
SELECT
    prd_nm
FROM
    bronze.crm_prd_info
WHERE
    prd_nm != TRIM(prd_nm)
    
/* Step 3: Check if there is NULLs or Negative numbers*/
SELECT
    prd_cost
FROM
    bronze.crm_prd_info
WHERE
    prd_cost < 0
    OR prd_cost IS NULL
   
 /* Step 4: Check if the valus is consistent*/
SELECT DISTINCT
    prd_line
FROM
    bronze.crm_prd_info
    
/*Step 5: Check Invalid Data Orders*/
SELECT
    *
FROM
    bronze.crm_prd_info
WHERE
    PRD_end_dt < prd_start_dt