# ============================================================
# ERP COMPANY WIDE MBO ROLLDOWN AND ACTIVATION RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-902
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.rolldown_and_activation.rules
component: company-wide-mbo-rolldown-and-activation-rules


# ROLLDOWN STATUS SET

- draft
- active
- on_hold
- completed
- canceled
- archived


# ALIGNMENT STATUS SET

- draft
- aligned
- partially_aligned
- misaligned
- archived


# RULE

Active rolldown is not the same as aligned state.
Archived rolldown and archived alignment must remain historically visible.

