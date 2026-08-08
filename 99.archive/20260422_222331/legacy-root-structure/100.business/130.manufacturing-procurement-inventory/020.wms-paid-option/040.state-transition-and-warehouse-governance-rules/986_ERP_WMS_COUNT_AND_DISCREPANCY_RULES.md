# ============================================================
# ERP WMS COUNT AND DISCREPANCY RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-986
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.count_and_discrepancy.rules
component: wms-count-and-discrepancy-rules


# COUNT STATUS SET

- scheduled
- counting
- submitted
- reviewed
- closed
- archived


# DISCREPANCY STATUS SET

- detected
- acknowledged
- adjustment_pending
- resolved
- archived


# RULE

Submitted count is not reviewed count.
Acknowledged discrepancy is not resolved discrepancy.

