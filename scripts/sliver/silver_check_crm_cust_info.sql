/*Step 1: Check if there is any nulls or duplicates in primary key*/
SELECT
    cst_id,
    COUNT(*)
FROM
    silver.crm_cust_info
GROUP BY
    cst_id
HAVING
    COUNT(*) > 1
    OR cst_id IS NULL
SELECT
    *
FROM
    (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY
                    cst_id
                ORDER BY
                    cst_create_date DESC
            ) as flag_last
        FROM
            silver.crm_cust_info
    ) t
WHERE
    flag_last != 1

 /*Step 2: Check if unwanted Spaces*/
SELECT
    cst_lastname
FROM
    silver.crm_cust_info
WHERE
    cst_lastname != TRIM(cst_lastname)
   
   
 /* Step 3: Check if the data is valid and consistent */
SELECT DISTINCT
    cst_marital_status
FROM
    silver.crm_cust_info