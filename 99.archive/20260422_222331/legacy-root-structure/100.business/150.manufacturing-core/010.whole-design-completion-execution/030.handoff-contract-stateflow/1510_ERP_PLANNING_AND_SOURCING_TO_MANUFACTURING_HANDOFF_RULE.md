# ============================================================
# ERP PLANNING AND SOURCING TO MANUFACTURING HANDOFF RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1510
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.planning_and_sourcing_to_manufacturing.handoff_rule
component: planning-and-sourcing-to-manufacturing-handoff-rule


# RULE

MRP, SCM, purchasing, and inventory may hand off:
- planned production context
- source availability context
- inbound material availability context
- stock availability context

Manufacturing core creates new owned truths:
- production order
- production operation
- material issue request
- completion receipt
- scrap declaration

