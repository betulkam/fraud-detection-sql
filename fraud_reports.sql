-- En çok fraud yapan kullanıcılar
SELECT user_id, COUNT(*) AS fraud_count, SUM(fraud_score) AS total_risk
FROM transactions
WHERE fraud_score > 0
GROUP BY user_id
ORDER BY total_risk DESC;

-- En riskli IP adresleri
SELECT ip_address, COUNT(*) AS transaction_count, SUM(fraud_score) AS total_risk
FROM transactions
WHERE fraud_score > 0
GROUP BY ip_address
ORDER BY total_risk DESC;

-- Hangi ülkelerde en fazla fraud var?
SELECT country, COUNT(*) AS fraud_count, SUM(fraud_score) AS total_risk
FROM transactions
WHERE fraud_score > 0
GROUP BY country
ORDER BY total_risk DESC;
