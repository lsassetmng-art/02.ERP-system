# ============================================================
# ERP COMPANY WIDE MBO SUBSYSTEM INHERITANCE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-885
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.subsystem_inheritance_rule
component: company-wide-mbo-subsystem-inheritance-rule


# RULE

company_wide_mbo inherits from EPM-side:
- enablement state
- review-cycle governance
- objective hierarchy semantics
- audit sensitivity baseline

company_wide_mbo may add deeper subsystem rules,
but should not contradict EPM framework rules.

