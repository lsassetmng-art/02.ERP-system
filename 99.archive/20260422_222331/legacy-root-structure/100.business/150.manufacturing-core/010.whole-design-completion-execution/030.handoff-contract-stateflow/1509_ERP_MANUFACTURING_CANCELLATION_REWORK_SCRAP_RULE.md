# ============================================================
# ERP MANUFACTURING CANCELLATION REWORK SCRAP RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1509
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing.cancellation_rework_scrap.rule
component: manufacturing-cancellation-rework-scrap-rule


# RULE

Manufacturing cancellation, rework, and scrap semantics must remain distinct.

Representative distinctions:
- canceled production order is not rework execution
- rework is not scrap declaration
- scrap declaration is not accounting variance posting

# CONSEQUENCE

Every cancellation-class, rework-class, or scrap-class action must preserve:
- original manufacturing object reference
- reason
- actor
- timestamp
- downstream handoff visibility

