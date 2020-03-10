--holds all of the queries for each bigquery table 







--pestroutes appts- 

select pr_appt_id, customer_id, subscription_id, scheduled_date, pr_date_added, appt_status, status_text, is_initial, serviced_by, date_completed, office_name, service_desc from pestroutes_appts

join office_joins on office_joins.proutes_id=pestroutes_appts.office_id 
join pr_service_types on pr_service_types.pr_type_id=pestroutes_appts.service_type
 where appt_status=1


--pr_subs

 select * from pr_subscriptions
 join office_joins on office_joins.proutes_id=pr_subscriptions.office_id

