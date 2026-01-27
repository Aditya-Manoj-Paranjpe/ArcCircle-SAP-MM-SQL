### Phase 1: SAP MM Business Blueprint (ArcCircle)

### Project Concept
ArcCircle represents the belief that procurement is a continuous loop, not a linear path. Every business stage—from Vendor Sourcing to Inventory Management—is a single "Arc." When these arcs are engineered with precision and connected, they complete the "Circle" of a functional enterprise lifecycle.

---

## The Blueprinting Process (Phase 1)
In the first week of my SQL journey, I used SAP S/4HANA (MM) as a framework to design the system logic. Before writing any code, I architected the enterprise in Excel to solve complex data relationships:
1. Hierarchical Integrity: Mapping Plants and Storage Locations under a unified Company Code.
2. Functional Linking: Bridging the gap between Purchasing (Inbound) and Sales (Outbound).
3. Data Mapping: Designing 13 Master Data sheets to ensure a "data-ready" schema implementation.

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
> "In this phase, I translated SAP's enterprise ideology into a custom business architecture. By planning the hierarchy in Excel first, I ensured that the resulting SQL database wasn't just a collection of tables, but a functional engine capable of safeguarding the 'Procure-to-Cash' lifecycle. This demonstrates my ability to lead with business logic before executing with technical code." 
