# ============================================================
# ERP CANONICAL STATE TRANSITION MATRIX
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines canonical allowed state transition patterns for key ERP state families.

goals:
- standardize allowed state transitions
- support workflow and mutation review
- prevent invalid cross-module state mutation

# ============================================================
# 1. DOCUMENT LIFECYCLE MATRIX
# ============================================================

document_lifecycle_transitions:
- draft -> submitted
- submitted -> withdrawn
- submitted -> finalized
- submitted -> returned_contextually
- returned -> submitted
- finalized -> cancelled_by_separate_controlled_path
- finalized -> archived
- withdrawn -> archived
- cancelled -> archived

notes:
- returned may be represented through approval status plus business rules
- cancelled after finalized requires controlled path

# ============================================================
# 2. APPROVAL STATE MATRIX
# ============================================================

approval_state_transitions:
- pending_creation -> under_approval
- under_approval -> approved
- under_approval -> rejected
- under_approval -> returned
- under_approval -> cancelled
- returned -> under_approval via resubmission/reapproval path if recreated/reopened by design

# ============================================================
# 3. GOVERNANCE REVIEW MATRIX
# ============================================================

governance_review_transitions:
- review_pending -> under_review
- under_review -> accepted
- under_review -> rejected
- review_pending -> withdrawn
- under_review -> withdrawn
- review_pending -> expired
- under_review -> expired

# ============================================================
# 4. EXECUTION STATUS MATRIX
# ============================================================

execution_status_transitions:
- queued -> running
- running -> succeeded
- running -> failed
- failed -> retry_waiting
- retry_waiting -> queued
- failed -> dead_lettered
- dead_lettered -> retry_waiting via controlled retry
- queued -> cancelled
- running -> cancelled only if supported by design

# ============================================================
# 5. ACCOUNTING RECORD MATRIX
# ============================================================

accounting_record_transitions:
- draft -> validated
- validated -> posted
- draft -> cancelled
- validated -> cancelled where allowed
- posted -> reversed

# ============================================================
# 6. SETTLEMENT MATRIX
# ============================================================

settlement_transitions:
- none -> applied
- none -> partially_applied
- applied -> reversed
- partially_applied -> reversed
- none -> cancelled in pre-authoritative paths if modeled

# ============================================================
# 7. PERIOD MATRIX
# ============================================================

period_transitions:
- open -> closed
- closed -> open only by controlled reopen path
- closed -> locked
- open -> locked where policy allows
- locked -> open only by stronger controlled path if ever allowed

# ============================================================
# 8. RULES
# ============================================================

rules:
- all transitions must be owned by the proper module
- gated actions do not transfer ownership
- invalid transitions require explicit prohibition
- transition matrix must distinguish direct transitions from controlled multi-step paths

# ============================================================
# 9. CONCLUSION
# ============================================================

conclusion:
ERP state transitions must be canonical, family-specific, and owner-controlled.

This document becomes the formal basis for:
- state machine design
- contract review
- mutation validation
