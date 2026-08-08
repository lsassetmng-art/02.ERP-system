# ============================================================
# ERP REAL TABLE MAPPING ACCOUNTING APPROVAL AUDIT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first-pass real-table-to-canonical-module mapping
for accounting, approval, and audit-oriented schemas.

# ============================================================
# 1. ACCOUNTING SCHEMA FIRST-PASS
# ============================================================

schema_name:
- accounting

canonical_layer:
- 100.business

canonical_primary_module:
- 140.accounting

likely_table_families:
- accounts_receivable
- accounts_payable
- journal
- settlement
- accounting_period
- reconciliation
- matching
- posting_batch

first_pass_mapping_examples:

  accounts_receivable_*:
    canonical_module:
    - 140.accounting
    canonical_table_class:
    - source_of_truth
    confidence:
    - high

  accounts_payable_*:
    canonical_module:
    - 140.accounting
    canonical_table_class:
    - source_of_truth
    confidence:
    - high

  journal_*:
    canonical_module:
    - 140.accounting
    canonical_table_class:
    - source_of_truth
    confidence:
    - high

  settlement_*:
    canonical_module:
    - 140.accounting
    canonical_table_class:
    - source_of_truth
    confidence:
    - high

  accounting_period*:
    canonical_module:
    - 140.accounting
    canonical_table_class:
    - source_of_truth
    confidence:
    - high

  reconciliation_*:
    canonical_module:
    - 140.accounting
    canonical_table_class:
    - support or source_of_truth depending table role
    confidence:
    - medium

  matching_*:
    canonical_module:
    - 140.accounting
    canonical_table_class:
    - support or source_of_truth depending table role
    confidence:
    - medium

notes:
- accounting schema is one of the clearest semantic fits to canonical ownership
- governance-gated reopen/close does not transfer accounting ownership

# ============================================================
# 2. APPROVAL SCHEMA FIRST-PASS
# ============================================================

schema_name:
- approval

canonical_layer:
- 200.management

canonical_primary_module:
- 270.approval

likely_table_families:
- approval_request
- approval_action
- approval_route
- approval_lane
- approval_actor_resolution
- delegation_rule

first_pass_mapping_examples:

  approval_request*:
    canonical_module:
    - 270.approval
    canonical_table_class:
    - source_of_truth
    confidence:
    - high

  approval_action*:
    canonical_module:
    - 270.approval
    canonical_table_class:
    - source_of_truth
    confidence:
    - high

  approval_route*:
    canonical_module:
    - 270.approval
    canonical_table_class:
    - source_of_truth
    confidence:
    - high

  approval_lane*:
    canonical_module:
    - 270.approval
    canonical_table_class:
    - source_of_truth
    confidence:
    - high

  approval_actor_resolution*:
    canonical_module:
    - 270.approval
    canonical_table_class:
    - bridge or source_of_truth depending table role
    confidence:
    - medium

  delegation_rule*:
    canonical_module:
    - 270.approval
    canonical_table_class:
    - source_of_truth or support depending table role
    confidence:
    - medium

notes:
- approval schema is strongly aligned with management/approval meaning
- workflow integration does not make approval tables workflow-owned

# ============================================================
# 3. AUDIT SCHEMA FIRST-PASS
# ============================================================

schema_name:
- audit

canonical_layer:
- 000.platform

canonical_primary_module:
- 090.audit

likely_table_families:
- audit_event
- audit_trace
- audit_snapshot
- action_audit
- state_transition_audit
- execution_audit
- accounting_audit

first_pass_mapping_examples:

  audit_event*:
    canonical_module:
    - 090.audit
    canonical_table_class:
    - audit
    confidence:
    - high

  audit_trace*:
    canonical_module:
    - 090.audit
    canonical_table_class:
    - audit
    confidence:
    - high

  audit_snapshot*:
    canonical_module:
    - 090.audit
    canonical_table_class:
    - audit
    confidence:
    - high

  action_audit*:
    canonical_module:
    - 090.audit
    canonical_table_class:
    - audit
    confidence:
    - high

  state_transition_audit*:
    canonical_module:
    - 090.audit
    canonical_table_class:
    - audit
    confidence:
    - high

  execution_audit*:
    canonical_module:
    - 090.audit
    canonical_table_class:
    - audit
    confidence:
    - high

  accounting_audit*:
    canonical_module:
    - 090.audit
    canonical_table_class:
    - audit
    confidence:
    - high

notes:
- audit is structurally platform-owned
- semantic cross-cutting nature does not change structural ownership

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
The strongest first-pass mappings are:
- accounting -> 100.business / 140.accounting
- approval -> 200.management / 270.approval
- audit -> 000.platform / 090.audit

These should be treated as the first stable anchors
for deeper real-table mapping work.
