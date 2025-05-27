-- BASIC CALL METRICS
-- Total Calls Answered and Unanswered
SELECT 
    SUM(CASE WHEN [Answered_Y_N] = 'Y' THEN 1 ELSE 0 END) AS Answered_Calls,
    SUM(CASE WHEN [Answered_Y_N] = 'N' THEN 1 ELSE 0 END) AS Unanswered_Calls
FROM [01 Call-Center-Dataset];

-- Average Speed of Answer
SELECT AVG([Speed_of_answer_in_seconds]) AS Average_Speed_of_Answer
FROM [01 Call-Center-Dataset]
WHERE [Answered_Y_N] = 'Y';

-- Average Call Duration
SELECT 
  CAST(AVG(CAST(DATEDIFF(SECOND, '00:00:00', AvgTalkDuration) AS FLOAT) / 60) AS DECIMAL(10,2)) AS Average_Talk_Duration_Minutes
FROM [01 Call-Center-Dataset]
WHERE [Answered_Y_N] = 'Y';

-- Overall Customer Satisfaction
SELECT CAST(ROUND(AVG([Satisfaction_rating]), 2) AS FLOAT) AS Average_Satisfaction
FROM [01 Call-Center-Dataset]
WHERE [Satisfaction_rating] IS NOT NULL;


-- CALL VOLUME PATTERNS ANALYSIS
-- Daily Call Distribution
SELECT 
    [Date],
    COUNT(*) AS Call_Count
FROM [01 Call-Center-Dataset]
GROUP BY [Date]
ORDER BY [Date];

-- Hourly Call Distribution
SELECT 
    DATEPART(HOUR, [Time]) AS Hour_of_Day,
    COUNT(*) AS Call_Count
FROM [01 Call-Center-Dataset]
GROUP BY DATEPART(HOUR, [Time])
ORDER BY Hour_of_Day;

-- Day of Week Analysis
SELECT 
    DATENAME(WEEKDAY, [Date]) AS Day_of_Week,
    COUNT(*) AS Call_Count
FROM [01 Call-Center-Dataset]
GROUP BY DATENAME(WEEKDAY, [Date])
ORDER BY 
    CASE 
        WHEN DATENAME(WEEKDAY, [Date]) = 'Sunday' THEN 1
        WHEN DATENAME(WEEKDAY, [Date]) = 'Monday' THEN 2
        WHEN DATENAME(WEEKDAY, [Date]) = 'Tuesday' THEN 3
        WHEN DATENAME(WEEKDAY, [Date]) = 'Wednesday' THEN 4
        WHEN DATENAME(WEEKDAY, [Date]) = 'Thursday' THEN 5
        WHEN DATENAME(WEEKDAY, [Date]) = 'Friday' THEN 6
        WHEN DATENAME(WEEKDAY, [Date]) = 'Saturday' THEN 7
    END;


-- AGENT PEROFRMANCE ANALYSIS
-- Agent Call Volumns and Resolution Rates
SELECT 
    Agent,
    COUNT(*) AS Total_Calls,
    SUM(CASE WHEN [Answered_Y_N] = 'Y' THEN 1 ELSE 0 END) AS Answered_Calls,
    SUM(CASE WHEN Resolved = 'Y' THEN 1 ELSE 0 END) AS Resolved_Calls,
    ROUND(
        CAST(SUM(CASE WHEN Resolved = 'Y' THEN 1 ELSE 0 END) AS FLOAT) / 
        NULLIF(SUM(CASE WHEN [Answered_Y_N] = 'Y' THEN 1 ELSE 0 END), 0) * 100
    , 2) AS Resolution_Rate
FROM [01 Call-Center-Dataset]
GROUP BY Agent
ORDER BY Total_Calls DESC;

-- Agent Performance Quadrant Analysis
SELECT 
    Agent,
    Answered_Calls,
    ROUND(Average_Talk_Duration_Minutes, 2) AS Avg_Talk_Mins,
    ROUND(Average_Satisfaction, 2) AS Avg_Satisfaction
FROM (
    SELECT 
        Agent,
        SUM(CASE WHEN [Answered_Y_N] = 'Y' THEN 1 ELSE 0 END) AS Answered_Calls,
        CAST(AVG(CAST(DATEDIFF(SECOND, '00:00:00', AvgTalkDuration) AS FLOAT) / 60) AS DECIMAL(10,2)) AS Average_Talk_Duration_Minutes,
        AVG([Satisfaction_rating]) AS Average_Satisfaction
    FROM [01 Call-Center-Dataset]
    GROUP BY Agent
) AS AgentStats
ORDER BY Answered_Calls DESC;


-- CUSTOMER EXPERIENCE ANALYSIS
-- Satisfaction vs. Wait Time Correlation
SELECT 
    CASE 
        WHEN [Speed_of_answer_in_seconds] BETWEEN 0 AND 30 THEN '0-30 sec'
        WHEN [Speed_of_answer_in_seconds] BETWEEN 31 AND 60 THEN '31-60 sec'
        WHEN [Speed_of_answer_in_seconds] BETWEEN 61 AND 90 THEN '61-90 sec'
        ELSE 'Over 90 sec'
    END AS Wait_Time_Range,
    COUNT(*) AS Call_Count,
    AVG([Satisfaction_rating]) AS Average_Satisfaction
