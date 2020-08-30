CREATE TABLE cust_trans_hist ( 
         name string,
         city string,
         cust_id int ) 
PARTITIONED BY (trns_date date) 
CLUSTERED BY (cust_id) INTO 256 BUCKETS

