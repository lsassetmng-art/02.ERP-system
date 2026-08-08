# ============================================================
# ERP CROSS-MODULE BOUNDARY INDEX
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- ERP
- cross-module boundary docs
- module deepening docs
- foundation meta index

purpose:
Provide a single index of ERP cross-module boundary and deepening documents
created during the additive ERP design deepening phase.

# ============================================================
# 1. CORE PRINCIPLE
# ============================================================

core_principle:
- Existing ERP design is not being rebuilt from scratch.
- Foundation remains valid.
- Current work is additive deepening.
- Module exact design is added without destroying existing outputs.
- Business canon remains in ERP modules.
- CommonOS may provide shared UI / presentation / dense variant, but does not own ERP business canon.
- BI owns analytical projection only.
- Approval owns approval workflow truth only.
- Audit owns audit finding / remediation lifecycle truth only.
- Master Data owns shared identity/reference truth only.
- Source modules own their business transaction / execution / close / calculation truth.

# ============================================================
# 2. CROSS-MODULE BOUNDARY DOC INDEX
# ============================================================

## 2.1 Demand / S&OP / Planning / BI

docs:
- 00.foundation/920.meta/9200000301_DEMAND_SOP_PRODUCTION_PLANNING_BI_BOUNDARY_INTEGRATION_MEMO.md
- 00.foundation/920.meta/9200000302_DEMAND_SOP_PRODUCTION_PLANNING_BI_HANDOFF_AND_STATUS_MATRIX.md
- 07.sop-consensus/920.meta/9207000002_SOP_TO_PRODUCTION_PLANNING_HANDOFF_EXACT_PAYLOAD.md
- 16.production-planning/920.meta/9216000001_PRODUCTION_PLANNING_INTAKE_FROM_SOP_EXACT_PAYLOAD.md
- 15.manufacturing/920.meta/9215000001_MANUFACTURING_ACTUALS_FEEDBACK_BOUNDARY_EXACT.md
- 00.foundation/920.meta/9200000303_MANUFACTURING_TO_DEMAND_SOP_PLANNING_FEEDBACK_INTEGRATION_MEMO.md

fixed_boundaries:
- 06.demand-forecasting = market-side forecast truth
- 07.sop-consensus = agreed consensus demand/supply/capacity/inventory truth
- 16.production-planning = executable planning truth
- 15.manufacturing = execution actual truth
- 60.business-intelligence = analytical projection truth only

## 2.2 BI Snapshot / Lineage / Refresh

docs:
- 60.business-intelligence/920.meta/9260000002_BI_DATASET_SNAPSHOT_LINEAGE_REFRESH_EXACT_DESIGN.md
- 00.foundation/920.meta/9200000304_BI_SOURCE_MODULE_SNAPSHOT_BOUNDARY_MEMO.md

fixed_boundaries:
- BI dataset snapshot is immutable analytical copy
- source module truth remains in source modules
- dashboard projection is not source approval/correction
- refresh creates new snapshot, not silent overwrite
- drill-down does not transfer mutation authority to BI

## 2.3 Management Accounting / Costing / Project Accounting

docs:
- 00.foundation/920.meta/9200000305_MA_COSTING_PROJECT_ACCOUNTING_BOUNDARY_MEMO.md
- 31.management-accounting/920.meta/9231000001_MANAGEMENT_ACCOUNTING_CENTER_EXACT_DESIGN.md
- 18.costing/920.meta/9218000001_COSTING_TO_MANAGEMENT_ACCOUNTING_BOUNDARY_EXACT.md
- 32.project-accounting/920.meta/9232000001_PROJECT_ACCOUNTING_TO_MANAGEMENT_ACCOUNTING_BOUNDARY_EXACT.md

fixed_boundaries:
- 18.costing = cost calculation / cost component / cost basis truth
- 31.management-accounting = internal management accounting center
- 32.project-accounting = project financial truth
- 30.accounting = statutory accounting truth
- 60.business-intelligence = analytical projection only

## 2.4 Accounting Close / Managerial Close / BI Reporting

