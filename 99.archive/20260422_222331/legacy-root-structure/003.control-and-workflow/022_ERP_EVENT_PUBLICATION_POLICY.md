# ============================================================
# ERP EVENT PUBLICATION POLICY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines how ERP events may be published internally or externally.

goals:
- define publication visibility classes
- separate existence of events from visibility of events
- control event exposure across boundaries
- support security and interface governance

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Not every canonical event must be published to every consumer.

policy_principle:
- event existence
- event registration
- event dispatch
- event exposure
are separate concerns.

# ============================================================
# 2. VISIBILITY CLASSES
# ============================================================

visibility_classes:
- internal_only
- module_internal
- ERP_internal
- app_facing
- external_facing

meanings:

  internal_only:
    meaning: visible only to infrastructure/runtime internals

  module_internal:
    meaning: visible within owner module and tightly related system internals

  ERP_internal:
    meaning: visible across ERP modules internally

  app_facing:
    meaning: may be exposed to authorized ERP-connected apps

  external_facing:
    meaning: may be exposed outside ERP under explicit policy

# ============================================================
# 3. DEFAULT RULES
# ============================================================

default_rules:
- audit support events default to internal_only
- execution events default to ERP_internal
- approval events default to ERP_internal or app_facing depending need
- governance events default to ERP_internal
- accounting events default to ERP_internal
- analytics events may be app_facing when safe
- external_facing requires explicit approval

# ============================================================
# 4. PUBLICATION MODES
# ============================================================

publication_modes:
- sync
- async
- internal_only
- mixed

meanings:
- sync: publication occurs in same user-visible transactional scope where designed
- async: publication occurs after commit or deferred processing
- internal_only: publication not exposed beyond internal runtime
- mixed: some internal sync signal plus later async publication

# ============================================================
# 5. PUBLICATION DECISION RULE
# ============================================================

publication_decision_rule:
When deciding event publication, evaluate:
- semantic sensitivity
- security impact
- privacy impact
- operational usefulness
- business need
- consumer trust boundary
- risk of misinterpretation

# ============================================================
# 6. NEVER-ASSUME RULE
# ============================================================

never_assume_rule:
Publication does not imply full semantic permission.

examples:
- seeing dashboard_refreshed does not grant dashboard mutation authority
- seeing approval_approved does not grant approval action authority
- seeing settlement_applied does not grant settlement reversal authority

# ============================================================
# 7. SENSITIVE EVENT RULE
# ============================================================

sensitive_event_rule:
Events involving high-risk governance, security, compliance, risk,
or sensitive finance details should default to restricted visibility.

examples:
- high_risk_operation_allowed
- governance_request_rejected
- security_incident_logged
- compliance_violation_recorded

# ============================================================
# 8. APP-FACING RULE
# ============================================================

app_facing_rule:
App-facing events should be limited to what apps need to reflect workflow
without leaking hidden control semantics unnecessarily.

examples:
- document_submitted may be app_facing
- approval_requested may be app_facing selectively
- internal scheduler retry bookkeeping should not be app_facing

# ============================================================
# 9. EXTERNAL-FACING RULE
# ============================================================

external_facing_rule:
External-facing publication requires explicit governance and interface review.

requirements:
- clear consumer justification
- field minimization
- no hidden control leakage
- no source-of-truth ambiguity
- security approval if needed

# ============================================================
# 10. CONTRACT CONSEQUENCES
# ============================================================

contract_consequences:
Exact contracts should declare, where relevant:
- emitted_events
- publication_mode
- visibility_class
- whether publication is guaranteed or best-effort

# ============================================================
# 11. VALIDATION RULES
# ============================================================

validation_rules:
- every canonical event should have a visibility class
- sensitive events should default to restrictive classes
- public exposure requires explicit review
- async publication must not be described as guaranteed sync delivery unless true

# ============================================================
# 12. CONCLUSION
# ============================================================

conclusion:
ERP event publication is policy-controlled and visibility-scoped.

Key rules:
- event existence is separate from visibility
- publication mode must be explicit
- external/public exposure requires stronger review
- publication never changes source-of-truth ownership
