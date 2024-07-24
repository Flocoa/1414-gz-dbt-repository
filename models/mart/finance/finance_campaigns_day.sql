SELECT 
  date_date,
  (operational_margin - ads_cost) AS ads_margin,
  ROUND(average_basket,2) AS average_basket,
  operational_margin,
  ads_cost,
  ads_impression,
  ads_clicks,
  quantity,
  revenue,
  purchase_cost,
  margin,
  shipping_fee,
  logcost,
  ship_cost
FROM `dev-acolyte-384710`.`dbt_flocoa`.`int_campaigns_days`
FULL OUTER JOIN `dev-acolyte-384710`.`dbt_flocoa_finance`.`finance_days` 
  USING (date_date)
ORDER BY date_date DESC