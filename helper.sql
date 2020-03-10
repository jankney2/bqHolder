--holds all of the queries for each bigquery table 







--pestroutes appts- 

select pr_appt_id, customer_id, subscription_id, scheduled_date, pr_date_added, appt_status, status_text, is_initial, serviced_by, date_completed, office_name, service_desc from pestroutes_appts

join office_joins on office_joins.proutes_id=pestroutes_appts.office_id 
join pr_service_types on pr_service_types.pr_type_id=pestroutes_appts.service_type
 where appt_status=1


--pr_subs raw data
 select  subscription_id, customer_id, office_id, pr_subscriptions.date_added, active_text, agreement_length, service_type, sold_by, initial_status_text, annual_recurring_services, annual_recurring_value, sales_value, concat(employees.first_name, ' ', employees.last_name)as sold_by_name, sold_by as sold_by_pr_id, employees.branch as employee_branch, office_joins.office_name
  from pr_subscriptions
 join office_joins on office_joins.proutes_id=pr_subscriptions.office_id
join employees on employees.proutes_id=pr_subscriptions.sold_by


--pro count for offices 
select workday, branch, unique_sp_count, is_business_day, office_name from daily_sp_count
join office_joins on office_joins.proutes_id=daily_sp_count.branch


--create custom columns for these that match them to their parent office in BQ

select * from podium_nps

select * from paylocity_hours


