SELECT 
    products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    purchase_price, 
    ROUND(s.quantity*p.purchase_price,2) AS purchase_cost,
    s.revenue - ROUND(s.quantity*p.purchase_price,2) AS margin,
    {{ margin_percent('s.revenue', 's.quantity*CAST(p.purchSE_PRICE AS FLOAT64)') }} AS margin_macro
FROM {{ref("stg_raw__sales")}} s
LEFT JOIN {{ref("stg_raw__product")}} p 
	USING (products_id)