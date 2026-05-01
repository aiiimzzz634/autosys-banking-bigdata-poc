raw_jobs = LOAD '/banking/autosys/raw/job_data/autosys_jobs_sample.csv'
USING PigStorage(',')
AS (
    job_id:chararray,
    job_name:chararray,
    application:chararray,
    server_name:chararray,
    job_type:chararray,
    start_time:chararray,
    end_time:chararray,
    status:chararray,
    exit_code:int,
    sla_minutes:int,
    actual_duration_minutes:int,
    error_message:chararray
);

clean_jobs = FILTER raw_jobs BY job_id != 'job_id';

failed_jobs = FILTER clean_jobs BY status == 'FAILURE';

failed_job_summary = FOREACH failed_jobs GENERATE
    job_id,
    job_name,
    application,
    server_name,
    exit_code,
    error_message;

STORE failed_job_summary
INTO '/banking/autosys/processed/failed_jobs_output'
USING PigStorage(',');
