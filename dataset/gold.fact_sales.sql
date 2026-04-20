if OBJECT_ID('gold.fact_sales','V') IS NOT NULL
  drop view gold.fact_sales 
GO
CREATE VIEW GOLD.fact_sales as
SELECT
	sd.sls_ord_num as order_number,
	dr.product_key,
	cu.customer_key,
	sd.sls_order_dt as order_date,
	sd.sls_ship_dt as shipping_date,
	sd.sls_due_dt as due_date,
	sd.sls_sales as sales,
	sd.sls_quantity as quantity,
    sd.sls_price as price
FROM silver.crm_sales_details sd
LEFT JOIN GOLD.dim_product as dr
ON sd.sls_prd_key= dr.product_number 
LEFT JOIN GOLD.dim_customer cu
ON sd.sls_cust_id= cu.customer_id 