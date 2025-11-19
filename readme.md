"# Tuberculosis" 



# Pakistan TB Data Analysis (2025) 
### *100% Dockerized • Zero R Installation • Run in 30 Seconds*

> **WHO Global TB Data** | Clean EDA + Visualizations | Built for **Data Analyst / Public Health** roles

---

## Why This Project?

I analyzed **Pakistan’s TB epidemic** using **official WHO datasets** to showcase:
- **Data cleaning & quality checks**
- **Exploratory Data Analysis (EDA)**
- **Insightful visualizations**
- **Reproducible, containerized workflow**

All in **R + tidyverse**, fully **Docker-powered** — no local R or RStudio needed.

---

## Key Findings

| Insight | Value |
|-------|--------|
| **TB Incidence (2024)** | ~669,000 cases (266 per 100k) |
| **Mortality (2024)** | ~52,000 deaths |
| **Drug-Resistant TB (new cases)** | Dropped from **3.7% (2015)** → **1.9% (2024)** |
| **Preventive Treatment Coverage** | Only **5.4%** of household contacts treated in 2024 |
| **Data Quality** | 100% complete for all key indicators |

> *Perfect for TB program managers, WHO, Global Fund, or NTP reporting*

---

## 100% Dockerized – Run Anywhere

**No R. No RStudio. No setup pain.**

Just **Docker** → one command → full analysis environment ready.

### Setup and configuration:

```bash
# 1. Clone & enter repo

git clone https://github.com/yourname/pakistan-tb-analysis.git
cd pakistan-tb-analysis

# 2. Launch RStudio in browser (password: your `own password`)

docker run -d -p 8787:8787 \
  -e PASSWORD=`password` \
  -v "$(pwd)":/home/rstudio/project \
  --name tb-analysis \
  rocker/rstudio:latest

# 3. Open browser → http://localhost:8787

# Login: `username` / `password`

```


## Data Source

All data comes directly from the **WHO Global Tuberculosis Programme** — official, up-to-date, and publicly available:

[https://www.who.int/teams/global-tuberculosis-programme/data](https://www.who.int/teams/global-tuberculosis-programme/data)

Specific files used:
- WHO TB burden estimates (2000–2024)
- MDR/RR-TB burden estimates
- TB preventive treatment (household contacts)
- 2024–2025 incidence by age/sex/risk factor
