# ============================================================
# ERP CRM OPTION ACCOUNT LIST SCREEN EXACT STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-650
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.account_list_screen.exact_stateflow
component: crm-option-account-list-screen-exact-stateflow


# PRIMARY STATES

- initial_loading
- ready_with_items
- ready_empty
- filter_updating
- pagination_loading
- option_disabled
- option_suspended
- permission_denied
- failed


# PRIMARY ACTIONS

- search
- filter
- sort
- paginate
- open_account_detail
- open_account_create


# RULES

If CRM option is disabled:
- screen resolves to option_disabled
- account create is not available

If CRM option is suspended:
- list read policy determines whether list is viewable
- create is unavailable

If user lacks read permission:
- permission_denied


# OUTPUT EXPECTATION

List row must expose exact quick fields only,
not collapse detail-only governance fields into the list.

