CREATE TABLE online_retail (
    `index` INT NOT NULL AUTO_INCREMENT,
    Invoice VARCHAR(255),
    IsCanc VARCHAR(255),
    StockCode VARCHAR(255),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    TotalPrice DECIMAL(10,2),
    CustomerID VARCHAR(255),
    Country VARCHAR(255),
    PRIMARY KEY (`index`)
);


SELECT * FROM online_retail;


-- Querying to Answer Questions

-- What is the total amount of product sold and the revenue generated by the company? 

SELECT
    FORMAT(SUM(Quantity), 0) AS 'TotalQuantitySold',
    FORMAT(SUM(TotalPrice), 2) AS 'TotalRevenue'
FROM online_retail;

-- What Countries are generating the store the most revenue?

SELECT
    Country,
    SUM(TotalPrice) AS 'TotalRevenue'
FROM online_retail
GROUP BY Country
ORDER BY TotalRevenue DESC
LIMIT 10;


-- Who are the top 25 most valuable customers?

UPDATE online_retail
SET CustomerID = NULL
WHERE CustomerID = '';

SELECT
    CustomerID,
    SUM(TotalPrice) AS TotalSpend
FROM online_retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalSpend DESC
LIMIT 25;

-- How many Cancelations were there and what was the total loss of revenue because of those cancelations?

SELECT
    IsCanc,
    COUNT(IsCanc) AS CntCanc,
    FORMAT(SUM(TotalPrice), 2) AS Revenue
FROM online_retail
WHERE IsCanc = 'Yes'
GROUP BY IsCanc;


-- What customer(s) could be suspected of potential fraud using cancelled invoices?

SELECT
    CustomerID,
    Count(IsCanc) AS TotalTransactions,
    SUM(Quantity) AS TotalQuantity,
    SUM(TotalPrice) AS Revenue
FROM online_retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY Revenue ASC;


-- What are the top 5 selling products in France that is not Postage?

SELECT
    Description,
    SUM(TotalPrice) AS TotalVolume,
    Country
FROM online_retail
WHERE Country = 'France' AND Description <> 'POSTAGE'
GROUP BY Description
ORDER BY TotalVolume DESC
LIMIT 5;