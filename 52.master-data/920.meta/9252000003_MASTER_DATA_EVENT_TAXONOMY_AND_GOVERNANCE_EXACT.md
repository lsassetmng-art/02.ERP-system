# ============================================================
# MASTER DATA EVENT TAXONOMY AND GOVERNANCE EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data

purpose:
Define shared event taxonomy and governance states for master-data change,
publication, consumer acknowledgement, duplicate resolution, and data quality.

# ============================================================
# 1. MASTER CHANGE EVENTS
# ============================================================

master_change_events:
- MASTER_CHANGE_REQUEST_CREATED
- MASTER_CHANGE_REQUEST_SUBMITTED
- MASTER_CHANGE_VALIDATION_STARTED
- MASTER_CHANGE_VALIDATION_PASSED
- MASTER_CHANGE_VALIDATION_FAILED
- MASTER_CHANGE_APPROVAL_REQUESTED
- MASTER_CHANGE_APPROVED
- MASTER_CHANGE_REJECTED
- MASTER_CHANGE_RETURNED
- MASTER_CHANGE_APPLIED
- MASTER_CHANGE_CANCELLED
- MASTER_CHANGE_SUPERSEDED

ownership:
- owned by 52.master-data
- approval decision is owned by 50.approval when approval workflow is used
- source module may request or acknowledge, but does not own 52 apply event

# ============================================================
# 2. MASTER LIFECYCLE EVENTS
# ============================================================

master_lifecycle_events:
- MASTER_RECORD_CREATED
- MASTER_RECORD_UPDATED
- MASTER_RECORD_EFFECTIVE_DATED
- MASTER_RECORD_DEACTIVATED
- MASTER_RECORD_REACTIVATED
- MASTER_RECORD_DEPRECATED
- MASTER_RECORD_BLOCKED
- MASTER_VERSION_CREATED
- MASTER_VERSION_ACTIVATED
- MASTER_VERSION_SUPERSEDED
- MASTER_IDENTIFIER_ADDED
- MASTER_IDENTIFIER_EXPIRED
- MASTER_ALIAS_ADDED
- MASTER_CROSS_REFERENCE_ADDED
- MASTER_CROSS_REFERENCE_UPDATED

ownership:
- owned by 52.master-data

rules:
- lifecycle event does not directly mutate source transactions
- source modules consume lifecycle through publication package

# ============================================================
# 3. PUBLICATION EVENTS
# ============================================================

publication_events:
- MASTER_PUBLICATION_PACKAGE_CREATED
- MASTER_PUBLICATION_VALIDATED
- MASTER_PUBLICATION_PUBLISHED
- MASTER_PUBLICATION_FAILED
- MASTER_PUBLICATION_PARTIALLY_ACKNOWLEDGED
- MASTER_PUBLICATION_FULLY_ACKNOWLEDGED
- MASTER_PUBLICATION_SUPERSEDED

consumer_acknowledgement_events:
- MASTER_CONSUMER_ACK_PENDING
- MASTER_CONSUMER_ACKNOWLEDGED
- MASTER_CONSUMER_ACKNOWLEDGED_WITH_WARNING
- MASTER_CONSUMER_REJECTED
- MASTER_CONSUMER_HELD_FOR_REVIEW
- MASTER_CONSUMER_FAILED

ownership:
- publication events are owned by 52.master-data
- consumer acknowledgement is recorded in 52 but may be emitted by consumer module
- consumer module remains owner of its extension/transaction validation

# ============================================================
# 4. DUPLICATE / MERGE / SPLIT EVENTS
# ============================================================

duplicate_events:
- MASTER_DUPLICATE_CANDIDATE_DETECTED
- MASTER_DUPLICATE_REVIEW_STARTED
- MASTER_DUPLICATE_CONFIRMED
- MASTER_DUPLICATE_REJECTED
- MASTER_DUPLICATE_RESOLVED

merge_events:
- MASTER_MERGE_REQUEST_CREATED
- MASTER_MERGE_VALIDATION_STARTED
- MASTER_MERGE_APPROVAL_REQUESTED
- MASTER_MERGE_APPROVED
- MASTER_MERGE_APPLIED
- MASTER_MERGE_PUBLISHED
- MASTER_MERGE_REJECTED
- MASTER_MERGE_CANCELLED

split_events:
- MASTER_SPLIT_REQUEST_CREATED
- MASTER_SPLIT_VALIDATION_STARTED
- MASTER_SPLIT_APPROVAL_REQUESTED
- MASTER_SPLIT_APPROVED
- MASTER_SPLIT_APPLIED
- MASTER_SPLIT_PUBLISHED
- MASTER_SPLIT_REJECTED
- MASTER_SPLIT_CANCELLED

rules:
- merge/split must preserve historical mapping
- source modules must be notified through publication package
- BI must refresh through snapshot process
- closed source transactions must not be silently re-keyed

# ============================================================
# 5. DATA QUALITY EVENTS
# ============================================================

data_quality_events:
- MASTER_DQ_ISSUE_DETECTED
- MASTER_DQ_ISSUE_ASSIGNED
- MASTER_DQ_CHANGE_REQUEST_LINKED
- MASTER_DQ_SOURCE_EXTENSION_REVIEW_REQUESTED
- MASTER_DQ_CORRECTED
- MASTER_DQ_ACCEPTED_RISK
- MASTER_DQ_CLOSED
- MASTER_DQ_REOPENED
- MASTER_DQ_CANCELLED

rules:
- master-related DQ issue belongs to 52
- source extension issue belongs to source module but may be tracked by 52 reference
- audit finding may link to DQ issue but does not replace it

# ============================================================
# 6. GOVERNANCE STATES
# ============================================================

change_request_state:
- draft
- submitted
- validation_pending
- approval_pending
- approved
- rejected
- returned
- applied
- published
- cancelled
- superseded

master_record_state:
- draft
- active
- inactive
- pending_approval
- pending_publication
- deprecated
- merged
- split
- blocked
- cancelled
- superseded

publication_state:
- building
- validation_pending
- published
- partially_acknowledged
- fully_acknowledged
- failed
- cancelled
- superseded

duplicate_state:
- detected
- under_review
- confirmed_duplicate
- rejected_duplicate
- merge_requested
- resolved
- cancelled
- superseded

data_quality_state:
- open
- assigned
- in_progress
- change_requested
- corrected
- accepted_risk
- closed
- cancelled
- superseded

# ============================================================
# 7. APPROVAL / AUDIT / BI / COMMONOS GOVERNANCE BOUNDARY
# ============================================================

approval_boundary:
- 50.approval owns approval request/decision
- 52.master-data applies approved master change
- approval does not apply master change by itself

audit_boundary:
- 51.audit owns audit finding
- 52.master-data owns master correction workflow
- audit does not apply master change by itself

BI_boundary:
- 60.business-intelligence consumes master snapshots
- BI does not own master correction
- BI dimension refresh does not apply master change

CommonOS_boundary:
- CommonOS presents master governance UI
- CommonOS does not own master state
- CommonOS queue state is presentation only

# ============================================================
# 8. EVENT DECISION TEST
# ============================================================

decision_test:
- If the event changes shared master state, it is a 52 event.
- If the event approves change, it is a 50 event.
- If the event identifies finding, it is a 51 event.
- If the event validates module-specific extension, it is source module event.
- If the event refreshes analytical dimension, it is 60 event.
- If the event only renders a queue or form, it is CommonOS presentation.

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- master data event taxonomy fixed
- governance state taxonomy fixed
- publication and acknowledgement states fixed
- duplicate / merge / split events fixed
- DQ event boundary fixed

# ============================================================
