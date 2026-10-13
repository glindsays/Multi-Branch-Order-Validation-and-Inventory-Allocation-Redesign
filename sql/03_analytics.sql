SELECT 
    b.branch_name,
    COUNT(o.order_id) AS pending_order_count,
    ROUND(AVG(CURRENT_DATE - o.order_date), 1) AS avg_delay_days
FROM Orders o
JOIN Branches b ON o.branch_id = b.branch_id
WHERE o.status = 'Pending'
GROUP BY b.branch_name
ORDER BY avg_delay_days DESC;

SELECT 
    b.branch_name,
    p.product_name,
    i.stock_on_hand,
    p.reorder_threshold,
    (p.reorder_threshold - i.stock_on_hand) AS deficit
FROM Inventory i
JOIN Products p ON i.product_id = p.product_id
JOIN Branches b ON i.branch_id = b.branch_id
WHERE i.stock_on_hand < p.reorder_threshold
ORDER BY deficit DESC;

SELECT 
    d.dealer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.qty_ordered * p.unit_price) AS total_transaction_value
FROM Orders o
JOIN Dealers d ON o.dealer_id = d.dealer_id
JOIN Products p ON o.product_id = p.product_id
WHERE o.status != 'Cancelled'
GROUP BY d.dealer_name
ORDER BY total_transaction_value DESC
LIMIT 5;

SELECT 
    b.branch_name,
    COUNT(o.order_id) AS cancelled_orders,
    SUM(o.qty_ordered * p.unit_price) AS lost_revenue
FROM Orders o
JOIN Branches b ON o.branch_id = b.branch_id
JOIN Products p ON o.product_id = p.product_id
WHERE o.status = 'Cancelled'
GROUP BY b.branch_name
ORDER BY cancelled_orders DESC;