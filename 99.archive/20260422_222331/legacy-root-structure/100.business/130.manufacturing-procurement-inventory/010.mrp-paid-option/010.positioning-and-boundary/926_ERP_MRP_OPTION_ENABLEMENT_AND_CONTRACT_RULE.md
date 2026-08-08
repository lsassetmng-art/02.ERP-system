# ============================================================
# ERP MRP OPTION ENABLEMENT AND CONTRACT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-926
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_option.enablement_and_contract_rule
component: mrp-option-enablement-and-contract-rule


# OPTION STATES

- not_enabled
- enabled_trial
- enabled_paid
- suspended
- archived


# RULE

MRP write flows and rich planning read flows must be
enablement-aware.

When not_enabled:
- MRP object creation is unavailable
- MRP-rich lookups return option-disabled result

When suspended:
- planning write flows are generally blocked
- read policy is controlled separately

