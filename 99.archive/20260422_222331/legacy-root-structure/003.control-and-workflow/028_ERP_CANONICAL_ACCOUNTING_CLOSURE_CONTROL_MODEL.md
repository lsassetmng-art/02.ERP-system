# ============================================================
# ERP CANONICAL ACCOUNTING CLOSURE CONTROL MODEL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines the canonical model for accounting period closure and controlled reopening.

goals:
- define close/reopen control model
- separate accounting ownership from governance gating
- standardize closure control semantics
- support period APIs and tables

# ============================================================
# 1. CORE MODEL
# ============================================================

core_model:
Accounting owns accounting period truth.
Governance may gate high-risk reopen/override behavior.
Approval may participate where required by policy.

# ============================================================
# 2. PERIOD STATE RULE
# ============================================================

period_state_values:
- open
- closed
- locked

meanings:
- open: normal allowed accounting operations
- closed: normal period operations restricted
- locked: stronger restriction than closed

# ============================================================
# 3. CLOSE ACTION RULE
# ============================================================

close_action_rule:
close_period is an accounting action owned by accounting.

may_require:
- prerequisite validation
- governance policy checks
- approval policy if configured

close_does_not_mean:
- all reporting complete forever
- no later governance exception possible

# ============================================================
# 4. REOPEN REQUEST RULE
# ============================================================

reopen_request_rule:
reopen_request is governance request truth,
not direct accounting period mutation.

possible_flow:
- request submitted
- governance review
- governance accepted/rejected
- if accepted and scope allows, accounting action reopen_period may occur

# ============================================================
# 5. REOPEN ACTION RULE
# ============================================================

reopen_action_rule:
reopen_period is an accounting-owned mutation action,
but may be gated by governance acceptance.

rule:
Governance acceptance does not transfer accounting ownership.

# ============================================================
# 6. BLOCKER RULE
# ============================================================

closure_blocker_rule:
Close eligibility may depend on blocker checks.

examples:
- unposted journal blockers
- unresolved reconciliation blockers
- pending controlled items
- policy blockers

rule:
Blockers are accounting/control inputs,
not replacement states.

# ============================================================
# 7. GOVERNANCE INTEGRATION RULE
# ============================================================

governance_integration_rule:
Governance may:
- require review
- require reason codes
- require approval references
- block or allow reopen path

Governance does not:
- own accounting period truth
- directly rewrite period state without accounting-owned action

# ============================================================
# 8. APPROVAL INTEGRATION RULE
# ============================================================

approval_integration_rule:
Approval may be part of closure or reopen governance policy,
but approval truth remains approval-owned.

# ============================================================
# 9. CANONICAL TABLE PATTERNS
# ============================================================

canonical_table_patterns:
- accounting_period
- period_close_blocker
- reopen_request
- governance_decision_record
- period_action_history
- accounting_audit

# ============================================================
# 10. API CONSEQUENCES
# ============================================================

api_rules:
- close endpoint should declare accounting ownership
- reopen-request endpoint should declare governance request meaning
- resulting_period_status must be explicit
- accepted_for_review must not imply reopened
- blocked conditions must be explicit

# ============================================================
# 11. VALIDATION RULES
# ============================================================

validation_rules:
- period state family must remain explicit
- reopen request and reopen action must not be collapsed
- accounting ownership and governance gating must both be visible in design
- blockers must be reviewable and explainable

# ============================================================
# 12. CONCLUSION
# ============================================================

conclusion:
ERP accounting closure control requires:
- accounting-owned period truth
- governance-gated exceptions where needed
- explicit separation of close action, reopen request, and reopen action

This document becomes the formal basis for:
- accounting period APIs
- close/reopen control tables
- closure governance design
