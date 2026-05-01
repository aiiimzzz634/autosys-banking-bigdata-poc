#!/bin/bash

echo "Creating HDFS directories..."

hdfs dfs -mkdir -p /banking/autosys/raw/job_data
hdfs dfs -mkdir -p /banking/autosys/processed
hdfs dfs -mkdir -p /banking/autosys/output

echo "Uploading sample AutoSys job data to HDFS..."

hdfs dfs -put -f data/autosys_jobs_sample.csv /banking/autosys/raw/job_data/

echo "Listing uploaded files..."

hdfs dfs -ls /banking/autosys/raw/job_data

echo "Displaying uploaded sample data..."

hdfs dfs -cat /banking/autosys/raw/job_data/autosys_jobs_sample.csv
