# ============================================================
# ERP CRM OPTION EXPORT PERMISSION AND CONTRACT REFLECTION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-701
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.export_permission_and_contract_reflection
component: crm-option-export-permission-and-contract-reflection


# RULE

Export must require explicit export capability,
not merely read capability.


# REQUIRED CONTRACT REFLECTION

Export-triggering response or action state should reflect:

- export_requested_flag
- export_permission_granted_flag
- export_scope_summary
- export_result_code
- audit_context where applicable


# CONSTRAINTS

Do not allow confidentiality-restricted data export
by default just because on-screen read is permitted.

