# ============================================================
# ERP MRP LIFECYCLE AND STATUSFLOW RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2607
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.mrp.lifecycle_and_statusflow.rule
component: mrp-lifecycle-and-statusflow-rule


# DEMAND REQUIREMENT STATUS SET

- open
- covered
- partially_covered
- expired
- archived


# PLANNED SUPPLY ORDER STATUS SET

- proposed
- released
- handed_off
- canceled
- archived


# SHORTAGE PROJECTION STATUS SET

- draft
- finalized
- superseded
- archived


# REPLENISHMENT RECOMMENDATION STATUS SET

- proposed
- accepted_for_handoff
- handed_off
- rejected
- archived


# PLAN RUN STATUS SET

- queued
- running
- completed
- failed
- archived

