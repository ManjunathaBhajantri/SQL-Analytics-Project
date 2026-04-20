-- =============================================================================
-- Create Dimension: gold.dim_products
-- =============================================================================

if OBJECT_ID('gold.dim_product','V') IS NOT NULL
  drop view gold.dim_product 
GO
CREATE VIEW gold.dim_product as
SELECT
ROW_NUMBER() OVER(ORDER BY pr.prd_start_dt,pr.prd_key) as product_key,
pr.prd_id as product_id,
pr.prd_key as product_number,
pr.prd_nm as product_name,
pr.cat_id as category_id,
px.CAT as category ,
px.SUBCAT as sub_category,
px.MAINTENANCE as maintenance,
pr.prd_cost as product_cost,
pr.prd_line as product_line,
pr.prd_start_dt as start_date
FROM SILVER.crm_prd_info pr
LEFT JOIN SILVER.ERP_PX_CAT_G1V2 px
on pr.cat_id=px.ID
where pr.prd_end_dt IS NULL
