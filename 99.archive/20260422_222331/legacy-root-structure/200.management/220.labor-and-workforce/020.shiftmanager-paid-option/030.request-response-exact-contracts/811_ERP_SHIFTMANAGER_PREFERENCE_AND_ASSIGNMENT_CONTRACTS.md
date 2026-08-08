# ============================================================
# ERP SHIFTMANAGER PREFERENCE AND ASSIGNMENT CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-811
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.preference_and_assignment_contracts
component: shiftmanager-preference-and-assignment-contracts


# PREFERENCE SUBMIT REQUEST BODY

- shift_plan_id
- staff_profile_id
- available_slot_set_summary
- unavailable_slot_set_summary
- preferred_slot_set_summary


# ASSIGNMENT WRITE REQUEST BODY

- shift_plan_id
- staff_profile_id
- shift_date
- shift_slot_code
- assigned_start_at
- assigned_end_at


# RULE

Preference submission and planner assignment must remain
separate contracts.

Assignment confirmation / decline must be separate from
initial assignment creation.

