# Multi-Branch-Order-Validation-and-Inventory-Allocation-Redesign
Designed a TO-BE centralized order validation system for a multi-branch distributor, proposing automated inventory checks that project a 60% reduction in fulfillment delays. This case study addresses core operational bottlenecks for Java Prima Materials, a regional B2B/B2C materials distributor.

**The Business Problem (AS-IS)**
Fulfillment operations were bottlenecked by manual data entry and disconnected systems:
* **Unvalidated Inputs:** Dealers submitted orders via WhatsApp and unstructured spreadsheets. Admins manually re-keyed this data, resulting in costly SKU typos (e.g., entering "PAINT-01" instead of the valid "PNT-01").
* **Fulfillment Delays:** Warehouse teams relied on paper printouts for physical stock checks. Out-of-stock items weren't flagged until 48 hours after the order was placed, leaving transactions stuck in a "Pending" status and damaging client trust.

**The Proposed Solution (TO-BE)**
I architected a centralized digital workflow to eliminate manual entry and automate inventory reconciliation:
* **Smart Intake:** Engineered an Excel-based order form with strict data validation and XLOOKUP automation to physically block invalid SKU inputs at the source.
* **Automated Stock Reconciliation:** Designed a 3NF relational database to instantly query requested quantities against physical warehouse stock, triggering immediate "Out of Stock" alerts or auto-generating digital picking lists.

**Repository Structure & Deliverables**
* **/dataset**: Synthetic operational data (CSV) mapping 500+ transactions, engineered with realistic friction (e.g., forced stockouts and delayed orders).
* **/docs**: The formal User Requirements Document (URD), End-User Manual, ERD, and BPMN 2.0 flowcharts detailing the AS-IS vs. TO-BE processes.
* **/prototypes**: The functional Smart Excel Order Form.
* **/sql**: PostgreSQL schema architecture, synthetic data seed scripts, and advanced analytical queries for stockout risk reporting.

**Toolkit**
* **Business Analysis:** BPMN 2.0 (Draw.io), Process Mapping, URD Documentation, Gap Analysis.
* **Technical:** PostgreSQL, Relational Database Design (ERD), Data Validation, Excel.
