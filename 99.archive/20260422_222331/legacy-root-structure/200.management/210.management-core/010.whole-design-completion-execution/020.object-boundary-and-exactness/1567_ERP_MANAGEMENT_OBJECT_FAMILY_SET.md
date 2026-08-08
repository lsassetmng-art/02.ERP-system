# ============================================================
# ERP MANAGEMENT OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1567
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management.object_family_set
component: management-object-family-set


# PRIMARY OBJECT FAMILIES

- management_review_cycle
- management_decision_record
- management_escalation_case
- management_action_directive
- management_watchlist_entry

# RULE

Review cycle is not decision record.
Decision record is not escalation case.
Escalation case is not action directive.
Action directive is not watchlist entry.

