-- Users Table
CREATE TABLE users (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    email NVARCHAR(255) UNIQUE NOT NULL,
    phone NVARCHAR(15) NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);

-- Transactions Table
CREATE TABLE transactions (
    id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT FOREIGN KEY REFERENCES users(id) ON DELETE CASCADE,
    amount DECIMAL(10,2) NOT NULL,
    status NVARCHAR(50) CHECK (status IN ('Completed', 'Pending', 'Failed')) NOT NULL,
    card_number_hash NVARCHAR(255) NOT NULL,
    ip_address NVARCHAR(45) NOT NULL,
    country NVARCHAR(100) NOT NULL,
    fraud_score INT DEFAULT 0,
    risk_seviyesi NVARCHAR(20),
    transaction_date DATETIME DEFAULT GETDATE()
);

-- Fraud Alerts Table
CREATE TABLE fraud_alerts (
    id INT PRIMARY KEY IDENTITY(1,1),
    transaction_id INT FOREIGN KEY REFERENCES transactions(id) ON DELETE CASCADE,
    reason NVARCHAR(255) NOT NULL,
    alert_date DATETIME DEFAULT GETDATE()
);

-- Chargebacks Table
CREATE TABLE chargebacks (
    id INT PRIMARY KEY IDENTITY(1,1),
    transaction_id INT FOREIGN KEY REFERENCES transactions(id) ON DELETE CASCADE,
    reason NVARCHAR(255) NOT NULL,
    chargeback_date DATETIME DEFAULT GETDATE()
);
