/* Daily ScreenTime, this is for each age group*/
SELECT Age, ROUND(AVG(ScreenTime_hrs), 2) AS avg_daily_ScreenTime
FROM social_media.social_media
GROUP BY Age;

/*THIS QUERY LOOKED AT THE TOP PLATFORMS THAT CAUSES FATIGUE LEVELS*/
SELECT  Primary_Platform, SocialMediaFatigueLevel_scale, COUNT(*) AS total_Primary_Platform
FROM social_media.social_media
GROUP BY SocialMediaFatigueLevel_scale, Primary_Platform
ORDER BY SocialMediaFatigueLevel_scale, Primary_Platform DESC;

/*Correlation between sleep quality scale and Screen time, 
I used AI to help me with query since MYSQL work bench doesnt have the CORR function
The query that comes after this is the scatter plot query data*/
SELECT
    (COUNT(*) * SUM(Sleep_Quality_scale * ScreenTime_hrs) - SUM(Sleep_Quality_scale) * SUM(ScreenTime_hrs)) /   
    SQRT(  
        (COUNT(*) * SUM(POW(Sleep_Quality_scale, 2)) - POW(SUM(Sleep_Quality_scale), 2)) *  
        (COUNT(*) * SUM(POW(ScreenTime_hrs, 2)) - POW(SUM(ScreenTime_hrs), 2))  
    ) AS correlation_coefficient 
    
FROM social_media.social_media;

SELECT Sleep_Quality_scale, ScreenTime_hrs
FROM social_media.social_media;


SELECT  PreferredEntertainment_Platform, Occupation, ROUND(AVG(Monthly_Expenditure_on_Entertainment_USD), 2) AS Expenditure
FROM social_media.social_media
GROUP BY Occupation, PreferredEntertainment_Platform;

SELECT Digital_Wellbeing_Awareness, COUNT(*) AS Number_Of_Users
FROM social_media.social_media
WHERE Digital_Wellbeing_Awareness IN ('Moderate', 'High', 'Low')
GROUP BY Digital_Wellbeing_Awareness;


SELECT SubscriptionPlatforms, Round(AVG(Monthly_Expenditure_on_Entertainment_USD), 2) AS Monthly_Avg_Revene
FROM social_media.social_media
GROUP BY SubscriptionPlatforms;

SELECT PreferredContent_Type, AVG(Tech_Savviness_Level_scale) AS AVG_Tech_savviness
FROM social_media.social_media
GROUP BY PreferredContent_Type
ORDER BY AVG_Tech_savviness;


select *
from social_media.social_media

























