#### Preamble ####
# Purpose: Calls and saves the cleaned data (data pre-cleaned with SQL in DB Browser)
# Author: Jamie Lee
# Date: 14 November 2024
# Contact: jamiejimin.lee@mail.utoronto.ca
# License: MIT
# Pre-requisites: Raw data obtained from Project Hammer in SQLite file and cleaned with SQL in DB Browser
# Any other information needed? N/A

SELECT 
  STRFTIME('%Y-%m-%d %H:%M:%S', nowtime) AS nowtime, 
  product_id,
  current_price,
  old_price,
  other,
  product_name,
  vendor
FROM 
  raw
JOIN 
  product ON product_id = id
WHERE vendor = 'Loblaws'
  AND product_id IS NOT NULL
  AND current_price IS NOT NULL
  AND old_price IS NOT NULL
  AND product_name IS NOT NULL;