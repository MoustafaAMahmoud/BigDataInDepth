--Get latest customer details from customer profile snapshot
select * from cust_usage_dly a 
inner join cust_profl b 
on a.CustomerID = b.CustomerID;

--Get historical customer details from customer profile hist
select * from cust_usage_dly a 
inner join cust_profl_hist b 
on a.CustomerID = b.CustomerID
and CallDate between effectiveDt and TerminationDt 
