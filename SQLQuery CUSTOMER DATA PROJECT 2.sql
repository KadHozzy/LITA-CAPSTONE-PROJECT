SELECT Region, COUNT(CustomerID) AS Total_Customers
FROM [dbo].[LITA CAPSTONE 2]
GROUP BY Region;

SELECT TOP 1 SubscriptionType, COUNT(CustomerID) AS Total_Customers
FROM [dbo].[LITA CAPSTONE 2]
GROUP BY SubscriptionType
ORDER BY Total_Customers DESC;

SELECT CustomerID, CustomerName, SubscriptionType, SubscriptionStart, SubscriptionEnd
FROM [dbo].[LITA CAPSTONE 2]
WHERE Canceled = 1 AND Subscription_Duration < 6;

SELECT AVG(Subscription_Duration) AS Average_Subscription_Duration
FROM [dbo].[LITA CAPSTONE 2];

SELECT CustomerID, CustomerName, SubscriptionType, Subscription_Duration
FROM [dbo].[LITA CAPSTONE 2]
WHERE Subscription_Duration > 12;

SELECT SubscriptionType, SUM(Revenue) AS Total_Revenue
FROM [dbo].[LITA CAPSTONE 2]
GROUP BY SubscriptionType;

SELECT TOP 3 Region, COUNT(CustomerID) AS Cancellations
FROM [dbo].[LITA CAPSTONE 2]
WHERE Canceled = 1
GROUP BY Region
ORDER BY Cancellations DESC;

SELECT 
    CASE 
        WHEN Canceled = 1 THEN 'Canceled'
        ELSE 'Active'
    END AS Subscription_Status,
    COUNT(CustomerID) AS Total_Customers
FROM [dbo].[LITA CAPSTONE 2]
GROUP BY Canceled;
