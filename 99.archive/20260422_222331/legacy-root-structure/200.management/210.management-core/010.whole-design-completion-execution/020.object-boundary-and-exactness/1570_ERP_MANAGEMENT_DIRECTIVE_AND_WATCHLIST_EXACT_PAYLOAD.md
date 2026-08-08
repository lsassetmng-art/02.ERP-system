# ============================================================
# ERP MANAGEMENT DIRECTIVE AND WATCHLIST EXACT PAYLOAD
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1570
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management.directive_and_watchlist.exact_payload
component: management-directive-and-watchlist-exact-payload


# OBJECT 1

management_action_directive

Canonical payload:
- object_id
- company_id
- object_type = management_action_directive
- status
- directive_code
- directive_status_code
- directive_type_code
- linked_decision_record_id
- assigned_role_code
- due_at
- created_at
- created_by
- updated_at
- updated_by


# OBJECT 2

management_watchlist_entry

Canonical payload:
- object_id
- company_id
- object_type = management_watchlist_entry
- status
- watchlist_entry_code
- watchlist_status_code
- watchlist_category_code
- linked_source_module_code
- linked_source_object_reference_code
- watch_reason_code
- created_at
- created_by
- updated_at
- updated_by

