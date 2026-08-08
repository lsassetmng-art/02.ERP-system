# ============================================================
# ERP GOVERNANCE TO AUDIT EPM HANDOFF RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1618
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.governance_to_audit_epm.handoff_rule
component: governance-to-audit-epm-handoff-rule


# RULE

Governance/control may hand off:
- control status visibility to audit
- override and signoff visibility to audit
- control maturity visibility to EPM
- control gap visibility to management reporting

# CONSEQUENCE

Downstream modules create their own new truths.

Governance handoff does not itself equal:
- audit conclusion truth
- KPI structure truth

