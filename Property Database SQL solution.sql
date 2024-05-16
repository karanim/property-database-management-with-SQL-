-- Good Morning Nerbert
-- You can use these for ur test. 
-- on this question 1 i feel they are trying to ensure you are able to
-- use more than two tables to acess information
-- we use join , you can check your notes faithfully
-- Question/ Solution 1
SELECT property.*
FROM property
JOIN inspection ON property.PropertyID = inspection.PropertyID
WHERE inspection.Comments IS NULL;

-- Question/solution
-- again this uses agents table and property to fileter out special case
-- same case of joins i think, u chack notes well
SELECT agent.*
FROM agent
JOIN property ON agent.AgentID = property.AgentID
WHERE property.Suburb = 'Daisy Hill' AND property.WeeklyRent < 540;
-- Question/solution  3
SELECT *
FROM property
WHERE PropertyID NOT IN (SELECT PropertyID FROM inspection);

-- Question/solution  4
SELECT a.AgentID, CONCAT(a.FirstName, ' ', a.LastName) AS AgentName, a.Phone, COUNT(p.PropertyID) AS NumPropertiesManaged
FROM agent a
JOIN property p ON a.AgentID = p.AgentID
GROUP BY a.AgentID, AgentName, a.Phone
HAVING COUNT(p.PropertyID) >= 2;

-- Question/solution 5
SELECT a.FirstName, a.LastName, p.PropertyID, p.Street, p.State, p.WeeklyRent
FROM agent a
JOIN property p ON a.AgentID = p.AgentID
WHERE p.WeeklyRent < (SELECT AVG(WeeklyRent) FROM property)
LIMIT 0, 1000;


-- Question/Solution 6
SELECT COUNT(*)
FROM inspection
WHERE InspectionDate >= DATE_SUB(NOW(), INTERVAL 1 YEAR);

-- Question/Solution 7
SELECT c.CustomerID, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, c.Phone, c.DOB
FROM customer c
JOIN inspection i ON c.CustomerID = i.CustomerID
GROUP BY c.CustomerID, CustomerName, c.Phone, c.DOB
ORDER BY COUNT(i.PropertyID) DESC
LIMIT 1;

-- Question/solution 8
SELECT r.JobID, r.JobDescription, r.Charge, p.PropertyID, CONCAT(a.FirstName, ' ', a.LastName) AS AgentName
FROM repairjob r
JOIN property p ON r.PropertyID = p.PropertyID
JOIN agent a ON p.AgentID = a.AgentID
WHERE r.Charge BETWEEN 1000 AND 3000;

-- Question/Solution 9
SELECT p.PropertyID, p.Street, SUM(r.Charge) AS TotalCost
FROM property p
LEFT JOIN repairjob r ON p.PropertyID = r.PropertyID
GROUP BY p.PropertyID, p.Street;

-- Question/Solution 10
SELECT t.TradesmanID, CONCAT(t.FirstName, ' ', t.LastName) AS TradesmanName, t.Phone, 
       r.JobID, r.JobDescription, r.Charge
FROM tradesman t
LEFT JOIN repairjob r ON t.TradesmanID = r.TradesmanID
ORDER BY t.LastName ASC;
