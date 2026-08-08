# ============================================================
# ERP CRM OPTION CONTACT SCREEN EXACT STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-652
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.contact_screen.exact_stateflow
component: crm-option-contact-screen-exact-stateflow


# PRIMARY FLOWS

account detail
-> contact list section
-> contact create
-> contact update
-> contact archive


# CONTACT SCREEN STATES

- list_loading
- list_ready
- list_empty
- create_ready
- create_submitting
- update_ready
- update_submitting
- archived_read_only
- permission_denied
- failed


# RULES

Contact create requires valid parent account context.

Contact archive is a separate governed action.

Contact merge, if later supported, should not be hidden in contact edit.


# UX INTERPRETATION

Contact role flags and exact role code should both remain visible
when role interpretation matters.

