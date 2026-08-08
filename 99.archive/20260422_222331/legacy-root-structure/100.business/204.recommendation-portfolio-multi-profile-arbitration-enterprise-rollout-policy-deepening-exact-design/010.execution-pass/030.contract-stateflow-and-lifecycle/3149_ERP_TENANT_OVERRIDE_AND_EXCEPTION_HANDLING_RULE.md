# ============================================================
# ERP TENANT_OVERRIDE_AND_EXCEPTION_HANDLING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3149
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.tenant_override_and_exception_handling.rule
component: tenant-override-and-exception-handling-rule


# RULE

Tenant override and exception handling progression must preserve:
- linked enterprise policy visibility
- tenant reference visibility
- override reason visibility
- approval or rejection timing visibility
- expired and rejected trace when applicable

