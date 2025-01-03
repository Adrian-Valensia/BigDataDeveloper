SELECT
    p.product_category_id,
    p.product_name,
    SUM(oi.oreder_item_quantity) AS total_quantity,
    RANK() OVER (PARTITION BY P.product_category_id ORDER BY SUM(oi.order_item_quantity) DESC) AS product_rank
FROM order_items oi 
JOIN products p ON oi.order_item_product_id = p.product_id
GROUP BY p.product_name, p.product_category_id