### Conformed Dimensions

Conformed Dimensions: the dimension which is and has the across many fact tables which it
    relates and used in different areas of the warehouse.

**Date as a Key**: if we have a date column across many facts, we could use the
        date as key in all tables. So, it should be a unified format.

**Product-Id as a Key**: if we have a product name which could vary between systems
ex: (upper/lower) We can create a dimension table for the product
        details and use product id unified across fact tables.
