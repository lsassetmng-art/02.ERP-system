# ============================================================
# COMPANY / LEGAL ENTITY / ORGANIZATION REFERENCE
# MASTER CATALOG EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data
track: Track D
related_modules:
- 30.accounting
- 31.management-accounting
- 33.fixed-assets
- 34.cash-management
- 40.human-resources
- 41.labor-management
- 42.payroll
- 50.approval
- 51.audit
- 60.business-intelligence

purpose:
Define exact shared reference catalogs for company, legal entity, organization,
department, cost center reference, and common organizational hierarchy without
absorbing accounting, HR, payroll, approval, audit, or management accounting
domain truth.

canonical_role:
- shared company / legal entity / organization reference identity truth

# ============================================================
# 1. CORE MASTER CATALOGS
# ============================================================

core_catalogs:
- company_reference_master
- legal_entity_reference_master
- organization_unit_reference_master
- department_reference_master
- position_reference_catalog
- cost_center_reference_master
- profit_center_reference_master
- organization_hierarchy
- organization_identifier
- organization_usage_assignment

# ============================================================
# 2. COMPANY REFERENCE MASTER
# ============================================================

object_name:
- company_reference_master

meaning:
- shared company reference used across ERP modules.

required_fields:
- company_id
- company_code
- company_name
- company_type
- primary_legal_entity_id_or_null
- company_status
- effective_from
- effective_to_or_null
- current_master_version_id
- lineage_reference

company_type_examples:
- operating_company
- holding_company
- internal_company
- branch_reference
- business_unit_group
- virtual_company_scope

allowed_company_status:
- draft
- active
- inactive
- closed
- merged
- split
- deprecated
- cancelled
- superseded

rules:
- company reference identity belongs to 52
- statutory ledger setup belongs to 30.accounting
- company common rules outside ERP may be handled by governance design if needed
- company closure does not delete historical transactions

# ============================================================
# 3. LEGAL ENTITY REFERENCE MASTER
# ============================================================

object_name:
- legal_entity_reference_master

meaning:
- shared legal entity reference for accounting, tax, contracts, payroll,
  billing, purchase, and statutory reporting contexts.

required_fields:
- legal_entity_id
- company_id
- legal_entity_code
- legal_entity_name
- legal_entity_type
- country_or_region_code
- registration_identifier_reference_or_null
- tax_identifier_reference_or_null
- primary_address_reference_or_null
- legal_entity_status
- effective_from
- effective_to_or_null
- current_master_version_id
- lineage_reference

legal_entity_type_examples:
- corporation
- branch
- subsidiary
- sole_proprietor_reference
- public_institution
- internal_legal_unit

allowed_legal_entity_status:
- draft
- active
- inactive
- dissolved
- merged
- split
- deprecated
- cancelled
- superseded

rules:
- legal entity identity belongs to 52
- chart of accounts / ledger / posting rules belong to 30.accounting
- payroll statutory handling belongs to 42.payroll/30.accounting as source modules
- tax accounting detail belongs to 30/accounting-related design
- master change must preserve legal lineage

# ============================================================
# 4. ORGANIZATION UNIT REFERENCE MASTER
# ============================================================

object_name:
- organization_unit_reference_master

meaning:
- shared organization unit reference used by HR, approval, accounting,
  management accounting, payroll, labor, audit, and BI.

required_fields:
- organization_unit_id
- company_id
- organization_unit_code
- organization_unit_name
- organization_unit_type
- parent_organization_unit_id_or_null
- legal_entity_id_or_null
- organization_status
- effective_from
- effective_to_or_null
- current_master_version_id
- lineage_reference

organization_unit_type_examples:
- division
- department
- section
- team
- store
- plant
- warehouse_org
- project_org
- shared_service
- virtual_org

allowed_organization_status:
- draft
- active
- inactive
- closed
- reorganized
- merged
- split
- cancelled
- superseded

rules:
- organization reference identity belongs to 52 when shared
- HR assignment belongs to 40.human-resources
- approval route usage belongs to 50.approval
- accounting/MA mappings belong to 30/31
- labor shift assignment belongs to 41
- payroll calculation belongs to 42

# ============================================================
# 5. DEPARTMENT REFERENCE MASTER
# ============================================================

object_name:
- department_reference_master

meaning:
- shared department reference, normally an organization-unit specialization.

required_fields:
- department_id
- company_id
- organization_unit_id
- department_code
- department_name
- department_type
- department_status
- effective_from
- effective_to_or_null
- lineage_reference

department_type_examples:
- sales
- procurement
- manufacturing
- warehouse
- logistics
- quality
- finance
- HR
- IT
- store
- restaurant
- project
- shared_service

rules:
- department reference belongs to 52 when common
- department manager assignment belongs to 40.human-resources
- department task/approval policy belongs to relevant source modules
- department cost allocation belongs to 31.management-accounting

# ============================================================
# 6. POSITION REFERENCE CATALOG
# ============================================================

object_name:
- position_reference_catalog

meaning:
- shared position/job reference used by HR and approval/labor/payroll.

required_fields:
- position_id
- company_id
- position_code
- position_name
- position_type
- organization_unit_id_or_null
- position_status
- effective_from
- effective_to_or_null
- lineage_reference

