# ============================================================
# ERP APPROVAL FINAL VERIFICATION PLAN
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the final verification plan
for approval truth competition.

verification_targets:
- workflow.approval_request
- system.approval_request

main_question:
Which entry is the stronger final true approval authority?

verification_points:
- first insert target for approval submission
- status transition write target
- decision write target
- relation to governance, audit, notify, and public projection families
- whether one table is lifecycle truth while the other is orchestration support

possible outcomes:
- workflow.approval_request frozen as truth
- system.approval_request frozen as truth
- both remain non-frozen pending stronger write-path proof

conclusion:
Approval freeze promotion depends mainly on resolving
workflow-vs-system authority competition.
