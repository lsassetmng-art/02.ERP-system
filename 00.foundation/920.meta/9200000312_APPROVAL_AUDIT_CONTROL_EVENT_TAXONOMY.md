# ============================================================
# ERP APPROVAL / AUDIT / CONTROL EVENT TAXONOMY
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- 50.approval
- 51.audit
- all ERP source modules

purpose:
Provide a shared event taxonomy for approval, audit, control, remediation,
and source correction flows without transferring ownership between modules.

# ============================================================
# 1. APPROVAL EVENTS
# ============================================================

approval_events:
- APPROVAL_REQUEST_CREATED
- APPROVAL_REQUEST_SUBMITTED
- APPROVAL_ROUTE_ASSIGNED
- APPROVAL_STEP_STARTED
- APPROVAL_STEP_APPROVED
- APPROVAL_STEP_REJECTED
- APPROVAL_STEP_RETURNED
- APPROVAL_STEP_ESCALATED
- APPROVAL_STEP_DELEGATED
- APPROVAL_REQUEST_APPROVED
- APPROVAL_REQUEST_REJECTED
- APPROVAL_REQUEST_RETURNED
- APPROVAL_REQUEST_CANCELLED
- APPROVAL_REQUEST_EXPIRED
- APPROVAL_OUTCOME_SENT_TO_SOURCE
- APPROVAL_OUTCOME_REJECTED_AS_STALE_BY_SOURCE
- APPROVAL_OUTCOME_APPLIED_BY_SOURCE

ownership:
- approval events are owned by 50.approval
- source applied event acknowledgement references source module result

# ============================================================
# 2. AUDIT EVENTS
# ============================================================

audit_events:
- AUDIT_PLAN_CREATED
- AUDIT_PLAN_APPROVED
- AUDIT_STARTED
- AUDIT_EVIDENCE_COLLECTED
- AUDIT_EVIDENCE_REVIEWED
- AUDIT_FINDING_DRAFTED
- AUDIT_FINDING_ISSUED
- AUDIT_MANAGEMENT_RESPONSE_REQUESTED
- AUDIT_MANAGEMENT_RESPONSE_SUBMITTED
- AUDIT_REMEDIATION_REQUIRED
- AUDIT_CLOSURE_REVIEW_STARTED
- AUDIT_FINDING_CLOSED
- AUDIT_FINDING_REOPENED
- AUDIT_REPORT_PUBLISHED

ownership:
- audit events are owned by 51.audit
- source business corrections are not audit events; they are source module events referenced by audit

# ============================================================
# 3. REMEDIATION EVENTS
# ============================================================

remediation_events:
- REMEDIATION_ACTION_CREATED
- REMEDIATION_ACTION_ASSIGNED
- REMEDIATION_ACTION_STARTED
- REMEDIATION_ACTION_OVERDUE
- REMEDIATION_SOURCE_CORRECTION_REQUESTED
- REMEDIATION_SOURCE_CORRECTION_ACCEPTED
- REMEDIATION_SOURCE_CORRECTION_REJECTED
- REMEDIATION_SOURCE_CORRECTION_COMPLETED
- REMEDIATION_EVIDENCE_SUBMITTED
- REMEDIATION_FOLLOWUP_REVIEW_STARTED
- REMEDIATION_ACTION_CLOSED
- REMEDIATION_ACTION_REOPENED
- REMEDIATION_ACTION_CANCELLED

ownership:
- remediation lifecycle events are owned by 51.audit/06.remediation-tracking
- actual source correction events are owned by source modules

# ============================================================
# 4. SOURCE MODULE CONTROL EVENTS
# ============================================================

source_control_events:
- SOURCE_ACTION_APPROVAL_REQUIRED
- SOURCE_ACTION_SUBMITTED_FOR_APPROVAL
- SOURCE_ACTION_APPROVAL_RECEIVED
- SOURCE_ACTION_REVALIDATED_AFTER_APPROVAL
- SOURCE_ACTION_COMMITTED_AFTER_APPROVAL
- SOURCE_ACTION_REJECTED_AFTER_APPROVAL
- SOURCE_ACTION_CANCELLED
- SOURCE_CORRECTION_REQUEST_RECEIVED_FROM_AUDIT
- SOURCE_CORRECTION_ACCEPTED
- SOURCE_CORRECTION_REJECTED
- SOURCE_CORRECTION_COMPLETED
- SOURCE_CORRECTION_EVIDENCE_RETURNED_TO_AUDIT

ownership:
- source control events are owned by the relevant source module
- approval/audit may reference these events but do not own them

# ============================================================
# 5. CONTROL SEVERITY / PRIORITY
# ============================================================

control_severity:
- informational
- low
- medium
- high
- critical

remediation_priority:
- low
- normal
- high
- urgent
- executive_attention

approval_priority:
- low
- normal
- high
- urgent

rules:
- severity belongs to audit finding where finding-related
- priority belongs to route/task/request where workflow-related
- source module may have its own operational severity; do not conflate without mapping

# ============================================================
# 6. STATE TRANSITION RULES
# ============================================================

approval_state_rule:
- approval approved does not equal source committed
- approval rejected blocks proposed source action
- stale approval must be revalidated or superseded

audit_state_rule:
- finding issued does not equal source corrected
- remediation closed does not erase finding
- audit closure does not equal source correction unless source correction evidence exists

source_state_rule:
- source correction must be recorded in source module
- source correction result may satisfy remediation evidence
- source module must preserve approval/audit references where applicable

BI_state_rule:
- BI snapshot/dashboard state is projection only
- BI refresh does not approve, audit-close, remediate, or correct source records

CommonOS_state_rule:
- CommonOS queue state is presentation only
- CommonOS does not own approval/audit/source state

# ============================================================
# 7. COMPLETION STATE
# ============================================================

completion_state:
- approval/audit/remediation/source event taxonomy fixed
- event ownership clarified
- state-transition confusion reduced

# ============================================================
