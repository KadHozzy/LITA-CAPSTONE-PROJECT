SELECT Product, SUM(Sales) AS TotalSales
FROM [CapstoneSDB].[dbo].[PROJECT 1 CAPSTONE SQL]
GROUP BY Product;


SELECT Region, COUNT(DISTINCT OrderID) AS TransactionCount
FROM [CapstoneSDB].[dbo].[PROJECT 1 CAPSTONE SQL]
GROUP BY Region;


SELECT TOP 1 Product, SUM(Sales) AS TotalSales
FROM [CapstoneSDB].[dbo].[PROJECT 1 CAPSTONE SQL]
GROUP BY Product
ORDER BY TotalSales DESC;


SELECT Product, SUM(Sales) AS TotalRevenue
FROM [CapstoneSDB].[dbo].[PROJECT 1 CAPSTONE SQL]
GROUP BY Product;


SELECT MONTH(OrderDate) AS Month, SUM(Sales) AS TotalSales
FROM [CapstoneSDB].[dbo].[PROJECT 1 CAPSTONE SQL]
WHERE YEAR(OrderDate) = YEAR(GETDATE())
GROUP BY MONTH(OrderDate)
ORDER BY Month;



SELECT TOP 5 [Customer_Id], SUM(Sales) AS TotalPurchase
FROM [CapstoneSDB].[dbo].[PROJECT 1 CAPSTONE SQL]
GROUP BY [Customer_Id]
ORDER BY TotalPurchase DESC;


WITH RegionSales AS (
    SELECT Region, SUM(Sales) AS SalesByRegion
    FROM [CapstoneSDB].[dbo].[PROJECT 1 CAPSTONE SQL]
    GROUP BY Region
), TotalSales AS (
    SELECT SUM(Sales) AS TotalSales
    FROM [CapstoneSDB].[dbo].[PROJECT 1 CAPSTONE SQL]
)
SELECT Region,
       SalesByRegion,
       (SalesByRegion * 100.0 / (SELECT TotalSales FROM TotalSales)) AS SalesPercentage
FROM RegionSales;


SELECT DISTINCT Product
FROM [CapstoneSDB].[dbo].[PROJECT 1 CAPSTONE SQL]
WHERE Product NOT IN (
    SELECT DISTINCT Product
    FROM [CapstoneSDB].[dbo].[PROJECT 1 CAPSTONE SQL]
    WHERE YEAR(OrderDate) = YEAR(GETDATE()) AND MONTH(OrderDate) IN (10, 11, 12)
);
