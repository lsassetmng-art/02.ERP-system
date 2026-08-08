# ============================================================
# ERP WMS OPTION ENABLEMENT AND CONTRACT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-966
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.wms_option.enablement_and_contract_rule
component: wms-option-enablement-and-contract-rule


# OPTION STATES

- not_enabled
- enabled_trial
- enabled_paid
- suspended
- archived


# RULE

WMS write flows and rich warehouse read flows must be
enablement-aware.

When not_enabled:
- WMS object creation is unavailable
- WMS-rich lookups return option-disabled result

When suspended:
- warehouse execution writes are generally blocked
- read policy is controlled separately

