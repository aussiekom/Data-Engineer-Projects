-- Search for repeated rows by column name
select column_name, count(column_name)
  from table
group by column_name
having count (column_name) > 1;

-- Show the indexes of a Database schema
select TABLE_NAME, count(*)
  from all_indexes
where owner = 'OWNER_NAME' or table_owner = 'TABLE_OWNER'
group by TABLE_NAME
order by TABLE_NAME;

-- Show the N most expensive queries
select 
     st.TEXT AS QueryName,          
     wt.execution_count AS ExecutionCount,
     wt.total_worker_time/1000000 AS TotalCpuTimeInSeconds,
     wt.total_worker_time/wt.execution_count/1000 AS AverageCpuTimeInMs],
     qp.query_plan,
     DB_NAME(st.dbid) AS [Database Name]
from 
    (select top 10 
          qs.execution_count,
          qs.total_worker_time
            from sys.dm_exec_query_stats qs
     order by qs.total_worker_time desc) wt
     
cross apply sys.dm_exec_sql_text(plan_handle) st
cross apply sys.dm_exec_query_plan(plan_handle) qp 


-- Show whether an index is used or not
-- we need to enable the monitoring of your index:
ALTER INDEX INDEX_NAME MONITORING USAGE; 
-- If we want to disable the monitoring, we only have to execute the following sentence:
ALTER INDEX INDEX_NAME NOMONITORING USAGE;
-- we can use the monitoring data by consulting the v$object_usage view:
select * 
from
  v$object_usage VIEW
  
  
  
-- Use count (1) instead of count (*)
-- The count(*) clause considers all the columns of a table to make the calculation, 
-- instead, the count(1) clause only takes the first column. 
--BETTER
select
  count(1) from big_table;

--WORSE  
select 
  count(*) from big_table; 



-- Conditionals (case when = if - then - else)
select column1, column2,
       case when price >= 100 then '1'
            when price between 90 and 99 then '2'
            else 'Other case' end price_type
from table 


-- Common Table Expressions (CTE) - SELECT, INSERT, UPDATE, DELETE, or MERGE.
-- A CTE mainly allows you to replace subqueries and table variables. 
--WORSE
select *
  from other_table
where
  name in (select name
            from table 
           where
           condition1 < 1000 and ... )

--BETTER
with CTE_NAME as (
  select name
    from table 
  where condition1 < 1000 and ...  
)

select *
  from other_table
where name in (SELECT name from CTE_NAME) 




-- OVER and OVER (PARTITION BY)
-- The OVER clause allows us to get aggregated information 
-- without using a GROUP BY avoiding many of its complications. 
--OVER
select 
  SUM(column1) OVER () AS sum1,
  column2
from table1

--OVER PARTITION
select 
  SUM(column1) OVER (PARTITION BY client ) AS sum1,
  column2
from table1 
