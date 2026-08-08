# ============================================================
# ERP DEAD LETTER HANDLING EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2849
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.dead_letter_handling.exact_surface
component: dead-letter-handling-exact-surface


# SURFACE

dead_letter_entry

Canonical fields:
- dead_letter_entry_id
- company_id
- linked_handoff_id
- linked_event_id
- source_family
- target_family
- dead_letter_reason_code
- terminal_failure_summary_text
- moved_to_dead_letter_at
- manual_action_required_flag
- recovery_recommendation_code
- dead_letter_state_code
- created_at
- updated_at

