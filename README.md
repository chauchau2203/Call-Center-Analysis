# Call-Center-Analysis

## A. Description

This data analyst project focuses on evaluating and optimizing the operational performance of the PwC Call Center for the first quarter of 2021. Using a combination of Power BI dashboards and SQL-driven analysis, the project explores call volumes, agent performance, customer satisfaction, and key efficiency metrics to deliver actionable insights and recommendations for service improvement.

### Objectives
- Quantify Call Center Workload and Efficiency: Measure total calls received, answered, and resolved, as well as average speed of answer and talk duration, to assess how effectively customer inquiries are managed.
- Analyze Agent Performance: Compare individual agent workloads, answer and resolution rates, average talk durations, and satisfaction ratings to identify high performers and areas for targeted training.
- Assess Customer Experience: Track and analyze customer satisfaction scores, examine their distribution, and evaluate the impact of wait times and call durations on satisfaction.
- Identify Operational Patterns: Uncover daily, weekly, and hourly trends in call volume, as well as topic-wise distributions, to inform staffing and resource allocation decisions.
- Benchmark Service Level Metrics: Monitor key indicators such as answer rate, resolution rate, and satisfaction against internal targets and industry standards.
- Support Data-Driven Decision Making: Provide clear, evidence-based recommendations for improving call center processes, agent training, and customer service strategies using interactive visualizations and robust SQL analysis.

## B. Data Sources

