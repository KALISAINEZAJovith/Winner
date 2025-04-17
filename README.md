
# SQL Window Functions Assignment

## 👥 Team Members
- Student 1: [KALISA INEZA Jovith]
- Student 2: [NKURUNZIZA Salomon]

## 💻 Repository
This repository contains SQL scripts and analysis using SQL Window Functions.

## 📊 Dataset: Employees

A sample employee dataset with the following columns:
- employee_id
- name
- department
- salary
- date_joined
- region

## ✅ SQL Queries & Explanations

### 1. Comparing Values Over Time
- Used LAG(), LEAD(), and ROW_NUMBER() to compare salaries within departments.
- Application: Tracking salary changes and onboarding sequence.

### 2. Ranking Within Department
- Used RANK() and DENSE_RANK() to rank employees by salary.
- Application: Performance review, bonus assignment.

### 3. Identifying Best Records
- Ranked top 3 employees overall and by region using RANK().
- Application: Rewarding top performers.

### 4. First to Join per Department
- Used ROW_NUMBER() to find earliest joiners.
- Application: Recognizing pioneer staff.

### 5. Aggregate Analysis
- Used AVG() with PARTITION BY to calculate departmental and overall averages.
- Application: Compensation comparison and budgeting.

## 📌 Real-life Applications
Window functions are powerful tools for:
- Analyzing trends
- Ranking and filtering records
- Partitioned aggregations for departments, regions, etc.

## 🧾 Files Included
- `assignment.sql`: SQL script with table creation, data insertion, and queries.
- `README.md`: Project documentation, explanations, and findings.

## 📂 How to Use
1. Import the SQL script in your SQL environment.
2. Run each query block to explore results.
3. Review the README for context and explanation.

---
