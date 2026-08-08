# ============================================================
# ERP MASTER DATA / SOURCE MODULE BOUNDARY MEMO EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- 52.master-data
- all ERP source modules
- 50.approval
- 51.audit
- 60.business-intelligence
- 12.common-os

purpose:
Fix the upper boundary between cross-module master data, domain module
extensions, business transactions, approval, audit, BI, and presentation so
master identity and source business truth do not drift.

# ============================================================
# 1. CANONICAL PRINCIPLE
# ============================================================

core_principle:
- 52.master-data owns shared master identity, golden record, reference code,
  lifecycle, effective dating, and master governance where designated.
- Source modules own business transactions and module-specific domain truth.
- Domain modules may own module extensions to shared masters.
- Master-data does not own transaction truth.
- Transaction modules do not create competing cross-module master identity.
- BI consumes master snapshots; BI does not own master truth.
- Approval may approve master changes; approval does not own master truth.
- Audit may audit master controls; audit does not own master truth.
- CommonOS may present master UI; CommonOS does not own master meaning.

# ============================================================
# 2. MODULE POSITION
# ============================================================

## 2.1 52.master-data
canonical_role:
- shared master data / reference data / golden record governance truth

owns_truth:
- shared master identity
- golden record
- master lifecycle status
- effective-dated master attributes where common
- duplicate detection / merge / split lifecycle
- cross-module reference mapping
- common code sets
- common calendar / period reference
- currency / unit of measure / tax reference where common
- company / legal entity reference
- location / site / address reference where common
- item / product core reference where common
- business partner core reference where common
- customer / supplier core identity where common
- master publication package
- master change request lifecycle
- master data quality issue lifecycle

does_not_own:
- sales quote truth
- sales order truth
- invoice truth
- purchase order truth
- procurement sourcing truth
- inventory ledger truth
- warehouse task truth
- logistics delivery truth
- manufacturing execution truth
- product quality inspection result truth
- cost calculation truth
- accounting journal truth
- HR worker/employment assignment truth where HR-owned
- labor attendance truth
- payroll calculation truth
- audit finding truth
- approval decision truth
- BI dashboard projection truth

## 2.2 Source modules
canonical_role:
- domain extension / transaction / execution / close / calculation truth

source_module_rule:
- source modules may reference master_id
- source modules may maintain module-specific extensions
- source modules may request master changes
- source modules may not fork cross-module master identity without 52 workflow
- source modules must preserve master version/effective-date lineage where required

## 2.3 50.approval
relationship:
- may approve master create/update/merge/split/deactivate
- does not own master record itself

## 2.4 51.audit
relationship:
- may audit master controls and create findings
- does not directly mutate master records

## 2.5 60.business-intelligence
relationship:
- consumes master snapshots and dimensions
- does not own master truth

## 2.6 CommonOS
relationship:
- may render master list/detail/form/search/queue UI
- does not own master canon

# ============================================================
# 3. MASTER DATA OWNERSHIP MATRIX
# ============================================================

| master / concept | owner_module | source module extension owner examples | note |
|---|---|---|---|
| company / legal entity reference | 52.master-data | 30.accounting for accounting setup extension | shared enterprise identity |
| currency code | 52.master-data | 30.accounting for ledger usage | common reference |
| unit of measure | 52.master-data | 12.inventory / 15.manufacturing for conversion usage | common UOM truth |
| tax reference | 52.master-data or tax setup area if later split | 05.billing / 30.accounting for usage | common tax reference |
| calendar / fiscal period reference | 52.master-data / 30.accounting where close-specific | 16.production-planning / 42.payroll for usage | distinguish common vs module calendar |
| business partner core | 52.master-data | 03.crm / 10.purchase / 11.procurement / 05.billing | shared party identity |
| customer core identity | 52.master-data | 03.crm / 01.sales / 05.billing | customer relationship/commercial details stay domain-side |
| supplier core identity | 52.master-data | 10.purchase / 11.procurement | sourcing/PO truth stays domain-side |
| item / product core | 52.master-data | 12.inventory / 17.quality / 18.costing / 15.manufacturing | common item identity |
| location / site / address core | 52.master-data | 13.warehouse / 14.logistics / 40.human-resources | common location identity |
| warehouse reference core | 52.master-data or 13.warehouse depending final policy | 13.warehouse for operational layout/bin tasks | physical operation stays warehouse |
| employee / worker master | 40.human-resources | 41.labor-management / 42.payroll consume snapshots | HR owns worker truth |
| accounting chart / ledger setup | 30.accounting | 31.management-accounting consumes mappings | accounting canon stays 30 |
| approval route master | 50.approval | source modules request usage | approval canon stays 50 |
| audit category / finding taxonomy | 51.audit | source modules consume references | audit canon stays 51 |

