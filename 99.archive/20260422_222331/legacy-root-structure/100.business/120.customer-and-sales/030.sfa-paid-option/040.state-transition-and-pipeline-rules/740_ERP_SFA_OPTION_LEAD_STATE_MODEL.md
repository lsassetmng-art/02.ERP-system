# ============================================================
# ERP SFA OPTION LEAD STATE MODEL
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-740
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.lead_state.model
component: sfa-option-lead-state-model


# RECOMMENDED STATUS SET

- new
- contacted
- qualified
- disqualified
- converted_to_opportunity
- archived


# ALLOWED TRANSITIONS

- new -> contacted
- contacted -> qualified
- contacted -> disqualified
- qualified -> converted_to_opportunity
- disqualified -> archived
- converted_to_opportunity -> archived


# PROHIBITIONS

- converted_to_opportunity -> qualified
- archived -> new
- qualified -> new without controlled reset rule

