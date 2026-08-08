# ============================================================
# ERP LABORMANAGER VS MANAGEMENT GOVERNANCE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1646
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.labormanager_vs_management_governance.boundary_rule
component: labormanager-vs-management-governance-boundary-rule


# RULE

Management core owns review / decision / directive truth.
Governance/control owns policy / requirement / override truth.

LaborManager owns:
- attendance truth
- leave truth
- staff lifecycle truth
- labor compliance case truth

# CONSEQUENCE

Management and governance may review or constrain labor operations,
but they do not replace LaborManager-owned labor truth.

