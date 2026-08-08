# ============================================================
# ERP PORTFOLIO VS MANAGEMENT AND TENANT GOVERNANCE BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3142
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.portfolio_vs_management_and_tenant_governance.boundary_rule
component: portfolio-vs-management-and-tenant-governance-boundary-rule


# RULE

Management owns:
- higher-order approval and enterprise policy truth

Portfolio and tenant governance owns:
- portfolio selection interpretation
- tenant override interpretation
- arbitration exception interpretation

# CONSEQUENCE

A tenant override case is not management policy truth.
An enterprise rollout policy profile may require management visibility,
but it does not replace management-owned truth.

