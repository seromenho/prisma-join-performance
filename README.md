# Reproduce prisma error on "JOIN" a big data set

This repo reproduces the error happening when you want to get data from other tables.

```
Can't reach database server at `localhost`:`5432`

    Please make sure your database server is running at `localhost`:`5432`.
```

Prisma doesn't do a `JOIN` when you might think it does. Instead batches smaller chunks queries with the result from the previou one as better explained here: https://youtu.be/RAoXdyI_PH4?t=1059

# Conclusions

Prisma fails to get more than ~20k records while using a JOIN works well.  

## Possible reasons

Not really sure about the reasons but might be:
1.  Huge second(third/fourth/so on) query being created after the first one returning 40k id's so the second query to query model `B` is something like
  ```sql
SELECT  
...  
FROM "B"  
WHERE "aId" IN (....40K ids here)
  ```
Doesn't seem it passes the char limit for the query but could be related to the query lenght.

## Possible solution

1. Give the user the choice to execute a real join...
