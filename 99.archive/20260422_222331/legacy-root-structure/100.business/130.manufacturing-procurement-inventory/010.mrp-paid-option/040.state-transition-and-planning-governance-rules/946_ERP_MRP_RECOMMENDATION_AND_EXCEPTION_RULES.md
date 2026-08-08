# ============================================================
# ERP MRP RECOMMENDATION AND EXCEPTION RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-946
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.recommendation_and_exception.rules
component: mrp-recommendation-and-exception-rules


# RECOMMENDATION STATUS SET

- open
- reviewed
- accepted
- rejected
- converted
- archived


# EXCEPTION STATUS SET

- detected
- acknowledged
- action_planned
- resolved
- archived


# RULE

Accepted recommendation is not converted purchasing document.
Acknowledged exception is not resolved shortage.

