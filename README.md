# Enterprise Data Architecture with dbt (dbt Core + DuckDB)

##### This repository demonstrates a small but production-patterned dbt project using **dbt Core** with **DuckDB** for local development and testing. 

##### The goal is to show how dbt enables **reliable, repeatable, and governed** SQL pipelines that scale from local prototyping (DuckDB) to full enterprise warehouses (BigQuery, Snowflake, Redshift, etc).


## Why this approach (dbt + DuckDBT) is Useful for Enterprise Data Architecture enterprise

* Repeatability: the SQL that generates daily_sales is versioned in Git; dbt run will recreate it identically every time.

* Testing: dbt test checks invariants (not_null, uniqueness, custom tests) so you guard data reliability.

* Documentation: dbt docs provides auto-generated docs from YAML model descriptions and column docs.

* Local/Cloud parity: DuckDB allows you to build and validate locally; same dbt models can run on BigQuery/Snowflake by changing profile.

* Modular SQL: ref() and source() enforce lineage and modularity — great for scaling to enterprise pipelines.

* CI/CD: GitHub Actions or other CI can run dbt run/dbt test on every PR.

---

## What’s in this repo

