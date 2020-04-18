## Multi-valued dimensions

-   When the relationships between the dimension member and the fact are
    many to many which means the dimension members are lower granularity
    than the facts.

-   Fact table should contains one-to-one relationship with the
    dimension. So, we introduce the ***Bridge table*** when we need to
    related multiple dimensions values with one record.

### Multi-valued dimensions Examples

-   Patients can have multiple diagnoses.

-   Students can have multiple majors.

-   customers can have multiple account.

-   Authors can have multiple publications.

### Multi-valued dimensions Article Sales Example

-   Assume we need to report the sales of article and we have some
    articles has more than one author.

-   Each author has weighting factor for each article.

-   According to the report we need to check each author and associate
    with the articles they have authored. How can we model this case?

-   Assume the first article has only one author *Moustafa*, and the
    second article has two authors *Ahmed & Amr*.

#### Implementation 1
Multi-valued dimensions (Implementation-1) figure 1

Multi-valued dimensions (Implementation-1) figure 2

What are the problems in this implementation?

-   We can’t get the weighting factor for each author.

-   Duplicated rows in sales.
#### Implementation 2
Multi-valued dimensions (Implementation-2) figure

#### Final Implementation 

### Example Reference

-   Example in this video taken from this link
    <https://www.nuwavesolutions.com/bridge-tables/>
