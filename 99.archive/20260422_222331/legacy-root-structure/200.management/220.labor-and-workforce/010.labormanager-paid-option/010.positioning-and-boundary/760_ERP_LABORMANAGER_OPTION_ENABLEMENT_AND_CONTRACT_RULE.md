# ============================================================
# ERP LABORMANAGER OPTION ENABLEMENT AND CONTRACT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-760
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.enablement_and_contract_rule
component: labormanager-option-enablement-and-contract-rule


# OPTION STATES

- not_enabled
- enabled_trial
- enabled_paid
- suspended
- archived


# RULE

LaborManager write flows and rich read flows must be
enablement-aware.

When not_enabled:
- labor-rich object creation is unavailable
- labor-rich lookups return option-disabled result

When suspended:
- write flows are generally blocked
- read policy is controlled separately

