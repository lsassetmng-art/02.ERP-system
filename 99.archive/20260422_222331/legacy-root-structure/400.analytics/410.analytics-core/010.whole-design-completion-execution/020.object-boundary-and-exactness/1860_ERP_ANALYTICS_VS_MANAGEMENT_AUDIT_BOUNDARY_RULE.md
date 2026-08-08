# ============================================================
# ERP ANALYTICS VS MANAGEMENT_AUDIT_BOUNDARY_RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1860
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.analytics_vs_management_audit.boundary_rule
component: analytics-vs-management-audit-boundary-rule


# RULE

Management core owns decision and directive truth.
Audit core owns assurance and conclusion truth.

Analytics core owns:
- analytical model truth
- view and insight truth
- scenario truth

# CONSEQUENCE

Management and audit may consume analytics visibility,
but they do not replace analytics-owned derived modeling truth.

