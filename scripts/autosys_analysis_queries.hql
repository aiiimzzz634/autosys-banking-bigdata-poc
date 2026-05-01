USE banking_autosys;

SELECT 'TOTAL JOBS BY STATUS' AS analysis_name;
SELECT status, COUNT(*) AS job_count
FROM autosys_jobs
GROUP BY status;

SELECT 'FAILED JOBS' AS analysis_name;
SELECT job_id, job_name, application, server_name, exit_code, error_message
FROM autosys_jobs
WHERE status = 'FAILURE';

SELECT 'APPLICATION WISE FAILURE COUNT' AS analysis_name;
SELECT application, COUNT(*) AS failure_count
FROM autosys_jobs
WHERE status = 'FAILURE'
GROUP BY application
ORDER BY failure_count DESC;

SELECT 'SLA BREACH JOBS' AS analysis_name;
SELECT job_id, job_name, application, sla_minutes, actual_duration_minutes
FROM autosys_jobs
WHERE actual_duration_minutes > sla_minutes;

SELECT 'SERVER WISE FAILURE COUNT' AS analysis_name;
SELECT server_name, COUNT(*) AS failure_count
FROM autosys_jobs
WHERE status = 'FAILURE'
GROUP BY server_name
ORDER BY failure_count DESC;

SELECT 'AVERAGE JOB DURATION BY APPLICATION' AS analysis_name;
SELECT application, AVG(actual_duration_minutes) AS avg_duration
FROM autosys_jobs
GROUP BY application;
