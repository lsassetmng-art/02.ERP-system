# ============================================================
# ERP AUDIT UNRESOLVED QUESTIONS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Lists the main unresolved architecture questions for audit design.

unresolved_questions:
- Is audit.approval_request only approval truth, or part of a broader audit truth model?
- Is audit.approval_log subordinate event history only, or a more general decision evidence stream?
- Is entity_status_history primarily audit, core-shared history, or both?
- Are exec_audit_event and audit_event the same layer or different layers?
- What belongs to audit export vs live audit query?
- Which audit objects are authoritative and which are derivative?

conclusion:
These questions should guide the first full audit architecture pass.
