# ============================================================
# ERP ATTENDANCE LEAVE LIFECYCLE COMPLIANCE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1653
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.attendance_leave_lifecycle_compliance.rule
component: attendance-leave-lifecycle-compliance-rule


# RULE

Attendance, leave, employment lifecycle, and compliance semantics must remain distinct.

Representative distinctions:
- attendance exception is not leave request
- approved leave is not lifecycle change
- lifecycle change is not compliance case
- compliance resolution is not audit conclusion

# CONSEQUENCE

Every labor exception-class or lifecycle-class action must preserve:
- original labor object reference
- reason
- actor
- timestamp
- downstream visibility

