# ============================================================
# ERP LABORMANAGER VS AUDIT BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1647
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager_vs_audit.boundary_rule
component: labormanager-vs-audit-boundary-rule


# RULE

LaborManager owns labor operation and compliance-case truth.

Audit owns:
- audit conclusion truth
- audit opinion truth
- audit finding closure truth

# CONSEQUENCE

Labor visibility may feed audit work,
but it does not replace audit-owned conclusion truth.

