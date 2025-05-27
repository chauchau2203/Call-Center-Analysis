# Call-Center-Analysis

## A. Description

This data analyst project focuses on evaluating and optimizing the operational performance of the PwC Call Center for the first quarter of 2021. Using a combination of Power BI dashboards and SQL-driven analysis, the project explores call volumes, agent performance, customer satisfaction, and key efficiency metrics to deliver actionable insights and recommendations for service improvement.

### Objectives
- **Quantify Call Center Workload and Efficiency**: Measure total calls received, answered, and resolved, as well as average speed of answer and talk duration, to assess how effectively customer inquiries are managed.
  
- **Analyze Agent Performance**: Compare individual agent workloads, answer and resolution rates, average talk durations, and satisfaction ratings to identify high performers and areas for targeted training.
  
- **Assess Customer Experience**: Track and analyze customer satisfaction scores, examine their distribution, and evaluate the impact of wait times and call durations on satisfaction.
  
- **Identify Operational Patterns**: Uncover daily, weekly, and hourly trends in call volume, as well as topic-wise distributions, to inform staffing and resource allocation decisions.
  
- **Benchmark Service Level Metrics**: Monitor key indicators such as answer rate, resolution rate, and satisfaction against internal targets and industry standards.
  
- **Support Data-Driven Decision Making**: Provide clear, evidence-based recommendations for improving call center processes, agent training, and customer service strategies using interactive visualizations and robust SQL analysis.

## B. Data Sources

