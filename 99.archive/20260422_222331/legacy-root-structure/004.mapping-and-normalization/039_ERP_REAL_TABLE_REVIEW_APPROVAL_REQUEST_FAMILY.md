# ============================================================
# ERP REAL TABLE REVIEW APPROVAL REQUEST FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first focused review for real tables in the approval_request family.

review_basis:
- erp_schema_table_column_full.txt

# ============================================================
# 1. OBSERVED SIGNALS
# ============================================================

observed_signals:
- audit.approval_request
- audit.approval_log
- audit.approval_notify_queue
- audit.approval_reason_template
- approval schema exists but also appears mixed with saas_* and stripe_* tables

main_observation:
Approval-related truth is not cleanly isolated in a purely approval-named schema.

# ============================================================
# 2. FIRST CANONICAL INTERPRETATION
# ============================================================

approval_request:
  likely_current_schema:
  - audit
  canonical_layer:
  - 200.management
  canonical_module:
  - 270.approval
  canonical_table_class:
  - source_of_truth or transitional
  confidence:
  - medium
  reason:
  - table name is strongly approval-semantic, but placement in audit is suspicious

approval_log:
  likely_current_schema:
  - audit
  canonical_layer:
  - 200.management or 000.platform depending actual columns
  canonical_module:
  - 270.approval or 090.audit
  canonical_table_class:
  - history or audit
  confidence:
  - low_to_medium
  reason:
  - could be approval-native history or generic audit evidence

approval_notify_queue:
  likely_current_schema:
  - audit
  canonical_layer:
  - 000.platform
  canonical_module:
  - workflow / notify-adjacent support
  canonical_table_class:
  - support
  confidence:
  - medium
  reason:
  - queue naming suggests delivery support, not approval truth itself

approval_reason_template:
  likely_current_schema:
  - audit
  canonical_layer:
  - 200.management
  canonical_module:
  - 270.approval
  canonical_table_class:
  - support or registry
  confidence:
  - medium
  reason:
  - template naming suggests approval-facing controlled explanation support

# ============================================================
# 3. PRIMARY WARNING
# ============================================================

primary_warning:
approval_request appearing in audit schema is a strong mixed-placement signal.

This means:
- the physical location is not enough to decide ownership
- approval semantic truth may be stored in audit schema for historical/legacy reasons
- final canonical ownership should still remain 200.management / 270.approval unless columns prove otherwise

# ============================================================
# 4. LIKELY CANONICAL POSITION
# ============================================================

likely_canonical_position:
- approval_request -> 200.management / 270.approval
- approval action / route / lane truth -> 200.management / 270.approval
- approval audit/history evidence -> 000.platform / 090.audit
- approval delivery queue -> platform support, not approval truth

# ============================================================
# 5. NEXT REQUIRED CHECK
# ============================================================

next_required_check:
Inspect actual columns for:
- state/status columns
- route/lane references
- actor/action timestamps
- audit-only metadata vs current approval truth
- queue delivery mechanics

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
The approval_request family is semantically approval-owned,
but physically appears mixed into audit-related placement.

This is one of the clearest candidates
for semantic-owner vs physical-schema separation.
