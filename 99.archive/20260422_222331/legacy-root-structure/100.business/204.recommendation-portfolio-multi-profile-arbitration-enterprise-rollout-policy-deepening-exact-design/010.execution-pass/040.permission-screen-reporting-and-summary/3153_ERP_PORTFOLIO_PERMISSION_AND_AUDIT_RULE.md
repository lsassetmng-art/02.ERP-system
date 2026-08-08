# ============================================================
# ERP PORTFOLIO PERMISSION AND AUDIT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3153
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.portfolio.permission_and_audit.rule
component: portfolio-permission-and-audit-rule


# RECOMMENDED CAPABILITY FAMILIES

- portfolio_read
- portfolio_profile_manage
- portfolio_arbitration_manage
- enterprise_rollout_policy_manage
- tenant_override_manage
- portfolio_export
- portfolio_audit_read
- portfolio_override

# RULE

Tenant override manage does not imply override.
Arbitration manage does not imply export.
Read does not imply portfolio profile manage.

