# STATA-to-SQL
# STATA-to-SQL: Retention Analysis

This repo shows how to compute next-day retention using both Stata and SQL, with a simulated dataset.

## Files
- `retention_simulation.csv`: synthetic user login data
- `retention_user.do`: Stata script (user-level retention)
- `retention_household.do`: Stata script (household-level retention)
- `retention_analysis.sql`: SQL version using LEAD and DATEDIFF

## Dataset
- 50 users × 7 days
- Columns: pid, hh_id, gameing_hours, date, experience_rate

## Retention Definition
- User: login today → login again tomorrow
- Household: anyone in household logs in again tomorrow

