# ============================================================
# ERP MANUFACTURING COST MANAGEMENT LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2794
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing_cost_management.lifecycle_and_statusflow.rule
component: manufacturing-cost-management-lifecycle-and-statusflow-rule


# COST COLLECTION STATUS SET

- opened
- collecting
- collected
- adjusted
- archived


# STANDARD COST SNAPSHOT STATUS SET

- draft
- published
- superseded
- retired
- archived


# ACTUAL COST ACCUMULATION STATUS SET

- open
- accumulating
- finalized
- adjusted
- archived


# PRODUCTION COST VARIANCE STATUS SET

- open
- analyzed
- approved
- closed
- archived


# COST CLOSURE STATUS SET

- drafted
- pending_posting_handoff
- handed_off
- closed
- archived