**Primary Source:**  
- [PwC Call Center Dataset](https://github.com/chauchau2203/Call-Center-Analysis/blob/main/01%20Call-Center-Dataset.csv) from [Forage PwC Job Simulator](https://www.theforage.com/simulations/pwc-ch/power-bi-cqxg?reloaded=true).

- The dataset contains detailed records of PwC call center operations for the period from January 1st to March 31st, 2021. It includes 5,000 calls, capturing information such as call date and time, agent handling the call, call topic, whether the call was answered or resolved, speed of answer, talk duration, and customer satisfaction rating.

**Key Columns:**
- `Call Id`: Unique call identifier
- `Agent`: Agent taking the call
- `Date`: Date of the call
- `Time`: Time of the call
- `Topic`: Topic of the call
- `Answered(Y/N)`: Whether the call was answered
- `Resolved`: Whether the issue was resolved within the call
- `Speed of answer in seconds`: Speed of answer in seconds
- `AvgTalkDuration`: Talk duration of the call in minutes
- `Satisfaction rating`: From 1 to 5 satisfaction rating

## C. Installation/Setup

### Prerequisites
- SQL Server Management Studio (SSMS) 21. Download [here](https://learn.microsoft.com/en-us/ssms/install/install)
- Microsoft Power BI Desktop (2.131.1203.0 32-bit July 2024). Download [here](https://www.microsoft.com/en-us/power-platform/products/power-bi/downloads)

### Setup 
- Install Microsoft SQL Server 2025.
- Import the PwC Call Center dataset into SQL Server.
- Run the provided SQL script for data analysis and KPI calculations.
- Connect Power BI to your SQL Server database.
- Open the provided `.pbix` file for dashboards.
- Verify data refresh and relationships.

## D. Project Structure

### 1. [PwC Call Center Analysis.sql](https://github.com/chauchau2203/Call-Center-Analysis/blob/main/PwC%20Call%20Center%20Analysis.sql)

*The SQL file conducts a comprehensive quantitative analysis of the PwC call center dataset, focusing on key operational and performance metrics.*

- **Headline statistics**: the total number of answered and unanswered calls, average speed of answer (in seconds), average talk duration (in minutes), and average customer satisfaction rating.

- **Call volume patterns** by date, hour of day, and day of week, identifying trends in daily, hourly, and weekly call distribution to pinpoint peak periods and workload fluctuations.

- **Agent-level performance** is examined, including total calls handled, answered, resolved, and the calculated resolution rate for each agent, as well as their average talk time and satisfaction scores.

- **Segments calls** by wait time and call duration ranges, correlating these with average satisfaction to explore the impact of response and handling times on customer experience.

- **Topic-wise analysis** is performed, showing the distribution of calls across different topics, their percentage share, and resolution rates by topic to highlight operational strengths and weaknesses.

- **Monthly and weekly trend** analyses are included, summarizing total calls, average speed of answer, satisfaction ratings, and resolution rates over time to monitor performance stability and identify seasonal or periodic patterns.

### 2. [PwC Call Center Dashboard.pbix](https://github.com/chauchau2203/Call-Center-Analysis/blob/main/PwC%20Call%20Center%20Dashboard.pbix)

*Power BI file with dashboards: Overview and Trends, including DAX measures. The file provides a comprehensive, interactive overview of the PwC call center’s operations for Q1 2021, focusing on both high-level KPIs and detailed breakdowns by agent, call topic, time, and customer satisfaction.*

![ecbd3bb2-f6cb-4c1e-9988-c066d1dbd52d](https://github.com/user-attachments/assets/3997fd87-d3a8-4a95-98ee-6268a76278d6)

![7c67b7ef-d734-4855-a07f-918b21fa23d7](https://github.com/user-attachments/assets/35dd7a0a-ade4-46ee-a42f-998912f9b014)


- **Key Performance Indicators (KPIs)**: The dashboards highlight essential metrics such as total calls, calls answered/unanswered, calls resolved, average speed of answer, and average talk duration, offering a snapshot of overall call center efficiency.

- **Call Distribution Analysis**: Visuals break down call volumes by topic (e.g., Streaming, Technical Support), day of week, and hour of day, helping to identify peak periods and inform staffing/resource allocation decisions.

- **Agent Performance**: Agent-level tables and charts compare total calls handled, answer and resolution rates, average talk duration, and satisfaction scores, enabling identification of top performers and areas for targeted coaching.

- **Customer Satisfaction**: The dashboards include average satisfaction gauges and bar charts showing the distribution of satisfaction ratings, as well as monthly trends, supporting analysis of customer experience and service quality over time.

- **Resolution Effectiveness**: Donut and bar charts visualize the proportion of resolved versus unresolved calls, both overall and by agent/topic, highlighting operational strengths and improvement opportunities.

- **Interactive Filtering**: Slicers for date, topic, and agent allow users to drill down into specific segments, making the dashboard adaptable for various analytical needs and stakeholder questions.

- **Trend Monitoring**: Line charts and time-based tables track changes in satisfaction, resolution, and answer rates across weeks and months, supporting ongoing performance monitoring and strategic planning.

### 3. [PwC Call Center Analysis Report.pdf](https://github.com/chauchau2203/Call-Center-Analysis/blob/main/PwC%20Call%20Center%20Analysis%20Report.pdf)

- The report PDF provides a **comprehensive analysis** of the PwC call center’s operations for Q1 2021, using interactive Power BI dashboards and SQL-based data exploration.

- It summarizes **key performance indicators** such as total calls, answer rates, resolution rates, average speed of answer, talk duration, and customer satisfaction.

- The report includes **visualizations and tables** that break down call volumes by topic, day, hour, and agent, highlighting workload patterns and peak periods.

- **Agent performance** is compared across multiple metrics, including calls handled, answer and resolution rates, and satisfaction scores, to identify strengths and areas for improvement.

- **Customer satisfaction trends** are analyzed over time and by different call characteristics, supporting recommendations for enhancing the customer experience.

- The document concludes with **actionable recommendations**, and improvement strategies to guide ongoing operational excellence and data-driven decision-making.

## E. Analysis and Results

### **Basic Performance Metrics Analysis**
- Key performance indicators including 4,054 answered calls versus 946 unanswered calls, resulting in an 81.1% answer rate. - Average speed of answer was measured at 67 seconds, with an average talk duration of 3.75 minutes and overall customer satisfaction of 3.0 on a 5-point scale.

### **Temporal Pattern Analysis**
**Daily Call Volume Trends**
- The analysis examined daily call patterns, showing call volumes ranging from 48 to 84 calls per day. Specific dates like - January 11th showed peak activity with 84 calls, while January 8th had the lowest volume with 48 calls.

**Hourly Distribution Analysis**
- Call volume by hour revealed peak periods, with 11:00 AM showing 590 calls and 1:00 PM showing 594 calls - the highest - volumes of the day. The analysis covered hours 9-16, identifying optimal staffing periods.

**Weekly Pattern Recognition**
- Day-of-week analysis showed Monday (770 calls) and Saturday (768 calls) as the highest volume days, while Sunday (716 calls) and Tuesday (675 calls) showed lower activity.

### **Agent Performance Evaluation**
**Individual Agent Metrics**
- The analysis provided comprehensive agent performance data, showing Jim handled the most calls (666 total, 536 answered) with a 90.49% resolution rate. Stewart had the fewest calls (582 total, 477 answered) but maintained an 88.89% resolution rate.

**Talk Time and Satisfaction Analysis**
- Agent efficiency was measured through average talk time (ranging from 3.65 to 3.85 minutes) and individual satisfaction ratings, though all agents showed a uniform satisfaction score of 3.0 in this dataset.

### **Customer Experience Analysis**
**Wait Time Impact Assessment**
- The analysis examined correlation between wait times and satisfaction across four ranges: 0-30 seconds (751 calls), 31-60 seconds (1,045 calls), 61-90 seconds (1,026 calls), and over 90 seconds (1,232 calls). Interestingly, all wait time ranges showed identical average satisfaction of 3.0, indicating no direct correlation.

**Call Duration Impact Analysis**
- Similar analysis was performed for call duration ranges: 0-2 minutes (895 calls), 2-4 minutes (1,264 calls), 4-6 minutes (1,287 calls), and over 6 minutes (608 calls). Again, all duration ranges showed consistent 3.0 satisfaction ratings.

### **Topic-Based Performance Analysis**
**Call Distribution by Topic**
- The  analysis revealed balanced topic distribution: Streaming (1,022 calls, 20.44%), Technical Support (1,019 calls, 20.38%), Payment Related (1,007 calls, 20.14%), Admin Support (976 calls, 19.52%), and Contract Related (976 calls, 19.52%).

**Resolution Rate by Topic**
- Topic-specific resolution analysis showed Technical Support achieving the highest resolution rate at 91.43% (736 resolved out of 805 answered calls), while Streaming had the lowest at 88.43% (749 resolved out of 847 answered calls).

### **Trend Analysis**
**Monthly Performance Tracking**
- The analysis tracked monthly trends showing January had 1,772 calls, February had 1,616 calls, and March had 1,612 calls. - All months maintained consistent 67-second average speed of answer and 3.0 satisfaction ratings, with resolution rates varying slightly (90.10%, 89.45%, and 90.24% respectively).

**Weekly Performance Monitoring**
- Week-over-week analysis covered weeks 7-14 of 2021, showing call volumes ranging from 150 to 426 calls per week, with corresponding answered call rates and consistent satisfaction scores of 3.0 across all weeks.

## F. Recommendations

### Optimize Staffing and Resource Allocation
**Call Volume Management:**
- Redistribute agent schedules to increase coverage during peak hours (11:00 and 13:00) where data shows 590 and 594 calls respectively.
- Implement a flexible staffing model for high-volume days (Monday and Saturday) which together account for 31% of weekly call volume.
- Consider implementing a callback system during periods of high call volume to reduce the 18.92% unanswered call rate.

**Response Time Improvement:**
- Set a target to reduce the average speed of answer from 67.5 seconds to under 45 seconds, as industry benchmarks suggest this would improve first-call resolution.
- Develop streamlined processes for common inquiries to reduce the 30.5% of calls exceeding 90-second wait times.

### Enhance Agent Training and Performance
**Skill Development:**
- Create specialized training modules for streaming-related queries, which show the lowest resolution rate (88.43%)
- Establish knowledge-sharing sessions where high-performing agents (Greg and Jim with 90.64% and 90.49% resolution rates) can share best practices

**Quality Improvement:**
- Implement targeted coaching for agents with lower satisfaction scores, particularly Joe (3.33) and Becky (3.37)
- Develop agent-specific training based on individual performance patterns in the data, focusing on both technical skills and customer interaction

**Workload Balancing:**
- Review call allocation to ensure more equitable distribution between agents (current range: 582-666 calls per agent)
- Calibrate performance expectations based on call complexity by topic, as resolution rates vary by 3% between topics

### Improve Customer Experience
**Satisfaction Enhancement:**
- Investigate the declining satisfaction trend (3.45 → 3.37) from January to March to identify root causes.
- Create targeted interventions to move customers from the predominant 3-4 satisfaction range to the 4-5 range.
- Implement post-call surveys to gather more qualitative feedback on specific areas of dissatisfaction

**Service Level Agreements:**
Establish clear SLAs for different call types, with specific targets for:
- Maximum wait times (currently 30.5% of calls wait over 90 seconds).
- Resolution percentages (target above 95% for all topic categories).
- First-call resolution rate (target improvement of current 90% rate).

### Process and System Optimization
**Call Handling Procedures:**
- Review protocols for all topics to standardize best practices, particularly focusing on Technical Support which shows the highest resolution rate.
- Implement decision trees and knowledge base systems for common issues to reduce average call duration (currently 3:45).

**Technology Enhancements:**
- Deploy AI-powered call routing to direct customers to agents with highest resolution rates for specific topics.
- Implement predictive analytics to forecast call volumes based on historical patterns and schedule staff accordingly.
- Develop self-service options for routine inquiries (particularly for Admin Support and Contract-related issues) to reduce overall call volume.
  

## G. Future Work Extension and Improvement

- **Integrate additional data sources** such as customer feedback text, chat logs, or CRM data to enrich analysis and provide deeper customer insights.
  
- **Automate data refresh and dashboard updates** using scheduled data pipelines to ensure real-time monitoring and reporting.

- **Expand analysis to include predictive modeling** (e.g., forecasting call volumes, predicting satisfaction) and advanced analytics (e.g., sentiment analysis).

- **Develop more granular agent performance metrics**, such as first-call resolution rates, escalation rates, and training impact assessments.

- **Implement drill-down and drill-through features** in Power BI for more interactive, user-driven exploration of call center data.

- **Benchmark PwC call center metrics** against industry standards or competitors to identify further opportunities for operational improvement.


---

*Note: This project is for educational and analytical purposes. Data has been anonymized and should be used in compliance with applicable privacy regulations.*

