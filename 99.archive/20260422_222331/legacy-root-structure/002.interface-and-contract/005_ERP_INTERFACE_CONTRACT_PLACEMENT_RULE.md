# ============================================================
# ERP INTERFACE CONTRACT PLACEMENT RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines the formal placement rule for ERP interface contracts.

goals:
- define where interface contracts belong
- separate interface from source-of-truth ownership
- define how request/response contracts relate to layers and modules
- prevent interface contracts from absorbing business, management, or analytics truth

official_layers:
- 000.platform
- 100.business
- 200.management
- 300.analytics

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Interface contracts belong structurally to platform/interface,
while semantic ownership belongs to the actual owning module.

meaning:
- interface placement = where the contract is documented and managed
- semantic ownership = which module truly owns the meaning behind the contract

principle:
A contract must never be placed according to UI convenience alone.
A contract must be placed according to formal boundary responsibility.

# ============================================================
# 2. OFFICIAL PLACEMENT
# ============================================================

official_contract_layer:
- 000.platform/095.interface

official_meaning_rule:
Contracts are structurally placed under interface,
but each contract must clearly declare:
- owning layer
- owning module
- request meaning owner
- action meaning owner
- state meaning owner
- event meaning owner

example:
A settlement API contract is documented under interface,
but its semantic ownership remains 100.business/140.accounting.

# ============================================================
# 3. WHY CONTRACTS BELONG TO INTERFACE
# ============================================================

interface_belongs_here_because:
- API and connector boundaries are platform concerns
- request/response contracts are formal boundaries
- internal/external callers need one consistent contract surface
- boundary stability should be separated from domain storage details

interface_must_not_become:
- business truth owner
- approval truth owner
- governance truth owner
- dashboard truth owner

summary:
interface owns the boundary,
not the underlying truth.

# ============================================================
# 4. CONTRACT DECLARATION RULE
# ============================================================

every_contract_must_declare:
- endpoint_name
- path
- method
- owning_layer
- owning_module
- category
- request_meaning_owner
- action_meaning_owner
- state_meaning_owner
- event_meaning_owner
- source_of_truth_tables
- non_goals

declaration_principle:
A contract is not complete unless its ownership is explicit.

example_fields:
- owning_layer: 100.business
- owning_module: 140.accounting
- request_meaning_owner: business/accounting
- action_meaning_owner: business/accounting
- state_meaning_owner: business/accounting
- event_meaning_owner: business/accounting
- interface_location: 000.platform/095.interface

# ============================================================
# 5. CONTRACT TYPE PLACEMENT RULE
# ============================================================

## 5.1 Intake contracts

structural_placement:
- 000.platform/095.interface

semantic_ownership:
- the module that owns the intake meaning

examples:
- expense claim intake -> 100.business
- payment request intake -> 100.business/150.finance or relevant business module
- invoice generation intake -> 100.business/110.sales or 140.accounting depending meaning
- cancel request intake -> 200.management/260.governance if control-led

rule:
Intake contracts are documented under interface,
but their meaning owner must be explicit.

## 5.2 Action contracts

structural_placement:
- 000.platform/095.interface

semantic_ownership:
- action meaning owner

examples:
- submit -> 100.business
- withdraw -> 100.business
- resubmit -> 100.business
- approve -> 200.management/270.approval
- reject -> 200.management/270.approval
- return -> 200.management/270.approval
- retry -> platform runtime-related concept, mainly platform/event/workflow
- close -> 100.business/140.accounting with governance checks
- reopen-request -> 200.management/260.governance

rule:
Action contracts must not be placed under business or management folders
as contract surfaces;
they are interface contracts with declared semantic ownership.

## 5.3 Query contracts

structural_placement:
- 000.platform/095.interface

semantic_ownership:
- current-state or view owner

examples:
- receivable detail -> 100.business/140.accounting
- approval detail -> 200.management/270.approval
- dashboard control tower -> 300.analytics/330.dashboard
- periods list -> 100.business/140.accounting
- journals list -> 100.business/140.accounting

rule:
Queries are still interface contracts,
even when they read directly from business or analytics truth.

## 5.4 Reporting and analytics contracts

structural_placement:
- 000.platform/095.interface

semantic_ownership:
- management/reporting or analytics module depending meaning

examples:
- formal management report export -> 200.management/290.reporting
- dashboard widget feed -> 300.analytics/330.dashboard
- forecast result query -> 300.analytics/340.forecast

# ============================================================
# 6. REQUEST / ACTION / STATE / EVENT DECLARATION RULE
# ============================================================

for_every_contract:
- request meaning must be explicit
- action meaning must be explicit
- resulting state meaning must be explicit
- resulting event meaning must be explicit or explicitly absent

