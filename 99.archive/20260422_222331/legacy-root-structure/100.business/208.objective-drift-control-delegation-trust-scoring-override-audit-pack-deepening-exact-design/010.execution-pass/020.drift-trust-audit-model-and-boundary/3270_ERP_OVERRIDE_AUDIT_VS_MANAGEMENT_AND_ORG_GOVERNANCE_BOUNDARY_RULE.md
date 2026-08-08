# ============================================================
# ERP OVERRIDE AUDIT VS MANAGEMENT AND ORG GOVERNANCE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3270
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.override_audit_vs_management_and_org_governance.boundary_rule
component: override-audit-vs-management-and-org-governance-boundary-rule


# RULE

Org governance owns:
- org exception interpretation
- org decision interpretation

Management owns:
- higher-order approval and policy truth

Override audit owns:
- audit pack completeness interpretation
- audit risk interpretation
- audit close interpretation

# CONSEQUENCE

An override audit summary is not management policy truth.
An audit pack may require org-governance visibility,
but it does not replace management-owned or org-governance-owned truth.

