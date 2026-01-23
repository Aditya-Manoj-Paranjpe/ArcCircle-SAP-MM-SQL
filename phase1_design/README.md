#  Phase 1: SAP MM & SD Business Blueprint (ArcCircle Retail Solutions)

###  Project Concept & Ideology
This phase documents the **Organizational Mapping** for the ArcCircle enterprise. This project serves as a technical bridge: I have translated the **SAP Organizational Ideology**—learned during the entry-level stages of my SAP MM training—into a functional blueprint for a high-performance **MySQL database**.

**The "Week 1" Inspiration:**
During my initial SAP MM classes, I learned that a successful ERP system starts with a solid Organizational Hierarchy. Instead of just navigating the software, I wanted to build the engine behind it. I used those SAP concepts to design my own custom enterprise structure for **ArcCircle**, which served as the mandatory foundation for all the SQL code in this repository.

![ArcCircle Enterprice_Data_Master.xlsx](Org_Structure_Diagram.png)

---

###  Enterprise Organizational Hierarchy
Based on my **ORG STRUC BLUEPRINT**, the enterprise is built on three parallel functional pillars under a single legal entity to manage the complete **Procure-to-Cash** cycle.

#### **Level 1: Company Code — ARC1 (ArcCircle Retail India Pvt Ltd)**
![ArcCircle Enterprice_Data_Master.xlsx](ArcCircle_Org_Structure_Diag.png)
The highest legal entity level for statutory, tax, and financial reporting. All business units below this level roll up their financial valuation to **ARC1**.

#### **Level 2: The Three Strategic Pillars (Parallel Mapping)**
In the ArcCircle blueprint, these three entities sit side-by-side under the Company Code:

1.  **Purchasing Organization (ARC_PO01 - Central Procurement):**
    * **Role:** Strategic procurement unit handling all India operations.
    * **Scope:** Responsible for negotiating and managing **Vendors (V_001 to V_005)**.
2.  **Operational Plants (ARC_PL01 & ARC_PL02):**
    * **ARC_PL01 (Mumbai DC):** Primary hub for Assembly and Packaging. This is where **ROH** (Raw Materials) is transformed into **HALB** (Semi-Finished) and **FERT** (Finished Goods).
    * **ARC_PL02 (Delhi DC):** A dedicated Regional Distribution Center for bulk storage and fulfillment.
3.  **Sales & Distribution (SD):**
    * **Role:** The "Outbound" pillar. This pillar triggers the reduction of inventory via Sales Orders to end customers, closing the loop on the Material Master lifecycle.

#### **Level 3 & 4: Tactical Execution**
Underneath the pillars, the system is broken down into specific execution units:

* **Purchasing Groups (PG_01 & PG_02):**
    * **PG_01 (Grocery Buyer):** Manages procurement for items like **RM_001 (Wheat Flour Bulk)**.
    * **PG_02 (Apparel Buyer):** Manages procurement for items like **RM_006 (Cotton Fabric Roll)**.
* **Storage Locations (SLoc):**
    * **SL_001 (Raw Materials):** Fast-moving storage for ROH inventory.
    * **SL_002 (Semi-Finished):** Bin management for HALB/In-house assembly.
    * **SL_003 (Finished Goods):** Bulk storage for saleable FERT stock.

---

###  Functional Business Rules (Directly from Excel Logic)
The technical SQL implementation is strictly governed by these blueprint rules:

1.  **Material Control Logic:** Materials are strictly categorized into **ROH, HALB, and FERT**. The system enforces that Raw Materials (ROH) can only be procured externally, while Finished Goods like **FG_001 (Cotton Shirt)** can be produced in-house.
2.  **Entity Mapping:** Only vendors assigned to **ARC_PO01** (e.g., *Maharashtra Agro Suppliers*) are authorized to supply the plants.
3.  **Real-Time Validation:** Every sales transaction must pass an **"Availability Check"** at the Plant + Storage Location level before the inventory is decremented, mimicking SAP standard behavior.

---

### 📂 Phase 1 Artifacts
* [**ArcCircle_Enterprice_Data_Master.xlsx**](./ArcCircle_Enterprice_Data_Master.xlsx) 
* [**ArcCircle_Org_Structure_Diag.png**](./ArcCircle_Org_Structure_Diag.png)

---

###  Professional Statement
> "Leveraging SAP MM organizational ideology, I engineered a scalable SQL backend that mirrors a real-world enterprise environment. My work proves the successful translation of a multi-sheet Business Blueprint into a functional database, where every trigger and constraint is designed to safeguard the integrity of the 'Procure-to-Cash' lifecycle."
