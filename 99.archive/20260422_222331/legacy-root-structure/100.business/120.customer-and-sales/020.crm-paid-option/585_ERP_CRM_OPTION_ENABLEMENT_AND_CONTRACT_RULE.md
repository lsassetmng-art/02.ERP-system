# ============================================================
# ERP CRM OPTION ENABLEMENT AND CONTRACT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-585
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.enablement_and_contract_rule
component: crm-option-enablement-and-contract-rule


# RULE

CRM must be enableable per contracted organization or plan.

Recommended capability states:

- not_enabled
- enabled_trial
- enabled_paid
- suspended
- archived


# INTERPRETATION

When CRM is not enabled:
- core ERP remains usable
- only minimum customer reference is assumed

When CRM is enabled:
- rich customer-management functions are available
- CRM-side permissions and audit rules apply


# CONSTRAINTS

Do not create hidden mandatory dependencies from
core transaction flows into CRM-only objects.