docs:
- 00.foundation/920.meta/9200000306_ACCOUNTING_MA_BI_CLOSE_REPORTING_BOUNDARY_MEMO.md
- 30.accounting/920.meta/9230000001_ACCOUNTING_CLOSE_TO_MA_AND_BI_BOUNDARY_EXACT.md
- 31.management-accounting/920.meta/9231000002_MANAGERIAL_CLOSE_TO_BI_AND_ACCOUNTING_BOUNDARY_EXACT.md
- 60.business-intelligence/920.meta/9260000003_CLOSE_REPORTING_DASHBOARD_BOUNDARY_EXACT.md

fixed_boundaries:
- 30.accounting = GL / statutory close truth
- 31.management-accounting = managerial close / internal reporting truth
- 60.business-intelligence = close dashboard / executive projection only
- BI refresh does not reopen or correct close truth

## 2.5 Inventory / Warehouse / Logistics

docs:
- 00.foundation/920.meta/9200000307_INVENTORY_WAREHOUSE_LOGISTICS_BOUNDARY_MEMO.md
- 12.inventory/920.meta/9212000001_INVENTORY_STOCK_TRUTH_AND_WAREHOUSE_HANDOFF_EXACT.md
- 13.warehouse/920.meta/9213000001_WAREHOUSE_OPERATION_AND_INVENTORY_LOGISTICS_HANDOFF_EXACT.md
- 14.logistics/920.meta/9214000001_LOGISTICS_TRANSPORT_DELIVERY_BOUNDARY_EXACT.md

fixed_boundaries:
- 12.inventory = stock ledger / stock balance / availability truth
- 13.warehouse = physical warehouse operation truth
- 14.logistics = transport / delivery / POD truth
- 17.quality = inspection/disposition truth
- 60.business-intelligence = analytical projection only

## 2.6 Procurement / Purchase / Receiving / Inventory

docs:
- 00.foundation/920.meta/9200000308_PURCHASE_PROCUREMENT_RECEIVING_BOUNDARY_MEMO.md
- 11.procurement/920.meta/9211000001_PROCUREMENT_TO_PURCHASE_BOUNDARY_EXACT.md
- 10.purchase/920.meta/9210000001_PURCHASE_ORDER_TO_RECEIVING_BOUNDARY_EXACT.md
- 13.warehouse/920.meta/9213000002_PURCHASE_RECEIVING_INTAKE_EXACT.md
- 12.inventory/920.meta/9212000002_PURCHASE_RECEIPT_INVENTORY_EFFECT_EXACT.md

fixed_boundaries:
- 11.procurement = request / sourcing / supplier selection / authorized buying truth
- 10.purchase = PO / supplier order / commercial purchasing document truth
- 13.warehouse = physical receiving operation truth
- 12.inventory = stock receipt / stock ledger effect truth
- 17.quality = quality acceptance/rejection truth

## 2.7 Order to Cash

docs:
- 00.foundation/920.meta/9200000309_ORDER_TO_CASH_BOUNDARY_MEMO.md
- 01.sales/920.meta/9201000001_SALES_TO_ORDER_MANAGEMENT_BOUNDARY_EXACT.md
- 04.order-management/920.meta/9204000001_ORDER_TO_FULFILLMENT_BILLING_BOUNDARY_EXACT.md
- 12.inventory/920.meta/9212000003_SALES_ORDER_ALLOCATION_AND_OUTBOUND_EFFECT_EXACT.md
- 13.warehouse/920.meta/9213000003_OUTBOUND_FULFILLMENT_INTAKE_EXACT.md
- 14.logistics/920.meta/9214000002_OUTBOUND_DELIVERY_ORDER_BILLING_FEEDBACK_EXACT.md
- 05.billing/920.meta/9205000001_BILLING_INVOICE_REVENUE_BOUNDARY_EXACT.md

fixed_boundaries:
- 01.sales = quote / sales condition / pre-order commercial truth
- 04.order-management = accepted customer order / fulfillment orchestration truth
- 12.inventory = reservation / allocation / stock issue truth
- 13.warehouse = pick / pack / ship-from-warehouse operation truth
- 14.logistics = delivery / POD truth
- 05.billing = invoice / billing adjustment truth
- 30.accounting = GL posting truth

## 2.8 HRM / HR / Labor / Payroll

docs:
- 00.foundation/920.meta/9200000310_HRM_HR_LABOR_PAYROLL_BOUNDARY_MEMO.md
- 40.human-resources/920.meta/9240000001_HR_MASTER_EMPLOYMENT_ASSIGNMENT_BOUNDARY_EXACT.md
- 41.labor-management/920.meta/9241000001_LABOR_ATTENDANCE_SHIFT_PAYROLL_BOUNDARY_EXACT.md
- 42.payroll/920.meta/9242000001_PAYROLL_CALCULATION_ACCOUNTING_CASH_BOUNDARY_EXACT.md

