# ============================================================
# ERP SHIFTMANAGER OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-802
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.object_family_set
component: shiftmanager-object-family-set


# PRIMARY OBJECT FAMILIES

- shift_template
- shift_plan
- shift_preference_submission
- shift_assignment
- shift_swap_request
- shift_publication_batch


# RULE

Template is not plan.
Preference submission is not assignment.
Assignment is not swap request.
Publication batch is not the plan itself.

