# ============================================================
# ERP SFA PAID OPTION EXACT PAYLOAD CANONICAL SCOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2367
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sfa_paid_option_exact_payload.canonical_scope
component: sfa-paid-option-exact-payload-canonical-scope


# IN SCOPE

- sales_lead
- sales_opportunity
- opportunity_stage_progression
- sales_forecast_case
- next_action_task
- CRM linkage visibility
- sales-core conversion visibility
- management approval visibility

# OUT OF SCOPE FOR THIS PASS

- CRM account and contact foundation internals
- sales-core quote / order truth
- UI implementation source code

