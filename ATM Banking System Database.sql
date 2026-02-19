CREATE DATABASE atm;
USE atm;
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(200)
);
SELECT * FROM customers; 

CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    account_number VARCHAR(20) UNIQUE,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    pin INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
SELECT * FROM accounts;

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
SELECT * FROM transactions;

INSERT INTO customers (name, phone, email, address)
VALUES ('Rahul Sharma', '9876543210', 'rahul@gmail.com', 'Delhi');

INSERT INTO customers (name, phone, email, address)
VALUES ('Rohan Sharma', '9856573210', 'golu@gmail.com', 'Dhanbad');

INSERT INTO customers (name, phone, email, address)
VALUES ('Anurag', '9876865210', 'kabir@gmail.com', 'Mumbai');

INSERT INTO accounts (customer_id, account_number, account_type, balance, pin)
VALUES (1, '1234567890', 'Savings', 10000.00, 1234);
INSERT INTO accounts (customer_id, account_number, account_type, balance, pin)
VALUES (2, '1234567880', 'Savings', 16000.00, 1260);
INSERT INTO accounts (customer_id, account_number, account_type, balance, pin)
VALUES (2, '1234567990', 'Savings', 20000.00, 1278);

SELECT * FROM accounts
WHERE account_number = '1234567890' AND pin = 1234;

SELECT balance FROM accounts
WHERE account_number = '1234567880';

UPDATE accounts
SET balance = balance + 2000
WHERE account_number = '1234567890';

INSERT INTO transactions (account_id, transaction_type, amount)
VALUES (1, 'Deposit', 2000);

UPDATE accounts
SET balance = balance - 1000
WHERE account_number = '1234567890' AND balance >= 1000;

INSERT INTO transactions (account_id, transaction_type, amount)
VALUES (1, 'Withdraw', 1000);

SELECT transaction_type, amount, transaction_date
FROM transactions
WHERE account_id = 1
ORDER BY transaction_date DESC;







