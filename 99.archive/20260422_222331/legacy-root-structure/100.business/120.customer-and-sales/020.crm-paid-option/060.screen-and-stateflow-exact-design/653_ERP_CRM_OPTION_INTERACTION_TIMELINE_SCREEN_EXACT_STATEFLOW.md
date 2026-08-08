# ============================================================
# ERP CRM OPTION INTERACTION TIMELINE SCREEN EXACT STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-653
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.interaction_timeline_screen.exact_stateflow
component: crm-option-interaction-timeline-screen-exact-stateflow


# PRIMARY STATES

- timeline_loading
- timeline_ready
- timeline_empty
- filter_updating
- create_ready
- create_submitting
- create_saved
- confidentiality_restricted_view
- permission_denied
- failed


# RULES

interaction_occurred_at and interaction_recorded_at
should be distinguishable in the timeline presentation.

Confidentiality restrictions may hide or summarize
certain entries rather than exposing full detail.

Interaction creation should allow linkage to inquiry
and ERP transaction reference without turning the screen
into an ERP transaction editor.