fixed_boundaries:
- 40.human-resources = HR master / employment / assignment truth
- 41.labor-management = attendance / shift / leave / overtime / work result truth
- 42.payroll = payroll calculation / payslip / payroll close truth
- 30.accounting = payroll accounting posting truth
- 34.cash-management = payment execution truth
- shift linkage is centered on 41.labor-management

## 2.9 Approval / Audit / Source Control

docs:
- 00.foundation/920.meta/9200000311_APPROVAL_AUDIT_SOURCE_CONTROL_BOUNDARY_MEMO.md
- 50.approval/920.meta/9250000001_APPROVAL_WORKFLOW_SOURCE_MODULE_BOUNDARY_EXACT.md
- 51.audit/920.meta/9251000301_AUDIT_FINDING_REMEDIATION_SOURCE_MODULE_BOUNDARY_EXACT.md
- 00.foundation/920.meta/9200000312_APPROVAL_AUDIT_CONTROL_EVENT_TAXONOMY.md

fixed_boundaries:
- 50.approval = approval route / decision / evidence truth
- 51.audit = audit finding / evidence / closure truth
- 51.audit/06.remediation-tracking = corrective action lifecycle truth
- source modules = actual business correction / transaction truth
- BI and CommonOS are projection/presentation only

## 2.10 Master Data / Source Modules

docs:
- 00.foundation/920.meta/9200000313_MASTER_DATA_SOURCE_MODULE_BOUNDARY_MEMO.md
- 52.master-data/920.meta/9252000001_MASTER_DATA_OWNERSHIP_REFERENCE_CORRECTION_EXACT.md
- 52.master-data/920.meta/9252000002_MASTER_DATA_SOURCE_MODULE_REFERENCE_MATRIX_EXACT.md
- 52.master-data/920.meta/9252000003_MASTER_DATA_EVENT_TAXONOMY_AND_GOVERNANCE_EXACT.md

fixed_boundaries:
- 52.master-data = shared identity / golden record / reference governance truth
- source modules = domain extension / transaction truth
- 50.approval = approval decision truth
- 51.audit = audit finding truth
- 60.business-intelligence = analytical snapshot/projection only
- CommonOS = presentation only

# ============================================================
# 3. MODULE COVERAGE SUMMARY
# ============================================================

covered_modules:
- 00.foundation
- 01.sales
- 04.order-management
- 05.billing
- 06.demand-forecasting
- 07.sop-consensus
- 10.purchase
- 11.procurement
- 12.inventory
- 13.warehouse
- 14.logistics
- 15.manufacturing
- 16.production-planning
- 17.quality
- 18.costing
- 30.accounting
- 31.management-accounting
- 32.project-accounting
- 34.cash-management
- 40.human-resources
- 41.labor-management
- 42.payroll
- 50.approval
- 51.audit
- 52.master-data
- 60.business-intelligence

partially_covered_or_reference_only:
- 02.sfa
- 03.crm
- 19.asset-management
- 33.fixed-assets
- 90.transition-triage
- 99.archive

note:
- Partially covered modules may already have baseline design.
- This index only tracks deepening bundle additions in the current additive phase.

# ============================================================
# 4. GLOBAL FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- BI absorbing source business canon
- CommonOS absorbing ERP business canon
- approval decision directly mutating source business record
- audit finding directly mutating source business record
- remediation-tracking owning original finding truth
- master-data changing source transactions directly
- source module forking shared master identity outside 52 workflow
- warehouse task becoming stock ledger without inventory acceptance
- logistics POD becoming invoice or stock ledger directly
- payroll close becoming accounting close
- managerial close becoming statutory close
- quote becoming accepted order without order-management intake
- purchase order becoming physical receipt without warehouse receiving
- forecast output becoming consensus truth without S&OP workflow
- consensus freeze becoming executable plan without production-planning intake

# ============================================================
# 5. COMPLETION STATE
# ============================================================

completion_state:
- cross-module boundary index created
- current additive deepening outputs indexed
- module coverage summarized
- global forbidden shortcuts consolidated

# ============================================================
