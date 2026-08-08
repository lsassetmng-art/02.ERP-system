# ============================================================
# REMEDIATION TRACKING SUBMODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 51.audit / 06.remediation-tracking

entities:
- remediation_master
- remediation_action_plan
- remediation_followup_review
- remediation_due_event
- remediation_closure

status_canon:
- open
- in_progress
- overdue
- followup_review
- closed
- reopened

invariant:
- remediation remains source-finding-referenced
- reopen remains historically visible
