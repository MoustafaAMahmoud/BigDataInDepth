# Schema Types

-   Star Schema.

-   Snowflake Schema.

## Star Schema 

### Star Schema Main Characteristics

-   **Simplicity**: It is the simplest type of DWH schemas.

-   **Query effectiveness**: Because of simplicity, It needs less join to query the data (It is optimized to query large dataset).

-   **Data Redundancy and Large Table Size**: Due to de-normalization, it has a data redundancy, and the table size is huge.

-   **Most** used and **widely** supported.

### Star Schema Characteristics

-   Dimensions represented by one one-dimension table.

-   The dimension table are not joined to each other

-   The fact table would contain key and measure.

-   Data integrity is not enforced due to the de-normalized structure.

### Schema Types: Star Schema Example

## What is Snowflake?

![Snowflake Photo taken from
[https://earthsky.org](https://earthsky.org/earth/best-snowflakes-photos-from-earthsky-friends)](Ch01-Introduction-data-management/12-Data-Model/04-Data-Model-Schema-Types/Figures/snowflake-real.jpg)

### What is Snowflake?

![Snowflake Simple
Design](Ch01-Introduction-data-management/12-Data-Model/04-Data-Model-Schema-Types/Figures/Snowflakes-PNG-File.png)

### What is Snowflake?

![Snowflake Final
Design](Ch01-Introduction-data-management/12-Data-Model/04-Data-Model-Schema-Types/Figures/Frozen-Snowflake-PNG-File.png)

### Star S chema Characteristics

-   **Extension**: Snowflake is an extension of the Star Schema.

-   **Normalized**: Dimension tables are normalized; this means every dimension may expand into additional tables.

-   **Disk Space Efficiency**: Due to its normalization methodology, it uses less desk space, which enhances the query as we scan less data size.

-   **Complicated**: Due to the normalization query needs to join more table in some cases to get the data which reduces the performance.

### Schema Types: Star schema (Example)

### Star Vs Snowflake Schema

| Star   |      Snowflake  |
|----------|:-------------:|
| Dimension represented by one-table | Dimension tables are expanded into multi-tables |
| Fact table surrounded by dimension tables | Fact table surrounded by Hierarchy of dimension tables   |
| Less join | Requires many joins |
| Simple Design | Very Complex Design |
| De-normalized Data structure | Normalized Data Structure |
| High level of Data redundancy | Very low-level data redundancy |
| Maintenance is difficult  | Maintenance is easier |
| Good for datamarts with simple relationships (1:1 or 1:many) | Good for core to simplify (many:many) |