# Customer Churn Analysis Project

## Overview
This project analyzes customer churn patterns using SQL Server and Power BI to identify key factors contributing to customer attrition and provide actionable insights for retention strategies.

## Project Structure

```
churn_analysis/
├── README.md
├── SQLQuery1.sql          # Initial data exploration
├── SQLQuery2.sql          # Demographic and contract analysis
├── SQLQuery3.sql          # Data quality checks (null values)
├── SQLQuery4.sql          # Production table creation with data cleaning
├── SQLQuery5.sql          # View creation for segmented analysis
└── SQLQuery7.sql          # Additional data operations
```

## Database Schema

### Source Table: `stg_Churn`
Staging table containing raw customer data with the following key fields:

**Customer Demographics:**
- Customer_ID
- Gender
- Age
- Married
- State
- Number_of_Referrals

**Service Information:**
- Tenure_in_Months
- Phone_Service
- Multiple_Lines
- Internet_Service
- Internet_Type
- Value_Deal

**Add-on Services:**
- Online_Security
- Online_Backup
- Device_Protection_Plan
- Premium_Support
- Streaming_TV
- Streaming_Movies
- Streaming_Music
- Unlimited_Data

**Billing Information:**
- Contract (Month-to-Month, One Year, Two Year)
- Paperless_Billing
- Payment_Method
- Monthly_Charge
- Total_Charges
- Total_Refunds
- Total_Extra_Data_Charges
- Total_Long_Distance_Charges
- Total_Revenue

**Churn Information:**
- Customer_Status (Churned, Stayed, Joined)
- Churn_Category
- Churn_Reason

### Production Table: `prod_Churn`
Clean, analysis-ready table with:
- NULL values handled appropriately
- Default values assigned where applicable
- Optimized for reporting and visualization

### Views Created:
- **vw_ChurnData**: Filtered view containing only 'Churned' and 'Stayed' customers for churn analysis
- **vw_JoinData**: Filtered view containing only 'Joined' customers for new customer analysis

## SQL Analysis Performed

### 1. Data Quality Assessment (SQLQuery3.sql)
- Comprehensive NULL value check across all 32 columns
- Identifies missing data patterns to inform cleaning strategy

### 2. Exploratory Analysis (SQLQuery2.sql)
- **Gender Distribution**: Customer count and percentage by gender
- **Contract Analysis**: Distribution of contract types with percentages
- **Customer Status**: Count and revenue breakdown by customer status
- **Geographic Analysis**: State-wise customer distribution ranked by percentage

### 3. Data Cleaning & Transformation (SQLQuery4.sql)
Handles NULL values with business-appropriate defaults:
- Service-related fields: 'No' (indicating service not subscribed)
- Internet_Type: 'None' (for customers without internet)
- Value_Deal: 'None'
- Churn fields: 'Others' (for non-churned customers)

### 4. View Creation (SQLQuery5.sql)
- Segments data for focused analysis
- Separates churned/stayed customers from new joiners
- Enables targeted reporting in Power BI

## Key Metrics Analyzed

1. **Churn Rate**: Percentage of customers who left the service
2. **Revenue Impact**: Total revenue loss from churned customers
3. **Contract Type Analysis**: Churn patterns across different contract lengths
4. **Geographic Trends**: State-wise churn distribution
5. **Service Adoption**: Correlation between service usage and retention

## Power BI Integration

The cleaned production table (`prod_Churn`) serves as the data source for Power BI dashboards that visualize:
- Overall churn rate and trends
- Customer segmentation analysis
- Revenue impact by customer cohort
- Churn reasons and categories
- Predictive indicators for at-risk customers

## Getting Started

### Prerequisites
- SQL Server (2016 or later)
- Power BI Desktop
- Database: `db_Churn` or `db_churnn`

### Setup Instructions

1. **Create Database:**
   ```sql
   CREATE DATABASE db_Churn;
   ```

2. **Import Data:**
   - Load raw customer data into `stg_Churn` table

3. **Run SQL Scripts in Order:**
   ```sql
   -- 1. Check data quality
   -- Execute SQLQuery3.sql
   
   -- 2. Perform exploratory analysis
   -- Execute SQLQuery2.sql
   
   -- 3. Create production table
   -- Execute SQLQuery4.sql
   
   -- 4. Create analytical views
   -- Execute SQLQuery5.sql
   ```

4. **Connect Power BI:**
   - Open Power BI Desktop
   - Connect to SQL Server database
   - Import `prod_Churn` table or use views
   - Build visualizations and dashboards

## Analysis Insights

Based on the SQL queries, the analysis focuses on:

- **Contract flexibility**: Month-to-month contracts may show higher churn
- **Service bundling**: Impact of multiple services on retention
- **Payment methods**: Correlation with customer loyalty
- **Geographic patterns**: Regional variations in churn rates
- **Demographic factors**: Age, gender, and marital status influences

## Data Cleaning Decisions

**NULL Handling Strategy:**
- Optional services default to 'No' (not subscribed)
- Churn information defaults to 'Others' (for active customers)
- Maintains data integrity while enabling complete analysis

## Future Enhancements

- Implement predictive churn modeling
- Add customer lifetime value (CLV) calculations
- Create automated alerting for high-risk customers
- Develop retention campaign effectiveness tracking
- Integrate real-time data updates

## License

This project is for analytical and educational purposes.

## Contact

For questions or contributions, please refer to the project repository.
