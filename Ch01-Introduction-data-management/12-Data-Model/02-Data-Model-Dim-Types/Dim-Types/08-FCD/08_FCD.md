## Fast Changing Dimension (Mini Dimension)

-   When we have a dimension with one or more of its attributes changing
    very fast.

-   It causes a performance issue if we tried to handle this case similar SCD Type 2 because of the rapidly changing  in this dimension and the table will includes a lot of rows for this dimension

-   We solve this case by separation the attributes into one or more
    dimensions. This technique also called ***mini-dimensions***.

### Fast Changing Dimension (Mini Dimension)

-   How to implement FCD (Mini Dimension)?

| Patient\_id | Name | Gender | BirthDate | Weight | B\_Presaure | UpdateDt|
|---|---|---|---|---|---|---|
| 123 | Anna | F | 1968-01-12 | 50 | 110.0 |2019-01-01|
| 123 | Anna | F | 1968-01-12 | 55 | 130.0 |2019-01-07|
| 123 | Anna | F | 1968-01-12 | 59 | 115.0 |2019-01-14|
| 123 | Anna | F | 1968-01-12 | 65 | 120.0 |2019-01-21|

### Fast Changing Dimension (Mini Dimension)

  *Patient Mini Dimension*
  
  |Patient\_id  | Patient\_Key |  Start\_Date |  End\_Date|
  |-------------|--------------| -------------| ------------|
  |123          | 1            |  2019-01-01  |  2019-01-07|
  |123          | 2            |  2019-01-07  |  2019-01-14|
  |123          | 3            |  2019-01-14  |  2019-01-21|
  |123          | 4            |  2019-01-21  |  null|

 
