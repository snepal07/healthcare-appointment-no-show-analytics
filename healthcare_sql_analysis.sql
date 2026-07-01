USE healthcare_analytics;

SELECT
    `No-show`,
    COUNT(*) AS Total_Patients,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM appointments),2) AS Percentage
FROM appointments
GROUP BY `No-show`;
SELECT
    Age,
    COUNT(*) AS Total_Appointments,
    SUM(`No-show` = 'Yes') AS No_Shows,
    ROUND(AVG(`No-show` = 'Yes') * 100, 2) AS No_Show_Rate
FROM appointments
GROUP BY Age
ORDER BY No_Show_Rate DESC
LIMIT 15;
-- Query 3: Effect of SMS Reminders

SELECT
    SMS_received,
    COUNT(*) AS Total_Appointments,
    SUM(`No-show` = 'Yes') AS No_Shows,
    ROUND(AVG(`No-show` = 'Yes') * 100, 2) AS No_Show_Rate
FROM appointments
GROUP BY SMS_received;
-- Query 4: Top 10 Neighborhoods with Highest No-Show Rates

SELECT
    Neighbourhood,
    COUNT(*) AS Total_Appointments,
    SUM(`No-show` = 'Yes') AS No_Shows,
    ROUND(AVG(`No-show` = 'Yes') * 100, 2) AS No_Show_Rate
FROM appointments
GROUP BY Neighbourhood
HAVING COUNT(*) >= 50
ORDER BY No_Show_Rate DESC
LIMIT 10;
-- Query 5: No-show rate by day of the week

SELECT
    DAYNAME(AppointmentDay) AS Weekday,
    COUNT(*) AS Total_Appointments,
    SUM(`No-show` = 'Yes') AS No_Shows,
    ROUND(AVG(`No-show` = 'Yes') * 100, 2) AS No_Show_Rate
FROM appointments
GROUP BY DAYNAME(AppointmentDay)
ORDER BY No_Show_Rate DESC;