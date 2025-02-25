UPDATE transactions
SET fraud_score = 
    (SELECT 
        CASE 
            WHEN t.amount > 5000 THEN 3  
            ELSE 0
        END 
        +
        CASE 
            WHEN ip_count.ip_freq > 5 THEN 2  
            ELSE 0
        END
        +
        CASE 
            WHEN cb_count.chargeback_freq > 2 THEN 5  
            ELSE 0
        END
    FROM transactions t
    LEFT JOIN ( 
        SELECT ip_address, COUNT(*) AS ip_freq 
        FROM transactions 
        GROUP BY ip_address
    ) AS ip_count ON t.ip_address = ip_count.ip_address
    LEFT JOIN (
        SELECT user_id, COUNT(*) AS chargeback_freq 
        FROM chargebacks c
        JOIN transactions t ON c.transaction_id = t.id
        GROUP BY user_id
    ) AS cb_count ON t.user_id = cb_count.user_id
    WHERE transactions.id = t.id
    );
GO
