# Part B Project Notes

## Project Title
Big Data-Based Monitoring and Analysis of AutoSys Job Failures in Banking

## Problem
Banking production support teams monitor thousands of AutoSys batch jobs daily. Failures and SLA breaches can impact end-of-day processing, payment settlement, fraud reporting, compliance, and regulatory reporting.

## Big Data Justification
- Volume: Thousands of jobs and logs generated daily.
- Velocity: Job status changes are generated continuously.
- Variety: Data comes from AutoSys databases, logs, CSV exports, incident tickets, and alerts.

## Tools Used
- HDFS for storage
- Hive for SQL analysis
- Pig for transformation
- Sqoop for database ingestion design

## Main Insights
- Payments application has the highest failure count.
- PAYMENT_SETTLEMENT is a recurring failed job.
- Database connection timeout appears multiple times.
- SLA breach analysis is important even for jobs that complete successfully.
