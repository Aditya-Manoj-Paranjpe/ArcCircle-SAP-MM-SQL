#### ArcCircle: SAP-MM Inspired SQL Enterprise Suite

**SAP-style Retail Inventory & Procurement System built in MySQL**

#### Project Overview
This project is a high-fidelity technical simulation of an **Enterprise Resource Planning (ERP)** backend. I have translated the complex organizational hierarchy of **SAP Materials Management (MM)** into a high-performance **MySQL** database. 

This project bridges the gap between **Functional SAP Business Knowledge** and **Technical Database.**

---
####  Project Roadmap (The 3 Phases)


#### [Phase 1: Business Blueprinting](./Phase1_Design)
* **Goal:** Design the enterprise architecture before coding.
* **Key Entities:** Company Code (ARC1), Operational Plants (Mumbai/Delhi), and Storage Locations.
* **Master Data:** 13 mapped sheets covering Material Master (ROH/HALB/FERT) and Vendor Master logic.

#### [Phase 2: Database Engineering & Automation](./Phase2_Database)
* **Goal:** Implement a normalized schema with SAP-level data integrity.
* **Automation:** * `BEFORE INSERT` Triggers for automated "Availability Checks" (Stock Validation).
    * `AFTER INSERT` Triggers for real-time inventory decrementing.
    * Stored Procedures for simulated Goods Receipt (GR/MIGO) and Batch Risk Detection.

#### [Phase 3: Decision-Grade Analytics](./Phase3_Analytics)
* **Goal:** Extract business intelligence using advanced SQL.
* **Highlights:** Vendor reliability analysis, **Window Functions** for consumption trends, and dynamic **Indian Fiscal Year** reporting.

---

### How to Verify the System (Local Setup)
To run the simulations locally and see the automation in action, execute these files in your MySQL Workbench in the following order:

1. **Build Schema:** Run [Schema.sql](./Phase2_Database/Schema.sql) to create the enterprise architecture.
2. **Load Master Data:** Run [Insert.sql](./Phase2_Database/Insert.sql) to populate materials, vendors, and initial stock.
3. **Enable Automation:** Run [Automation_Logic.sql](./Phase2_Database/Automation_Logic.sql) to install the triggers and stored procedures.
4. **Execute Tests:** Run [Business_Logic_Tests.sql](./Phase2_Database/Business_Logic_Tests.sql) to simulate sales, goods receipts, and stock risk alerts.


---

#### Tech Stack & Skills
* **Database:** MySQL 8.0 (Engine for all Enterprise Logic)
* **Design Tools:** Microsoft Excel (Used for both Organizational Diagrams and Master Data Mapping)
* **SQL Implementation:** Triggers (Validation/Automation), Stored Procedures, Window Functions, and View-based Fiscal Logic.

---

### Why this project exists?
"I built this project to bridge the gap between SAP functional logic and technical database. While specializing in SAP MM, I wanted to deconstruct the 'logic engine' that powers supply chains by rebuilding it in SQL. This repository proves how complex business rules—like organizational hierarchy, inventory protection, and procurement constraints—can be automated and safeguarded directly at the database level."
