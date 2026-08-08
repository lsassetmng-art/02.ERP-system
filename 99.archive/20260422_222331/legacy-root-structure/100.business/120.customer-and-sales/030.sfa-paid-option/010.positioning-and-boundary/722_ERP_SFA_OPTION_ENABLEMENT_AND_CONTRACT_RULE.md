# ============================================================
# ERP SFA OPTION ENABLEMENT AND CONTRACT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-722
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.enablement_and_contract_rule
component: sfa-option-enablement-and-contract-rule


# OPTION STATES

- not_enabled
- enabled_trial
- enabled_paid
- suspended
- archived


# RULE

SFA write flows and rich read flows must be
enablement-aware.

When not_enabled:
- SFA object creation is unavailable
- SFA-rich lookups return option-disabled result

When suspended:
- write flows are generally blocked
- read policy is controlled separately

