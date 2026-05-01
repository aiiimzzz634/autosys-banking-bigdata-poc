CREATE DATABASE IF NOT EXISTS banking_autosys;

USE banking_autosys;

DROP TABLE IF EXISTS autosys_jobs;

CREATE EXTERNAL TABLE autosys_jobs
(
    job_id STRING,
    job_name STRING,
    application STRING,
    server_name STRING,
    job_type STRING,
    start_time STRING,
    end_time STRING,
    status STRING,
    exit_code INT,
    sla_minutes INT,
    actual_duration_minutes INT,
    error_message STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/banking/autosys/raw/job_data'
TBLPROPERTIES ("skip.header.line.count"="1");

SELECT COUNT(*) AS total_records FROM autosys_jobs;
