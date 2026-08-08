# ============================================================
# ERP INCIDENT GOVERNANCE PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2929
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.incident_governance.permission_and_audit.rule
component: incident-governance-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- incident_governance_read
- incident_triage_manage
- incident_operator_assign_manage
- incident_escalation_manage
- incident_slo_review_manage
- incident_suppression_override_manage
- incident_postincident_review_manage
- incident_governance_export
- incident_governance_audit_read
- incident_governance_override

# RULE

Escalation manage does not imply override.
SLO review manage does not imply export.
Read does not imply suppression override manage.