examples:

submit_contract:
- request meaning: ask ERP to submit a business document
- action meaning: submit action
- resulting state meaning: submitted
- event meaning: document_submitted

approve_contract:
- request meaning: ask ERP to accept approve action
- action meaning: approve
- resulting state meaning: approved / under control-specific semantics
- event meaning: approval_approved

dashboard_query_contract:
- request meaning: ask for dashboard summary
- action meaning: none
- resulting state meaning: none
- event meaning: none

rule:
A contract must not hide semantic ownership inside vague response wording.

# ============================================================
# 7. CONTRACT TO TABLE RELATION RULE
# ============================================================

contract_to_table_rule:
A contract may touch multiple tables,
but must clearly identify which tables are:
- source-of-truth tables
- supporting tables
- derived tables
- audit tables
- projection tables

example:
settlement_create_contract:
- source_of_truth_tables:
  - settlement_header
  - settlement_line
- supporting_tables:
  - AR/AP ledger
- audit_tables:
  - audit_event

rule:
Interface placement does not redefine table ownership.

# ============================================================
# 8. CONTRACT NAMING RULE
# ============================================================

contract_naming_principles:
- use business-meaning names
- avoid implementation-only naming
- avoid UI-specific naming
- distinguish request vs action vs query clearly

good_examples:
- /erp/intake/requests/payment-requests
- /erp/approvals/{approval_request_id}/approve
- /erp/accounting/settlements
- /erp/accounting/receivables/{ar_id}
- /erp/dashboard/control-tower

avoid:
- /doSubmit
- /approveNow
- /getAccountingThing
- /dashboardData2

# ============================================================
# 9. VERSIONING RULE
# ============================================================

versioning_principle:
Contract versioning belongs to interface discipline,
not to business table version naming.

rules:
- version changes must be tracked at interface level
- semantic breaking changes must be explicit
- table migrations do not automatically require public contract changes
- public contract changes do not justify hidden meaning changes

# ============================================================
# 10. INTERNAL / EXTERNAL CONTRACT RULE
# ============================================================

contract_scope_rule:
Interface may expose:
- external public contracts
- internal ERP contracts
- bridge contracts
- app-facing contracts

all_must_follow:
- same ownership declaration discipline
- same request/action/state/event clarity
- same non-goal declaration discipline

examples:
- external API contract
- internal service boundary contract
- connector bridge contract
- app-facing request contract

# ============================================================
# 11. NON-GOAL RULE
# ============================================================

every_contract_must_define_non_goals:
because contracts are often misunderstood
as implying more than they truly guarantee.

examples:
- accepted_for_processing does not mean finalized
- action_accepted does not mean downstream complete
- mapped_document_id does not mean approval complete
- listed in dashboard does not mean source-of-truth equality
- returned response does not mean caller has mutation authority

# ============================================================
# 12. CONFLICT RESOLUTION RULE
# ============================================================

when_contract_placement_is_unclear:
- first ask what the contract means
- then ask which module owns that meaning
- then place the contract structurally under interface
- then declare the owning module explicitly

tie_breakers:
- if it is a shared boundary contract -> interface
- if meaning is transactional -> business owner declared
- if meaning is approval/control -> management owner declared
- if meaning is aggregate/visual -> analytics owner declared

special_cases:
- approval endpoints stay in interface structurally, approval semantically
- governance request endpoints stay in interface structurally, governance semantically
- accounting close endpoints stay in interface structurally, accounting/governance semantically
- dashboard endpoints stay in interface structurally, analytics semantically

# ============================================================
# 13. DOCUMENT CONSEQUENCES
# ============================================================

this_rule_implies:
- exact contract documents should be grouped under interface discipline
- semantic ownership must still point back to real modules
- API files must not silently absorb business architecture
- business design and contract design must remain connected but not collapsed

recommended_follow_up:
- create interface contract index
- create contract ownership registry
- map each contract to owning layer/module
- map each contract to source-of-truth tables

# ============================================================
# 14. FOLLOW-UP DOCUMENTS
# ============================================================

next_documents:
- ERP_MODULE_TO_TABLE_MAPPING
- ERP_CANONICAL_STATE_MODEL
- ERP_CANONICAL_EVENT_MODEL
- ERP_INTERFACE_CONTRACT_OWNERSHIP_REGISTRY

# ============================================================
# 15. CONCLUSION
# ============================================================

conclusion:
ERP interface contracts are structurally owned by 000.platform/095.interface,
but semantically owned by the actual business, management, or analytics module.

This separation is mandatory because:
- interface owns the boundary
- modules own the meaning
- tables own the truth
- analytics owns derived visibility, not transaction truth

This document becomes the formal basis
for placing and documenting exact API contracts correctly.
