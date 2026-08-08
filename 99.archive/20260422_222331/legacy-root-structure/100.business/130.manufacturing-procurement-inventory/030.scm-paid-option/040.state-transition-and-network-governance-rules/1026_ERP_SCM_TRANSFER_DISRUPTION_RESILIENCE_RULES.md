# ============================================================
# ERP SCM TRANSFER DISRUPTION RESILIENCE RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1026
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.transfer_disruption_resilience.rules
component: scm-transfer-disruption-resilience-rules


# TRANSFER RECOMMENDATION STATUS SET

- open
- reviewed
- accepted
- rejected
- converted
- archived


# DISRUPTION STATUS SET

- detected
- active
- mitigated
- closed
- archived


# RESILIENCE STATUS SET

- draft
- assessed
- flagged
- reviewed
- archived


# RULE

Accepted transfer recommendation is not converted transfer order.
Mitigated disruption is not closed disruption.

