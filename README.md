# Hospital-Command-Center-Analysis

Project Description :
The Hospital Command Center Analytics Dashboard is a comprehensive Business Intelligence (BI) solution developed to help hospital management monitor, analyze, and optimize operational, financial, and clinical performance. The project integrates multiple hospital datasets—including patient records, insurance claims, emergency room activities, operation theatre schedules, bed occupancy, and staff scheduling—into a centralized interactive dashboard using Python, SQL, and Power BI.
The project begins with data cleaning and preprocessing in Python, where missing values, duplicates, inconsistent formats, and date conversions are handled to ensure high-quality data. Feature engineering techniques are then applied to derive important metrics such as Length of Stay, Bed Occupancy Rate, ICU Occupancy, Staff Utilization, and Surgery Delay.
The cleaned data is stored and managed in a relational database using SQL, where optimized tables, views, and aggregation queries are created to support efficient reporting and analysis.
Using Power BI, a star schema data model is designed to establish relationships between fact and dimension tables. More than 50 DAX measures are created to calculate key performance indicators (KPIs), enabling dynamic and interactive analysis. The final solution consists of eight dashboard pages featuring drill-through functionality, synchronized slicers, tooltips, bookmarks, navigation buttons, and conditional formatting to provide a user-friendly analytical experience.
The dashboard helps hospital administrators monitor patient flow, departmental performance, revenue trends, insurance claim status, emergency room efficiency, operation theatre utilization, bed and ICU occupancy, and staff productivity. It supports data-driven decision-making by providing real-time insights into hospital operations and resource utilization.

Technologies Used :
•	Python (Pandas, NumPy) – Data cleaning, preprocessing, feature engineering, KPI dataset generation
•	SQL (MySQL) – Database design, data integration, views, aggregation queries
•	Power BI – Data modeling, DAX measures, dashboard development, visualization
•	DAX – KPI calculations and business metrics
•	Power Query – Data transformation and loading

Key Features :
•	Integrated 6 hospital datasets into a unified analytical model
•	Designed a star schema for efficient reporting
•	Created 50+ DAX measures for business KPIs
•	Developed 8 interactive Power BI dashboards
•	Implemented drill-through pages, bookmarks, tooltips, and synchronized slicers
•	Applied conditional formatting for quick identification of critical operational metrics
•	Generated dashboard-ready datasets using Python and SQL

Key Performance Indicators (KPIs) :
•	Total Patients
•	Total Revenue
•	Average Length of Stay
•	Bed Occupancy Rate
•	ICU Occupancy Rate
•	Average ER Wait Time
•	Claim Approval Rate
•	Average Claim Amount
•	Revenue per Department
•	Revenue per Patient
•	Staff Utilization
•	Surgery Delay
•	OT Utilization
•	Average Patient Satisfaction
•	Emergency Load
•	Ventilator Usage
•	Overtime Hours
•	Absenteeism
•	Patient Load
•	Active OT Rooms

Business Outcomes :
•	Improved visibility into hospital operations through centralized reporting
•	Enabled monitoring of patient admissions, discharges, and departmental performance
•	Identified high-revenue departments and billing trends
•	Tracked insurance claim approvals and rejections
•	Monitored ER wait times and patient satisfaction
•	Optimized bed allocation, ICU utilization, and ventilator availability
•	Evaluated operation theatre efficiency and surgery delays
•	Measured staff workload, overtime, and utilization to support resource planning

Dashboard Pages Executive Dashboard :
•	Overview
•	Patient Analytics
•	Insurance Analysis
•	Emergency Room Dashboard
•	Operation Theatre Dashboard
•	Bed & ICU Dashboard
•	Staff Analytics Dashboard

