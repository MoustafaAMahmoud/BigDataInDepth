## Slowly changing Dimensions

-   It the dimension which changes over time. So, for a specific date we
    have different value.

-   It has different types as following

    -   Type 0 (Fixed Dimension): We don’t change the current even the
        source changes.

    -   Type 1 (No History): No history is maintained only the latest
        replace the current.

    -   Type 2 (History): Series of history of records are maintained.

    -   Type 3 (Hybrid): Only the last Change and the Current new change
        is stored

    -   Type 4 : We split the data into two tables, first the current
        record and second is the historical (most common usage).

### Slowly changing Dimensions Other Types

*There are some other types which is a combination between the
above similar than type 3 combined between 1 | 2.|
You can check the chapter resources for more information about the other
types.*

### Slowly changing Dimensions

####Type 0

No update if the previous dimension updated.

- Ronaldo current address in Madrid

    | CustomerID | Name | City|
    |---|---|---|
    | 123456789 | Ronaldo | Madrid|

- Ronaldo updated his to Turin

    | CustomerID | Name | City|
    |---|---|---|
    | 123456789 | Ronaldo | Turin|

- Results in type 0 will not updated.

    | ID | CustomerID | Name | City|
    |---|---|---|---|
    | 1 | 123456789 | Ronaldo | Madrid|

####Type 1

- Ronaldo current address in Madrid

    | CustomerID | Name | City|
    |---|---|---|
    | 123456789 | Ronaldo | Madrid|

- Ronaldo updated his to Turin

    | CustomerID | Name | City|
    |---|---|---|
    | 123456789 | Ronaldo | Turin|

- Results in type 1 will update the record without history maintenance.

    | ID | CustomerID | Name | City|
    |---|---|---|---|
    | 1 | 123456789 | Ronaldo | Turin|

####Type 2

- Ronaldo addresses history

    | CustomerID | Name | City | UpdatedDt|
    |---|---|---|---|
    | 123456789 | Ronaldo | Madrid | 2018-12-12|
    | 123456789 | Ronaldo | Turin | 2019-06-12|
    | 123456789 | Ronaldo | London | 2019-08-12|
    | 123456789 | Ronaldo | Porto | 2019-12-12|

- Type 2 will keep all the history and keep the current with `terminationDt as null` 

    | ID | CustomerID | Name | City | effectiveDt | terminationDt | isCurrent|
    |---|---|---|---|---|---|---|
    | 1 | 123456789 | Ronaldo | Madrid | 2018-12-12 | 2019-06-12 | false|
    | 2 | 123456789 | Ronaldo | Turin | 2019-06-12 | 2019-08-12 | false|
    | 3 | 123456789 | Ronaldo | London | 2019-08-12 | 2019-12-12 | false|
    | 4 | 123456789 | Ronaldo | Porto | 2019-12-12 | null | true|

####Type 3

- Maintain the current and previous only with maintaining the history.

    | CustomerID | Name | City | UpdatedDt|
    |---|---|---|---|
    | 123456789 | Ronaldo | Madrid | 2018-12-12|
    | 123456789 | Ronaldo | Turin | 2019-06-12|
    | 123456789 | Ronaldo | London | 2019-08-12|
    | 123456789 | Ronaldo | Porto | 2019-12-12|

    | ID | CustomerID | Name | City | UpdatedDate | previousCity|
    |---|---|---|---|---|---|
    | 1 | 123456789 | Ronaldo | Porto | 2019-12-12 | London|

####Type 4

- Split current and historical into two tables. 
- This change help to easy join with only current active records without the needs for the filter such as type 2.

    |ID | CustomerID | Name | City | effectiveDt | TerminationDt|
    |---|---|---|---|---|---|
    |1 | 123456789 | Ronaldo | Madrid | 2018-12-12 | 2019-06-12|
    |2 | 123456789 | Ronaldo | Turin | 2019-06-12 | 2019-08-12|
    |3 | 123456789 | Ronaldo | London | 2019-08-12 | 2019-12-12|
    |4 | 123456789 | Ronaldo | Porto | 2019-12-12 | null|

    | ID | CustomerID | Name | City | UpdatedDate|
    |---|---|---|---|---|
    | 1 | 123456789 | Ronaldo | Porto | 2019-12-12|

### Slowly changing Dimensions

-   How does the Facts join SCD? We have two scenarios as following:

    -   Getting the current customer information (Join with the latest).

    -   Getting the historical customer information (Join with the
        historical table based on ***cust id | date***).

    | ID | CustomerID | TotalCalls | CallDate|
    |---|---|---|---|
    | 1 | 123456789 | 30 | 2018-12-12|
    | 2 | 123456789 | 30 | 2019-12-12|

### Slowly changing Dimensions Extraction Example:

    ```
    --Get latest customer details from customer profile snapshot
    select * from cust_usage_dly a 
    inner join cust_profl b 
    on a.CustomerID = b.CustomerID;
    
    --Get historical customer details from customer profile hist
    select * from cust_usage_dly a 
    inner join cust_profl_hist b 
    on a.CustomerID = b.CustomerID
    and CallDate between effectiveDt and TerminationDt 
    
    ```