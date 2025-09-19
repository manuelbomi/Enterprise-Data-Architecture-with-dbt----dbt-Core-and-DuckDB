# Enterprise Data Architecture with dbt (dbt Core + DuckDB)

##### This repository demonstrates a small but production-patterned dbt project using **dbt Core** with **DuckDB** for local development and testing. 

##### The goal is to show how dbt enables **reliable, repeatable, and governed** SQL pipelines that scale from local prototyping (DuckDB) to full enterprise warehouses (BigQuery, Snowflake, Redshift, etc).

---

## Brief Overview of dbt Application to SQL Queries

#### dbt (data build tool) is used to transform raw data into clean, tested, documented datasets using SQL. It brings software engineering practices (like modular code, version control, testing, and documentation) to data transformation workflows.

#### The following are the important components of dbt
    • Models: 
      SQL queries that define your data transformations. These are the heart of your dbt project.
    • Sources: 
      Declarations of your raw data tables in your data warehouse that dbt can reference.
    • Tests: 
      SQL queries or YAML configurations to validate the quality and integrity of your data.
    • Macros: 
      Reusable Jinja code snippets that can be embedded within your SQL models for dynamic logic.
    • Seeds: 
      Small CSV files used to load static data into your data warehouse for testing or reference.

####  Choosing dbt Setup:
    • dbt Cloud: 
      Offers a web-based IDE, simplified setup, and managed infrastructure. A free developer tier is available.
    • dbt Core: 
      Requires local installation and managing your own environment, including connecting to a data warehouse and a Git repository.

#### Connecting to an Enterprise Data Warehouse:
    • dbt works with various data warehouses like Snowflake, BigQuery, Redshift, Databricks, and others.
    • Users will need to configure dbt to connect to their chosen data warehouse by providing connection details (e.g., credentials, project IDs).


#### Initializing a dbt project:
Code
    *dbt init project_name*
    
    • Define your sources: 
    
      Create a sources.yml file to declare your raw data tables (e.g., customers, orders, payments).
      
    • Build your first models: 
    
      Create .sql files within the models directory to transform your raw data into more analytical structures. For example, create a stg_customers.sql to select and clean customer data, and then a dim_customers.sql to create a dimensional customer table.
      
    • Add tests: 
    
      Define tests in your schema.yml or as separate .sql files to ensure data quality (e.g., unique and not_null tests on primary keys).

##### Then, run dbt Commands:

    • dbt run: Executes your models and creates or updates tables/views in your data warehouse.
    
    • dbt test: Runs your defined tests to check data quality.
    
    • dbt build: Runs both dbt run and dbt test in sequence.
    
    • dbt docs generate and dbt docs serve: Generates and serves local documentation for your dbt project.

---
---


## Why this approach (dbt + DuckDBT) is Useful for Enterprise Data Architecture enterprise
#### Using dbt (data build tool) in combination with DuckDB (often integrated as "DuckDB + dbt" or informally referred to as "Duckdbt") is increasingly popular in modern enterprise data architecture. 

#### The dbt Core + DuckDB combination brings together the power of modular, version-controlled SQL transformations (via dbt) and the lightweight, high-performance analytics engine (DuckDB), making it an attractive stack for many use cases. Additional benefits of the stack include: 

#### 1. Modular and Maintainable SQL with dbt

##### SQL as Code: dbt turns SQL into software engineering–style code. Users can structure their  SQL queries as modular models with dependencies.

##### Version Control: dbt integrates with Git, allowing changes to SQL models to be tracked, reviewed, and collaborated on.

##### Testing and Documentation: dbt lets you write tests for your data models and auto-generates documentation from your code.

#####  <ins>Enterprise benefit</ins>:  Encourages data governance, quality, and maintainability. Teams can collaborate better, review each other’s transformations, and reduce data debt.


#### 2. Blazing-Fast, Local Execution with DuckDB

##### In-Memory Execution: DuckDB is a high-performance OLAP database optimized for analytical queries and can execute directly in memory.

##### Zero Infrastructure: DuckDB can run locally, in the browser, or embedded in applications. No need for a server or cloud cluster to spin up.

#####  <ins>Enterprise benefit</ins>: Ideal for development, testing, prototyping, or edge analytics without provisioning infrastructure. Lowers costs and accelerates development cycles.



#### 3. End-to-End ELT in SQL

##### dbt + DuckDB allows you to:

* Ingest raw data (e.g., CSV, Parquet, or S3/GCS files)

* Perform transformations using SQL models

* Output results to downstream systems or files

* Testing: dbt test checks invariants (not_null, uniqueness, custom tests) so you guard data reliability.

*  Documentation: dbt docs provides auto-generated docs from YAML model descriptions and column docs.
  
* Local/Cloud parity: DuckDB allows you to build and validate locally; same dbt models can run on BigQuery/Snowflake by changing profile.

* Modular SQL: ref() and source() enforce lineage and modularity — great for scaling to enterprise pipelines.
  
* Repeatability: the SQL that generates your SQL model is versioned in Git; dbt run will recreate it identically every time.

* CI/CD: GitHub Actions or other CI can run dbt run/dbt test on every PR.

##### <ins>Enterprise benefit</ins>: Enables self-service ELT pipelines for analysts and data engineers, using just SQL. No Python or complex orchestration required for many workloads.


#### 4. Portability and Scalability

##### DuckDB can run on a laptop, in a container, or inside cloud environments.

##### DcukDB can also be imported into Python by just calling: import duckdb  (i.e.: <ins>pip install duckdb</ins> , then <ins>import duckdb</ins>)

##### For scale, dbt can target other warehouses (Snowflake, BigQuery, Redshift), but using DuckDB for development is lightweight and fast.

