# ============================================================
# ERP INTERFACE CONTRACT TO TABLE MUTATION REGISTRY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines the canonical registry format that links interface contracts
to the tables they are allowed to mutate.

goals:
- connect contracts to mutation scope
- prevent hidden cross-module mutation
- support API review against table ownership
- make mutation scope explicit and reviewable

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Every mutating interface contract should declare
which source-of-truth tables it may mutate directly
and which tables it may only affect indirectly.

# ============================================================
# 2. REQUIRED REGISTRY COLUMNS
# ============================================================

required_registry_columns:
- contract_id
- endpoint_name
- http_method
- path
- semantic_owner_layer
- semantic_owner_module
- direct_mutation_tables
- indirect_effect_tables
- read_support_tables
- mutation_scope_note
- gated_by
- canonical_status
- notes

# ============================================================
# 3. DIRECT VS INDIRECT RULE
# ============================================================

direct_mutation_rule:
A direct mutation table is changed in the formal action scope.

indirect_effect_rule:
An indirect effect table may change later due to downstream workflow,
event handling, or separate owned actions.

examples:
- approve:
  direct_mutation_tables:
  - approval_request
  - approval_action
  indirect_effect_tables:
  - business document may progress later

- create_settlement:
  direct_mutation_tables:
  - settlement_header
  - settlement_line
  indirect_effect_tables:
  - AR/AP balances may be affected
  - analytics projections may refresh later

# ============================================================
# 4. GATING RULE
# ============================================================

gating_rule:
Registry must declare whether mutation is gated by:
- approval
- governance
- permission
- workflow prerequisites
- accounting close/open constraints

# ============================================================
# 5. QUERY CONTRACT RULE
# ============================================================

query_contract_rule:
Pure query contracts should declare no direct mutation tables.

allowed_value:
- direct_mutation_tables: none

# ============================================================
# 6. REGISTRY EXAMPLES
# ============================================================

example_rows:

- contract_id: APPROVAL-APPROVE
  endpoint_name: approval_request_approve
  http_method: POST
  path: /erp/approvals/{approval_request_id}/approve
  semantic_owner_layer: 200.management
  semantic_owner_module: 270.approval
  direct_mutation_tables: approval_request,approval_action
  indirect_effect_tables: document_header
  read_support_tables: actor_role_assignment,audit_event
  mutation_scope_note: approval truth only in direct scope
  gated_by: permission
  canonical_status: draft

- contract_id: ACCOUNTING-SETTLEMENT-CREATE
  endpoint_name: create_settlement
  http_method: POST
  path: /erp/accounting/settlements
  semantic_owner_layer: 100.business
  semantic_owner_module: 140.accounting
  direct_mutation_tables: settlement_header,settlement_line
  indirect_effect_tables: accounts_receivable_ledger,accounts_payable_ledger,dashboard_projection
  read_support_tables: journal_header,audit_event
  mutation_scope_note: settlement direct, other effects may follow separately
  gated_by: permission
  canonical_status: draft

- contract_id: GOVERNANCE-REOPEN-REQUEST
  endpoint_name: reopen_request_submit
  http_method: POST
  path: /erp/accounting/periods/{period_id}/reopen-request
  semantic_owner_layer: 200.management
  semantic_owner_module: 260.governance
  direct_mutation_tables: reopen_request
  indirect_effect_tables: accounting_period
  read_support_tables: audit_event,governance_policy
  mutation_scope_note: direct governance request only, period stays unchanged initially
  gated_by: permission
  canonical_status: draft

# ============================================================
# 7. INVALID PATTERNS
# ============================================================

invalid_patterns:
- query contract mutating business truth
- approval contract mutating journal_status directly
- analytics contract mutating source transaction tables
- governance request submission directly mutating final business cancelled/open state without declared separate step

# ============================================================
# 8. REVIEW RULE
# ============================================================

review_rule:
Before a contract becomes canonical, verify:
- direct mutation tables match semantic owner
- indirect effects are clearly separated
- no foreign truth is mutated without formal owner control
- gating is explicit where needed

# ============================================================
# 9. CONSEQUENCES
# ============================================================

consequences:
This registry should later support:
- API review
- schema review
- permission review
- mutation authority validation
- dump normalization review

# ============================================================
# 10. CONCLUSION
# ============================================================

conclusion:
ERP mutating contracts must explicitly declare their direct mutation scope.

Key rules:
- direct mutation must follow source-of-truth ownership
- indirect effects must be declared separately
- query contracts mutate nothing
- hidden mutation scope is invalid

This document becomes the formal basis for:
- API-to-table review
- mutation scope governance
- ownership validation
