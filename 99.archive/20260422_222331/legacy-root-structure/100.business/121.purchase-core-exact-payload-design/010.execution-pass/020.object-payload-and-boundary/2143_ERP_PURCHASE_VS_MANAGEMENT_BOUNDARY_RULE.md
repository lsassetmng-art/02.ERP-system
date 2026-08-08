# ============================================================
# ERP PURCHASE VS MANAGEMENT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2143
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.purchase_vs_management.boundary_rule
component: purchase-vs-management-boundary-rule


# RULE

Purchase owns:
- request / order / intake truth

Management owns:
- approval truth
- review truth
- escalation truth

# CONSEQUENCE

Approval visibility may constrain purchase progression,
but management does not replace purchase-owned sourcing truth.