##### <ins>Enterprise benefit</ins>: Promotes portability of development. Write models locally with DuckDB, then deploy to a production warehouse. Or use DuckDB in production for small/medium workloads.


#### 5. Cost Efficiency

##### DuckDB is open source and doesn’t require expensive cloud compute.

##### dbt Core is open source; dbt Cloud (optional) offers managed orchestration and collaboration.

##### <ins>Enterprise benefit</ins>: Reduces TCO (Total Cost of Ownership) for data transformation pipelines while maintaining a modern architecture.


#### 6. Integration with Modern Data Stack

##### DuckDB can read from and write to:

* CSV, Parquet, JSON

* Local files or cloud storage (S3, GCS)

* dbt can orchestrate these transformations, test data quality, and integrate with other tools like Airflow, Prefect, or dbt Cloud.

##### <ins>Enterprise benefit</ins>: Easily fits into existing data lakes, lakehouses, or data mesh environments.


#### 7. Data Governance and Compliance

##### dbt provides built-in lineage tracking, making it easy to see how data flows from source to end model.

##### This is critical for compliance (e.g., GDPR, HIPAA, SOX), where traceability and auditability are key.

##### <ins>Enterprise benefit</ins>: Increases transparency and accountability in data pipelines.


---

## When to Use this Stack (dbt + duckDB) in the Enterprises

* Prototyping pipelines before deploying to production warehouses.

* Developing locally without access to full infrastructure.

* Empowering analysts and data scientists with self-service tools.

* Edge analytics or offline batch transformations.

* Cost-sensitive workloads where large cloud warehouse costs are a concern.

---
---

# How to Use this Repository for Enterprise Data Architecture

#### The repository structure is as shown below:

<img width="351" height="344" alt="Image" src="https://github.com/user-attachments/assets/c10b4fb7-92ca-4df2-a054-e236448c00e6" />

---

*The repository contents are*:

- `seeds/sales_data.csv` — example raw data (toy store sales).
- `models/staging/` — staging layer using `source()` to import raw data.
- `models/marts/` — example mart that aggregates daily revenue.
- `marts.yml` — model docs + tests.
- `dbt_project.yml` — project settings, seeds config.
- `profiles.yml` → **NOT in repo** (see instructions below).

---

* After git clonning the repository, on Windows OS, assume repo is at: C:\Users\Owner\Desktop\ProjectsEmmOye2025\dbt\enterprise-data-architecture-with-dbt


1. Open PowerShell, cd to repo:
   
```powershell
cd "C:\Users\Owner\Desktop\ProjectsEmmOye2025\dbt\enterprise-data-architecture-with-dbt"
```


2. Create & activate a virtualenv:
```
python -m venv .venv
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
.\.venv\Scripts\Activate.ps1
```

3. Install dbt + duckdb adapter:
```
python -m pip install --upgrade pip
pip install dbt-duckdb
```

4. Create your dbt profile (outside the repo):
```
Create directory %USERPROFILE%\.dbt if it doesn't exist.

Save the provided profiles.yml content (see section below) at:
C:\Users\......\.dbt\profiles.yml

```

5. Make sure path points to an absolute location where the toy_store.duckdb will be created.

(Optional) check dbt:
```
dbt --version
dbt debug
```

6. Seed the raw CSV into DuckDB:
```
dbt seed

```

7. Build models:
```
dbt run

```

8. Run tests:
```
dbt test

```

9. Generate docs:
    
```
dbt docs generate
dbt docs serve

```

### What you should see

* dbt seed loads seeds/sales_data.csv into DuckDB as main_raw.sales_data (schema depends on your profile target schema).

* dbt run creates a staging.sales_data model (view) and marts.daily_sales (view or table depending on materialization).

* dbt test runs not_null tests on order_date and total_revenue.
  

### Next steps if expanding this repo

* Add more tests: unique, accepted_values, or relationships.

* Add more marts: product_level_sales.sql, monthly_sales.sql.

* Add snapshots for slowly changing dimensions.

* Add CI/CD to run dbt run and dbt test on PRs.

### Troubleshooting tips (Windows)

If dbt cannot find your profile, confirm %USERPROFILE%\.dbt\profiles.yml exists and profile: <name> in dbt_project.yml matches.

If a seed load fails, open the CSV in VS Code and re-save as UTF-8 (without BOM) and ensure delimiter is ,.

If DuckDB CLI is missing, download duckdb.exe and add its folder to your PATH or call with full path.



---

Thank you for reading

---

### **AUTHOR'S BACKGROUND**
### Author's Name:  Emmanuel Oyekanlu
```
Skillset:   I have experience spanning several years in data science, developing scalable enterprise data pipelines,
enterprise solution architecture, architecting enterprise systems data and AI applications,
software and AI solution design and deployments, data engineering, high performance computing (GPU, CUDA), machine learning,
NLP, Agentic-AI and LLM applications as well as deploying scalable solutions (apps) on-prem and in the cloud.

I can be reached through: manuelbomi@yahoo.com

Websites (professional):  http://emmanueloyekanlu.com/
Websites (application):  https://app.emmanueloyekanluprojects.com/
Publications:  https://scholar.google.com/citations?user=S-jTMfkAAAAJ&hl=en
LinkedIn:  https://www.linkedin.com/in/emmanuel-oyekanlu-6ba98616
Github:  https://github.com/manuelbomi

```
[![Icons](https://skillicons.dev/icons?i=aws,azure,gcp,scala,mongodb,redis,cassandra,kafka,anaconda,matlab,nodejs,django,py,c,anaconda,git,github,mysql,docker,kubernetes&theme=dark)](https://skillicons.dev)









