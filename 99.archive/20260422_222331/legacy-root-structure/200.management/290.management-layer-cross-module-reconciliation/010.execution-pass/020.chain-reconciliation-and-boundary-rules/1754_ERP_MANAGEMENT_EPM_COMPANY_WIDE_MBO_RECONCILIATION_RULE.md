# ============================================================
# ERP MANAGEMENT EPM COMPANY WIDE MBO RECONCILIATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1754
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management_epm_company_wide_mbo.reconciliation_rule
component: management-epm-company-wide-mbo-reconciliation-rule


# RULE

Management core owns:
- review and decision truth

EPM owns:
- target architecture truth
- KPI truth
- scorecard truth
- variance truth

company_wide_mbo subsystem owns:
- inherited objective rollout truth
- assignment and progress review truth

# CONSEQUENCE

The chain must preserve:
- management-created oversight context
- epm-created target architecture truth
- company_wide_mbo-created inherited-operation truth