**Primary Source:**  
- [PwC Call Center Dataset](https://github.com/chauchau2203/Financial-Loan-Analysis/blob/main/financial_loan.csv) from [Forage PwC Job Simulator](https://www.theforage.com/simulations/pwc-ch/power-bi-cqxg?reloaded=true).

**Key Columns:**
- `id`: Unique loan identifier
- `loan_status`: Loan status (Fully Paid, Current, Charged Off)
- `loan_amnt`: Requested loan amount
- `funded_amnt`: Amount funded
- `int_rate`: Interest rate
- `installment`: Monthly payment
- `grade`: Assigned loan grade
- `emp_length`: Borrower’s employment length
- `home_ownership`: Home ownership status
- `annual_inc`: Borrower’s annual income
- `verification_status`: Income verification status
- `issue_d`: Loan issue date
- `purpose`: Loan purpose
- `addr_state`: Borrower’s state
- `dti`: Debt-to-income ratio
- `total_pymnt`: Total amount received to date

## C. Installation/Setup

### Prerequisites
- SQL Server Management Studio (SSMS) 21. Download [here](https://learn.microsoft.com/en-us/ssms/install/install)
- Microsoft Power BI Desktop (2.131.1203.0 32-bit July 2024). Download [here](https://www.microsoft.com/en-us/power-platform/products/power-bi/downloads)

### Setup 
- Install Microsoft SQL Server 2025.
- Import the financial loan dataset into SQL Server.
- Run the provided SQL script for data analysis and KPI calculations.
- Connect Power BI to your SQL Server database.
- Open the provided `.pbix` file for dashboards.
- Verify data refresh and relationships.

## D. Project Structure

### 1. [Financial Loan Analysis.sql](https://github.com/chauchau2203/Financial-Loan-Analysis/blob/main/Financial%20Loan%20Analysis.sql)

*SQL queries for data exploration, KPI calculations, and loan performance analysis.*

**Portfolio-Level KPIs and Time-Based Metrics**

- Calculates total loan applications, total funded amounts, and total amount received from borrowers.
- Provides month-to-date (MTD), previous month-to-date (PMTD), and overall figures for applications, funding, and repayments.
- Computes average interest rate and average debt-to-income (DTI) ratio for the entire portfolio, as well as for current and previous months.

**Loan Quality and Risk Segmentation**

- Classifies loans as "Good" (statuses: Fully Paid, Current) or "Bad" (status: Charged Off).
- Calculates the percentage and count of good and bad loans.
- Aggregates funded and collected amounts for both good and bad loan segments.
- Supports KPI reporting on portfolio health and risk exposure.

**Status-Based and Grid Reporting**

- Breaks down key metrics (loan count, funded amount, amount received, interest rate, DTI) by loan status, enabling grid-style reporting for executive dashboards.
- Provides MTD breakdowns by loan status for dynamic reporting needs.

**Temporal Analysis**

- Analyzes monthly trends in loan applications, funding, and repayments.
- Outputs metrics by month number and month name, supporting time-series visualization and seasonality analysis.

**Regional and Demographic Analysis**

- Aggregates loan metrics by U.S. state, enabling regional performance assessment and identification of geographic disparities.
- Summarizes metrics by loan term (e.g., 36 months, 60 months), employment length, loan purpose, and home ownership status, supporting multidimensional analysis and segmentation.


### 2. [Financial Loan Dashboard.pbix](https://github.com/chauchau2203/Financial-Loan-Analysis/blob/main/Financial%20Loan%20Dashboard.pbix)

*Power BI file with dashboards: Summary, Overview, and Details, including DAX measures.*

**Dashboard 1: Summary**
- Total loan applications, MTD/PMTD tracking.
- Funding and repayment analysis.
- Average interest rate and DTI.
- Good vs. Bad loan KPIs.
- Loan status grid view.
![d6404874-96d2-44bf-a680-a54abb361a21](https://github.com/user-attachments/assets/0ac80cf2-87c1-459a-8420-d62e3cf8c7d0)


**Dashboard 2: Overview**
- Monthly trends. 
- Regional analysis by state. 
- Loan term analysis. 
- Employee length analysis. 
- Loan purpose breakdown. 
- Home ownership analysis. 
![3d00f83d-741c-4a8a-9bd2-f6e6cce16f65](https://github.com/user-attachments/assets/66fd5bff-aefe-4c1f-8d53-0397e9ed916a)


**Dashboard 3: Details**
- Data table for all key loan and borrower metrics.
- Filterable, sortable interface for in-depth analysis.
![92b648b7-0661-4ba7-9648-f20b8b4c35a6](https://github.com/user-attachments/assets/20863ddd-2d87-4e51-a8d4-88698972084a)


## E. Analysis and Results

### Overall Portfolio Performance
The loan portfolio demonstrates **strong performance** with 38,576 total loan applications and a healthy funding-to-recovery ratio. The bank has **funded $435.76M** while **receiving $473.07M** in repayments, indicating a positive return of approximately **8.6%** above the funded amount. This suggests effective loan management and collection processes.

### Risk Profile and Loan Quality
**Good vs Bad Loan Distribution:**
- The portfolio shows excellent loan quality with **86.2% classified as "Good Loans"** (Fully Paid + Current status) versus only **13.8% as "Bad Loans"** (Charged Off). This indicates strong underwriting standards and borrower selection criteria.

**Financial Impact Analysis:**

- **Good loans** generated $435.79M in collections from $370.22M funded (**17.7% return**).
- **Bad loans** only recovered $37.28M from $65.53M funded (**43.1% loss rate**).
- The overall portfolio benefits significantly from the high proportion of good loans.

### Temporal and Seasonal Trends
The monthly trend analysis reveals **consistent growth** throughout the year, with applications increasing from approximately 2.3K in January to 4.3K in December. This **87% growth** suggests either business expansion, increased market demand, or successful marketing campaigns. The steady upward trajectory indicates healthy business momentum.

### Geographic Distribution and Market Penetration
The state-wise distribution shows concentrated activity in larger population states, with certain regions displaying higher loan volumes. This geographic concentration may indicate market saturation opportunities in underserved states or successful regional strategies that could be replicated.

### Borrower Demographics and Employment Patterns
Employment Length Insights:

- Borrowers with **10+ years** of employment represent the **largest segment** (8.9K applications).
- Shorter tenure employees **(1-2 years**) show **significant representation** (4.6K and 4.4K respectively).
- This distribution suggests the bank successfully serves both established and emerging professionals.

### Loan Purpose and Financial Behavior
Debt Consolidation Dominance:
The purpose analysis reveals **debt consolidation as the primary driver** (~18K applications), followed by **credit card refinancing** (~5K). This indicates customers are actively managing their debt obligations and seeking better terms, suggesting a financially conscious customer base.

### Term Structure and Risk Management
The loan term distribution shows **73.2% are 60-month loans** (28.2K) versus **26.8% for 36-month loans** (10.3K). This preference for longer terms may indicate:
- Customer preference for lower monthly payments.
- Bank strategy to extend interest income duration.
- Potential higher risk exposure due to longer repayment periods.

### Home Ownership and Stability Indicators
The home ownership analysis shows a relatively balanced distribution between renters, mortgage holders, and homeowners. This diversity suggests the bank serves various economic segments, though the specific proportions could indicate target market focus areas.

### Interest Rate and DTI Analysis
With an **average interest rate of 12.05%** and **average DTI of 13.33%**, the portfolio reflects **moderate risk pricing**. The month-over-month changes (+3.47% interest rate, +2.73% DTI) suggest either tightening credit conditions or shifts in borrower profile.

### Key Performance Indicators by Loan Status
The detailed breakdown shows Current loans have the highest interest rate (15.10%) while Fully Paid loans average 11.64%. This suggests:
- Higher risk pricing for ongoing loans.
- Successful completion of lower-rate loans.
- Potential correlation between interest rates and repayment success.

## F. Future Work Extension and Improvement

- **Real-time Data Integration:** Automate data pipelines for real-time monitoring.
- **Advanced Analytics:** Integrate machine learning for default prediction.
- **Mobile Dashboard:** Enable Power BI mobile access.
- **Risk Modeling:** Build credit risk assessment models.
- **Cohort & Predictive Analysis:** Add borrower cohort tracking and forecasting.
- **Regulatory Reporting:** Expand for compliance and regulatory needs.
- **Visualization Enhancements:** Add drill-downs, alerts, and custom KPI tracking.
- **Data Quality:** Improve validation and integrate external economic data.

## G. License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

*Note: This project is for educational and analytical purposes. Data has been anonymized and should be used in compliance with applicable privacy regulations.*