position_type_examples:
- executive
- manager
- leader
- worker
- specialist
- operator
- clerk
- contractor_position
- temporary_position

rules:
- position reference belongs to 52 or HR depending final ownership.
- In this ERP design, shared position reference may be cataloged in 52,
  but worker assignment to position belongs to 40.human-resources.
- payroll amount calculation belongs to 42.payroll.
- approval authority assignment belongs to 50.approval or source policy.

# ============================================================
# 7. COST CENTER / PROFIT CENTER REFERENCE
# ============================================================

object_name:
- cost_center_reference_master

required_fields:
- cost_center_id
- company_id
- cost_center_code
- cost_center_name
- responsible_organization_unit_id_or_null
- legal_entity_id_or_null
- cost_center_status
- effective_from
- effective_to_or_null
- lineage_reference

object_name:
- profit_center_reference_master

required_fields:
- profit_center_id
- company_id
- profit_center_code
- profit_center_name
- responsible_organization_unit_id_or_null
- legal_entity_id_or_null
- profit_center_status
- effective_from
- effective_to_or_null
- lineage_reference

rules:
- shared cost/profit center reference identity may be cataloged in 52
- accounting usage/posting mapping belongs to 30.accounting
- management allocation/interpretion belongs to 31.management-accounting
- source transactions may reference cost/profit centers but do not own common identity

# ============================================================
# 8. ORGANIZATION HIERARCHY
# ============================================================

object_name:
- organization_hierarchy

required_fields:
- organization_hierarchy_id
- company_id
- hierarchy_type
- parent_organization_unit_id
- child_organization_unit_id
- effective_from
- effective_to_or_null
- hierarchy_status
- lineage_reference

hierarchy_type_examples:
- legal
- managerial
- HR
- accounting
- management_accounting
- approval
- audit
- store_operation
- project
- reporting

rules:
- shared hierarchy belongs to 52 when cross-module
- accounting-specific hierarchy may be 30/31 extension
- HR-specific assignment remains 40
- approval-specific route hierarchy remains 50
- audit scope hierarchy remains 51

# ============================================================
# 9. ORGANIZATION IDENTIFIER
# ============================================================

object_name:
- organization_identifier

required_fields:
- organization_identifier_id
- organization_reference_type
- organization_reference_id
- identifier_type
- identifier_value
- issuing_context_or_null
- primary_flag
- effective_from
- effective_to_or_null
- identifier_status
- lineage_reference

identifier_type_examples:
- internal_org_code
- legal_registration_code
- tax_registration_code
- cost_center_code
- profit_center_code
- legacy_department_code
- external_system_org_id

rules:
- identifiers preserve mapping lineage
- legacy org code must not replace organization_unit_id as shared identity
- duplicate identifier conflict must create data quality issue

# ============================================================
# 10. ORGANIZATION USAGE ASSIGNMENT
# ============================================================

object_name:
- organization_usage_assignment

meaning:
- mapping from shared organization references to module usage.

required_fields:
- organization_usage_assignment_id
- company_id
- organization_reference_type
- organization_reference_id
- usage_module
- usage_type
- usage_status
- effective_from
- effective_to_or_null
- lineage_reference

usage_module_examples:
- 30.accounting
- 31.management-accounting
- 40.human-resources
- 41.labor-management
- 42.payroll
- 50.approval
- 51.audit
- 60.business-intelligence

usage_type_examples:
- posting_dimension
- cost_allocation_dimension
- employee_assignment
- shift_assignment
- payroll_costing_dimension
- approval_route_dimension
- audit_scope_dimension
- BI_dimension

rules:
- usage assignment is reference mapping
- usage module owns usage policy/operation
- 52 does not own accounting posting, HR assignment, payroll, approval, or audit decisions

# ============================================================
# 11. SOURCE MODULE EXTENSION MAP
# ============================================================

source_extension_map:
- 30.accounting:
  - ledger
  - chart_of_accounts
  - accounting_period
  - posting_dimension_mapping
- 31.management-accounting:
  - responsibility_center
  - allocation_rule
  - managerial_hierarchy
- 40.human-resources:
  - worker_master
  - employment_contract_basis
  - organization_assignment
  - position_assignment
  - manager_assignment
- 41.labor-management:
  - shift_assignment
  - attendance_record
  - work_location_assignment
- 42.payroll:
  - payroll_group
  - payroll_costing_dimension_usage
  - payroll_calculation
- 50.approval:
  - approval_route_definition
  - approval_actor_assignment
- 51.audit:
  - audit_scope
  - audit_finding
  - remediation_action
- 60.business-intelligence:
  - organization_dimension_snapshot

rules:
- source extensions reference company/legal entity/org/cost center IDs
- source extensions do not redefine shared reference identity

# ============================================================
# 12. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- HR assignment changing shared organization identity directly
- accounting posting creating legal entity master
- approval route creating department master
- payroll calculation changing cost center identity
- audit finding changing organization hierarchy directly
- management accounting allocation rewriting legal entity reference
- org merge deleting historical worker/payroll/journal records
- BI organization dimension edit replacing 52 master correction

# ============================================================
# 13. COMPLETION STATE
# ============================================================

completion_state:
- company/legal entity/organization reference catalog fixed
- department/position/cost center/profit center references fixed
- organization hierarchy and usage assignment fixed
- source extension map fixed

# ============================================================