rule:
- If a master is shared by many ERP modules and represents cross-module identity/reference,
  default owner is 52.master-data unless another module is explicitly designated.
- If a record represents business action, transaction, calculation, close, inspection,
  execution, or decision, owner remains source module.

# ============================================================
# 4. COMMON MASTER VS DOMAIN EXTENSION
# ============================================================

common_master_examples:
- business partner legal/common identity
- customer core ID
- supplier core ID
- item core ID
- company/legal entity ID
- common location/site ID
- currency/UOM/code set
- address reference
- common calendar reference

domain_extension_examples:
- CRM customer relationship status
- sales price/discount condition
- billing customer invoice preference
- supplier sourcing evaluation
- supplier PO commercial terms
- inventory item stocking policy
- warehouse bin/location operational layout
- logistics carrier service setup
- quality inspection specification
- costing cost component structure
- accounting posting setup
- payroll compensation calculation setup

rules:
- common identity belongs to 52
- domain extension belongs to relevant source module
- domain extension must reference common master ID where applicable
- domain extension must not duplicate common master identity as separate truth

# ============================================================
# 5. MASTER CHANGE TYPES
# ============================================================

master_change_types:
- create
- update
- effective_date_change
- deactivate
- reactivate
- merge
- split
- alias_add
- duplicate_mark
- duplicate_resolve
- reference_mapping_add
- reference_mapping_update
- publication
- rollback_or_correction

rules:
- material master changes must be versioned
- effective dates must be retained
- merge/split must preserve historical references
- source modules must not silently re-key historical transactions
- correction must be lineage-visible

# ============================================================
# 6. MASTER PUBLICATION RULE
# ============================================================

publication_rule:
- 52 publishes master snapshots or change events to source modules.
- Source modules consume master publication according to module policy.
- Source modules may reject or hold publication if module validation fails.
- Rejection does not change 52 master truth by itself.
- Correction requires 52 master workflow or source extension workflow depending on owner.

# ============================================================
# 7. MASTER REFERENCE RULE
# ============================================================

reference_rule:
- source records must store master_id and, where required, master_version_id/effective_date basis.
- historical transactions must remain explainable even if master changes later.
- master deactivation does not erase historical source transactions.
- merge/split must keep cross-reference history.

# ============================================================
# 8. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- source module creating separate customer/supplier/item identity outside 52 when shared identity applies
- 52 changing sales order / PO / invoice / stock ledger / payroll / accounting journal directly
- master merge rewriting historical transactions without lineage
- master deactivation deleting historical source records
- BI dimension correction treated as master correction
- approval decision treated as master update without 52 commit
- audit finding directly changing master record
- CommonOS form state treated as master truth
- source module extension overwriting common master identity fields without 52 workflow
- duplicate resolution performed only in BI report layer

# ============================================================
# 9. DECISION TEST
# ============================================================

decision_tests:
- If the object answers "what is the shared identity/reference used across modules?" -> 52.master-data
- If the object answers "what happened in a business transaction?" -> source module
- If the object answers "what module-specific policy/extension applies?" -> domain module
- If the object answers "who approved master change?" -> 50.approval
- If the object answers "what audit finding exists about master data?" -> 51.audit
- If the object answers "how should master data be visualized?" -> 60.business-intelligence / CommonOS presentation

# ============================================================
# 10. COMPLETION STATE
# ============================================================

completion_state:
- master-data / source module boundary fixed
- shared master identity vs domain extension separated
- master correction / publication / reference rules clarified
- approval / audit / BI / CommonOS boundaries preserved

# ============================================================