FROM [01 Call-Center-Dataset]
WHERE [Answered_Y_N] = 'Y' AND [Satisfaction_rating] IS NOT NULL
GROUP BY CASE 
        WHEN [Speed_of_answer_in_seconds] BETWEEN 0 AND 30 THEN '0-30 sec'
        WHEN [Speed_of_answer_in_seconds] BETWEEN 31 AND 60 THEN '31-60 sec'
        WHEN [Speed_of_answer_in_seconds] BETWEEN 61 AND 90 THEN '61-90 sec'
        ELSE 'Over 90 sec'
    END
ORDER BY Wait_Time_Range;

-- Satisfaction vs. Call Duration
SELECT 
    CASE 
        WHEN DATEDIFF(SECOND, '0:00:00', AvgTalkDuration)/60.0 < 2 THEN '0-2 min'
        WHEN DATEDIFF(SECOND, '0:00:00', AvgTalkDuration)/60.0 < 4 THEN '2-4 min'
        WHEN DATEDIFF(SECOND, '0:00:00', AvgTalkDuration)/60.0 < 6 THEN '4-6 min'
        ELSE 'Over 6 min'
    END AS Call_Duration_Range,
    COUNT(*) AS Call_Count,
    AVG([Satisfaction_rating]) AS Average_Satisfaction
FROM [01 Call-Center-Dataset]
WHERE [Answered_Y_N] = 'Y' 
    AND [Satisfaction_rating] IS NOT NULL
GROUP BY 
    CASE 
        WHEN DATEDIFF(SECOND, '0:00:00', AvgTalkDuration)/60.0 < 2 THEN '0-2 min'
        WHEN DATEDIFF(SECOND, '0:00:00', AvgTalkDuration)/60.0 < 4 THEN '2-4 min'
        WHEN DATEDIFF(SECOND, '0:00:00', AvgTalkDuration)/60.0 < 6 THEN '4-6 min'
        ELSE 'Over 6 min'
    END
ORDER BY MIN(DATEDIFF(SECOND, '0:00:00', AvgTalkDuration)/60.0);


-- TOPIC ANALYSIS
-- Call Distribution by Topic
SELECT 
    Topic,
    COUNT(*) AS Call_Count,
    CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM [01 Call-Center-Dataset]) * 100 AS Percentage
FROM [01 Call-Center-Dataset]
GROUP BY Topic
ORDER BY Call_Count DESC;

-- Resolution Rate by Topic
SELECT 
    Topic,
    COUNT(*) AS Total_Calls,
    SUM(CASE WHEN Resolved = 'Y' THEN 1 ELSE 0 END) AS Resolved_Calls,
    ROUND(
        CAST(SUM(CASE WHEN Resolved = 'Y' THEN 1 ELSE 0 END) AS FLOAT) / 
        COUNT(*) * 100, 2
    ) AS Resolution_Rate
FROM [01 Call-Center-Dataset]
WHERE [Answered_Y_N] = 'Y'
GROUP BY Topic
ORDER BY Resolution_Rate DESC;

-- TREND ANALYSIS
-- Monthly Performance Trends
SELECT 
    DATEPART(YEAR, [Date]) AS Year,
    DATEPART(MONTH, [Date]) AS Month,
    COUNT(*) AS Total_Calls,
    CAST(AVG([Speed_of_answer_in_seconds]) AS DECIMAL(10,2)) AS Average_Speed_of_Answer,
    CAST(AVG([Satisfaction_rating]) AS DECIMAL(10,2)) AS Average_Satisfaction,
    CAST(
        (SUM(CASE WHEN Resolved = 'Y' THEN 1 ELSE 0 END) * 100.0) /
        NULLIF(SUM(CASE WHEN [Answered_Y_N] = 'Y' THEN 1 ELSE 0 END), 0)
    AS DECIMAL(10,2)) AS Resolution_Rate
FROM [01 Call-Center-Dataset]
GROUP BY DATEPART(YEAR, [Date]), DATEPART(MONTH, [Date])
ORDER BY Year, Month;

-- Week-over-Week Analysis
SELECT 
    DATEPART(YEAR, [Date]) AS Year,
    DATEPART(WEEK, [Date]) AS Week_Number,
    COUNT(*) AS Total_Calls,
    SUM(CASE WHEN [Answered_Y_N] = 'Y' THEN 1 ELSE 0 END) AS Answered_Calls,
    AVG([Satisfaction_rating]) AS Average_Satisfaction
FROM [01 Call-Center-Dataset]
GROUP BY DATEPART(YEAR, [Date]), DATEPART(WEEK, [Date])
ORDER BY Year, Week_Number;

