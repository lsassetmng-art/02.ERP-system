# ============================================================
# ERP CRM OPTION ENABLEMENT AWARE PAYLOAD RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-603
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.enablement_aware_payload_rule
component: crm-option-enablement-aware-payload-rule


# RULE

Payload interpretation must be enablement-aware.

If CRM option is not enabled:
- CRM object payloads must not be required
- core references remain sufficient for core flows

If CRM option is enabled:
- CRM objects become valid managed objects
- CRM-side authority, audit, and lifecycle rules apply


# DESIGN CONSEQUENCE

Do not design shared APIs or internal contracts as if
CRM payloads are always present.

Optional means structurally optional, not just hidden in UI.

