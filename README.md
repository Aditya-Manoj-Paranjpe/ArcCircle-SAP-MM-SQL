#### ArcCircle: SAP-MM Inspired SQL Enterprise Suite

**SAP-style Retail Inventory & Procurement System built in MySQL**

#### Project Overview
This project is the culmination of 4 weeks of intensive SQL study, where I deconstructed the backend logic of an Enterprise Resource Planning (ERP) system.

While learning SAP S/4HANA (MM Module), I was fascinated by how it manages complex data. I decided to build my own "logic engine" from scratch by:

1. Blueprinting: Designing the organizational hierarchy (Company Code, Plants, Storage Locations) in Excel.

2. Architecting: Translating that business blueprint into a normalized MySQL database.

3. Automating: Programming the same "Availability Checks" and "Goods Receipt" logic found in SAP directly into the database using Triggers and Stored Procedures.

This project demonstrates my ability to bridge the gap between **Functional SAP Business Knowledge and Technical SQL Engineering.**


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
2. **Load Master Data:** Run [Inserts.sql](./Phase2_Database/Inserts.sql) to populate materials, vendors, and initial stock.
3. **Enable Automation:** Run [Automation_Logic.sql](./Phase2_Database/Automation_Logic.sql) to install the triggers and stored procedures.
4. **Execute Tests:** Run [Business_Logic_Tests.sql](./Phase2_Database/Business_Logic_Tests.sql) to simulate sales, goods receipts, and stock risk alerts.


---

#### Tech Stack & Skills
* **Database:** MySQL 8.0 (Engine for all Enterprise Logic)
* **Design Tools:** Microsoft Excel (Used for both Organizational Diagrams and Master Data Mapping)
* **SQL Implementation:** Triggers (Validation/Automation), Stored Procedures, Window Functions, and View-based Fiscal Logic.

---

### Why this project exists?
< "I built this project after 4 weeks of intensive SQL learning to bridge the gap between business logic and database engineering. While currently studying the SAP S/4HANA MM module, I wanted to 'peek under the hood' of how an ERP actually manages data.

The Philosophy of ArcCircle: Procurement is a continuous cycle where every stage is an 'Arc.' Rather than attempting to replicate every minor sub-process, I strategically focused on the core pillars of the SAP MM ideology. By 'idealizing' the hierarchy and building the most critical arcs of the procurement cycle in SQL, I have demonstrated that I can identify high-risk business areas and build technical safeguards to protect them. This project is about quality of logic over quantity of stages."
