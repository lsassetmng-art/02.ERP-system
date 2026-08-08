# ============================================================
# ERP INTERFACE CONTRACT OWNERSHIP REGISTRY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines the canonical registry format for ERP interface contracts and their semantic ownership.

goals:
- register interface contracts in one place
- separate structural interface placement from semantic ownership
- provide a standard registry for exact contracts
- support later API and table alignment

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Every exact contract should be registrable with:
- structural interface location
- semantic owner
- request/action/state/event ownership
- source-of-truth tables

structural_location_rule:
All contracts are structurally under interface discipline.

semantic_owner_rule:
Meaning remains with the true owner module.

# ============================================================
# 2. REQUIRED REGISTRY COLUMNS
# ============================================================

required_registry_columns:
- contract_id
- endpoint_name
- http_method
- path
- structural_layer
- structural_module
- semantic_owner_layer
- semantic_owner_module
- contract_category
- request_meaning_owner
- action_meaning_owner
- state_meaning_owner
- event_meaning_owner
- source_of_truth_tables
- supporting_tables
- canonical_status
- notes

canonical_status_values:
- canonical
- draft
- planned
- transitional
- deprecated_candidate

# ============================================================
# 3. CONTRACT CATEGORY VALUES
# ============================================================

contract_category_values:
- intake
- action
- query
- reporting
- analytics
- integration
- admin
- control

# ============================================================
# 4. REGISTRY EXAMPLES
# ============================================================

example_registry_rows:

- contract_id: INTAKE-PAYMENT-REQUEST
  endpoint_name: payment_request_intake
  http_method: POST
  path: /erp/intake/requests/payment-requests
  structural_layer: 000.platform
  structural_module: 095.interface
  semantic_owner_layer: 100.business
  semantic_owner_module: 150.finance
  contract_category: intake
  request_meaning_owner: business/finance
  action_meaning_owner: none_at_request_time
  state_meaning_owner: request_status + mapped document later
  event_meaning_owner: request_intake_event
  source_of_truth_tables: payment_request_header
  supporting_tables: request_envelope,audit_event
  canonical_status: draft

- contract_id: APPROVAL-APPROVE
  endpoint_name: approval_request_approve
  http_method: POST
  path: /erp/approvals/{approval_request_id}/approve
  structural_layer: 000.platform
  structural_module: 095.interface
  semantic_owner_layer: 200.management
  semantic_owner_module: 270.approval
  contract_category: action
  request_meaning_owner: approval action request payload
  action_meaning_owner: approval
  state_meaning_owner: approval_status
  event_meaning_owner: approval_event
  source_of_truth_tables: approval_request,approval_action
  supporting_tables: audit_event
  canonical_status: draft

- contract_id: QUERY-AR-DETAIL
  endpoint_name: accounts_receivable_detail_query
  http_method: GET
  path: /erp/accounting/receivables/{ar_id}
  structural_layer: 000.platform
  structural_module: 095.interface
  semantic_owner_layer: 100.business
  semantic_owner_module: 140.accounting
  contract_category: query
  request_meaning_owner: query intent only
  action_meaning_owner: none
  state_meaning_owner: accounting/balance_state
  event_meaning_owner: none
  source_of_truth_tables: accounts_receivable_ledger
  supporting_tables: settlement_line,invoice_header
  canonical_status: draft

# ============================================================
# 5. OWNERSHIP RULES
# ============================================================

ownership_rules:
- structural location is always interface-facing
- semantic owner must be declared explicitly
- no contract may omit source_of_truth_tables
- query contracts must still declare state meaning ownership
- action contracts must still declare state and event implications
- intake contracts must declare request and mapping semantics

# ============================================================
# 6. REQUEST / ACTION / STATE / EVENT REGISTRY RULE
# ============================================================

registry_semantics_rule:
Registry must not collapse request, action, state, and event into one generic status note.

must_be_explicit:
- request meaning
- action meaning
- state meaning
- event meaning

# ============================================================
# 7. SOURCE TABLE RULE
# ============================================================

source_table_rule:
Every contract must declare:
- primary source_of_truth_tables
- optional supporting_tables

rule:
Supporting tables never redefine source ownership.

# ============================================================
# 8. GOVERNANCE / APPROVAL SPECIAL RULE
# ============================================================

special_rule:
Approval and governance contracts must never be registered
as semantically owned by generic workflow alone.

examples:
- approve -> approval
- reject -> approval
- return -> approval
- reopen-request -> governance
- cancel-request -> governance

# ============================================================
# 9. ANALYTICS SPECIAL RULE
# ============================================================

analytics_rule:
Dashboard and forecast contracts must be registered
as analytically owned, not as transactional source-of-truth.

examples:
- control-tower query -> analytics/dashboard
- forecast generation -> analytics/forecast

# ============================================================
# 10. REGISTRY OUTPUT FORMAT
# ============================================================

recommended_registry_file_formats:
- markdown registry
- TSV export
- CSV export

recommended_primary_registry_artifacts:
- ERP_INTERFACE_CONTRACT_OWNERSHIP_REGISTRY.md
- ERP_INTERFACE_CONTRACT_OWNERSHIP_REGISTRY.tsv

# ============================================================
# 11. REVIEW RULE
# ============================================================

review_rule:
Before a contract is considered canonical,
its registry row should be reviewed for:
- semantic ownership correctness
- source table correctness
- request/action/state/event separation
- non-goal clarity

# ============================================================
# 12. FUTURE EXTENSIONS
# ============================================================

future_extensions:
- contract version registry
- consumer registry linkage
- interface deprecation registry
- contract-to-event emission registry
- contract-to-table mutation registry

# ============================================================
# 13. CONCLUSION
# ============================================================

conclusion:
ERP interface contracts require a formal ownership registry.

This registry separates:
- structural interface placement
from
- semantic ownership

It becomes the formal base for:
- exact contract governance
- API review
- source table alignment
- ownership clarity across ERP
