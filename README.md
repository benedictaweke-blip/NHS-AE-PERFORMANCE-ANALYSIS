# NHS-AE-PERFORMANCE-ANALYSIS
Analysis of NHS England Type 1 A&amp;E performance using SQL and Power BI, April 2025–March 2026.

## Project Overview

This project analyses NHS England Type 1 Accident & Emergency (A&E) performance from April 2025 to March 2026 using SQL and Power BI.

The analysis examines patient attendance volumes, the proportion of attendances completed within four hours, monthly performance trends, and regional differences.

The objective is to transform publicly available NHS operational data into clear, actionable insights that help identify performance patterns and potential areas for further investigation.

### Key Questions
- How many Type 1 A&E attendances were recorded during the reporting period?
- What proportion exceeded four hours?
- How did four-hour performance change month by month?
- Which NHS regions recorded the highest and lowest four-hour performance?

## Key Findings

- **Total A&E Attendances:** 16,744,864 Type 1 A&E attendances were recorded between April 2025 and March 2026.
- **Attendances Exceeding Four Hours:** 6,604,765 attendances (39.44%) exceeded four hours.
- **Annual Four-Hour Performance:** 60.56% of attendances were completed within four hours.
- **Highest Regional Performance:** South East recorded 63.01% four-hour performance.
- **Lowest Regional Performance:** North West recorded 57.39% four-hour performance.
- **Regional Performance Gap:** The difference between the highest- and lowest-performing regions was 5.62 percentage points.

### Interpretation

The results indicate that a substantial proportion of Type 1 A&E attendances exceeded four hours during the reporting period. Regional performance also varied, suggesting areas for further investigation into operational pressures, patient demand and service capacity. These descriptive findings do not establish the causes of the observed differences.

## SQL Analysis Files

The following SQL scripts document the analysis:

- [Monthly Performance Trend](02_ae_monthly_trend_analysis.sql) — calculates monthly attendance volumes and four-hour performance.
- [Monthly Performance Ranking](03_ae_monthly_performance_ranking.sql) — ranks months by four-hour performance.
- [Regional Performance](04_ae_regional_performance.sql) — compares performance across NHS regions.
- [Regional Performance Change](05_ae_regional_performance_change.sql) — compares April 2025 and March 2026 regional performance.

### How to Reproduce the SQL Analysis

1. Download `nhs_ae_monthly_2025_26_clean(1).csv` from this repository.
2. Open DB Browser for SQLite and create a new SQLite database.
3. Select **File → Import → Table from CSV file** and import the downloaded dataset.
4. Name the imported table `ae_monthly_2025_26` and ensure the first row is used as column headers.
5. Check that attendance and waiting-time columns are stored as numeric values.
6. Open **Execute SQL** and run the `.sql` scripts provided in this repository.

The scripts analyse monthly trends, rank monthly performance, compare regional performance, and calculate changes between April 2025 and March 2026.


## Technical Methodology

### 1. Data Collection
- Used publicly available NHS England monthly A&E attendance and emergency admission statistics.
- Defined the reporting period as April 2025 to March 2026.
- Focused on Type 1 A&E attendance and four-hour performance metrics.

### 2. SQL Analysis
- Used SQLite to query and examine NHS A&E data.
- Analysed attendance volumes and four-hour performance.
- Prepared summary datasets for monthly and regional comparisons.

### 3. Power BI Dashboard
- Imported prepared CSV datasets into Power BI Desktop.
- Built a monthly performance line chart and a regional comparison bar chart.
- Created DAX measures for total attendances, attendances exceeding four hours and annual four-hour performance.
- Applied consistent formatting and added reporting-period and source information.

### 4. Calculation Method

Annual four-hour performance was calculated as:

**(Total attendances - Attendances exceeding four hours) / Total attendances × 100**

The annual percentage is calculated from the attendance totals rather than an unweighted average of monthly percentages.

## Power BI Dashboard

![NHS Type 1 A&E Performance Dashboard](NHS_AE_DASHBOARD.PNG)
