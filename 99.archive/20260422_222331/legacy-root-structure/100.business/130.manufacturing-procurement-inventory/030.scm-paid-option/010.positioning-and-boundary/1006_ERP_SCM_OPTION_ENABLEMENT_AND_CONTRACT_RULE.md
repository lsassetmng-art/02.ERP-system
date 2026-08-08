# ============================================================
# ERP SCM OPTION ENABLEMENT AND CONTRACT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1006
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.enablement_and_contract_rule
component: scm-option-enablement-and-contract-rule


# OPTION STATES

- not_enabled
- enabled_trial
- enabled_paid
- suspended
- archived


# RULE

SCM write flows and rich network read flows must be
enablement-aware.

When not_enabled:
- SCM object creation is unavailable
- SCM-rich lookups return option-disabled result

When suspended:
- network write flows are generally blocked
- read policy is controlled separately

