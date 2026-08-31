# movielens-25m-lean-relational-joining-pipeline
A memory-optimized relational data joining and processing pipeline built for the MovieLens 25M dataset. Successfully engineered and executed locally on a constraint-heavy setup (4GB RAM, Core i3) with strict 0 OPEX and zero cloud dependence."


# Resource-Constrained MovieLens 25M Relational Data Joining Pipeline

## 🚀 Project Overview
This project demonstrates an **ultra-lean, high-performance data pipeline** engineered to process, clean, and relationally join the massive **MovieLens 25M dataset** using **R (Tidyverse)**. 

While enterprise-scale big data workflows typically rely on heavy cloud infrastructure, distributed clusters, or high-end workstations, this entire pipeline was successfully architected, optimized, and executed locally under severe hardware constraints (**0 OPEX / Zero Operational Cost**).

---

## 💻 Hardware Constraints & Environment
* **Processor:** Intel Core i3 (1.2 GHz)
* **RAM:** 4 GB Total (Strict Local Memory Management)
* **Infrastructure:** 100% Local Machine (No Cloud, No Dedicated Server, No Spark Cluster)
* **Tech Stack:** R, Tidyverse (`readr`, `dplyr`), CSV Processing

---

## 📊 Data Pipeline Architecture & Workflow

```text
[Raw Ratings CSV] ------> [Data Cleaning & Filtering] ----┐
                                                             │-----> [Inner Join on movieId] -----> [Feature Selection & Export]
[Raw Genome CSV]  ------> [Pre-Aggregation & Tag Counting] -┘

[Raw Genome CSV]  ------> [Pre-Aggregation & Tag Counting] -┘

    Ingestion & Inspection:

        Raw datasets (ratings.csv and genome_scores.csv) are ingested locally using read_csv().

        Data structures and schemas are inspected via glimpse().

    Data Cleansing & Transformation:

        Ratings Dataset: Stripped duplicates using distinct(), enforced strict data types (integer for IDs, numeric for ratings),
 and filtered anomalies.

        Genome/Tags Dataset: Cleaned and pre-aggregated using group_by(movieId) and summarise() to compute Total_Tags per movie.
This critical pre-aggregation step successfully prevents explosive Cartesian products and memory overflow (OOM) during table joins.

    Optimized Relational Join:

        Performed an inner_join on movieId under strict low-memory thresholds.

    Export & Persistence:

        Selected core metrics (userId, movieId, rating, Total_Tags), filtered unique rows, and exported a clean,
lightweight analytical dataset (New_dataset_movielens_25M_data_joining_pipeline_data.csv).
