# Reproduce prisma error on "JOIN" a big data set

This repo reproduces the error happening when you want to get data from other tables.

```
Can't reach database server at `localhost`:`5432`

    Please make sure your database server is running at `localhost`:`5432`.
```

Prisma doesn't do a `JOIN` when you might think it does. Instead batches smaller chunks queries with the result from the previou one as better explained here: https://youtu.be/RAoXdyI_PH4?t=1059

# Conclusions

Prisma fails to get more than ~20k records while using a JOIN works well.  