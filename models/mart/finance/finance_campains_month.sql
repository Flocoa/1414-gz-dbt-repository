SELECT 
  date_trunc(date_date, MONTH) AS datemonth, 
  SUM(operational_margin - ads_cost) AS ads_margin,
  ROUND(SUM(average_basket),2) AS average_basket,
  SUM(operational_margin) AS operational_margin,
  SUM(ads_cost) AS ads_cost,
  SUM(ads_impression) AS ads_impression,
  SUM(ads_clicks) AS ads_clicks,
  SUM(quantity) AS quantity,
  SUM(revenue) AS revenue,
  SUM(purchase_cost) AS purchase_cost,
  SUM(margin) AS margin,
  SUM(shipping_fee) AS shipping_fee,
  SUM(log_cost) AS logcost,
  SUM(ship_cost) AS ship_cost,
FROM {{ ref('int_campaigns_days') }}
FULL OUTER JOIN {{ ref('finance_days') }} 
  USING (date_date)
GROUP BY datemonth
ORDER BY datemonth desc