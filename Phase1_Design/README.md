### Phase 1: SAP MM & SD Business Blueprint (ArcCircle)

### Project Concept
This phase documents the **Organizational Mapping** for the ArcCircle enterprise. I have translated the SAP MM Organizational Hierarchy—learned during my SAP training—into a functional blueprint for a high-performance MySQL database.

---

### Enterprise Organizational Hierarchy
The diagram below represents the three-pillar strategy (Purchasing, Operations, and Sales) under the legal entity **ARC1**.

![ArcCircle Org Structure Diagram](Org_Structure_Diag.png)

#### *** Level 1: Company Code — ARC1 (ArcCircle Retail India Pvt Ltd)**
The highest legal entity for financial consolidation and statutory reporting. In this technical implementation, all inventory valuation from the Mumbai (ARC_PL01) and Delhi (ARC_PL02) plants rolls up to this entity to ensure accurate financial tracking and tax compliance.

#### **Level 2: Parallel Mapping (The Three Pillars)**
1. **Purchasing Org (ARC_PO01):** Strategic procurement unit handling all India operations and responsible for negotiating with **Vendors V_001 to V_005**.
2. **Operational Plants (ARC_PL01 & ARC_PL02):** Physical hubs where materials are received, stored, and valuated. **Mumbai** serves as the Assembly hub, while **Delhi** acts as the Regional Distribution Center.
3. **Sales & Distribution (SD):** The "Outbound" pillar that triggers the reduction of inventory via Sales Orders, closing the loop on the Material Master lifecycle.

---

### Phase 1 Artifacts
* [**Enterprise_Data_Master.xlsx**](./Enterprise_Data_Master.xlsx)
  *Contains the 13 Master Data sheets: Company Code, Plant, Material Master, Vendor Master, etc.*
* [**Org_Structure_Diag.png**](./Org_Structure_Diag.png)
  *The visual Business Blueprint of the enterprise.*

---

### Professional Statement
> "Leveraging SAP MM ideology, I engineered a scalable SQL backend that mirrors a real-world enterprise. This Phase proves the successful translation of a Business Blueprint into a functional database structure, where every constraint is designed to safeguard the integrity of the 'Procure-to-Cash' lifecycle."
