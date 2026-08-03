# ============================================================
# BUSINESS PARTNER / CUSTOMER / SUPPLIER / CONTACT
# MASTER CATALOG EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data
track: Track D
related_modules:
- 03.crm
- 02.sfa
- 01.sales
- 04.order-management
- 05.billing
- 10.purchase
- 11.procurement
- 30.accounting
- 34.cash-management
- 60.business-intelligence

purpose:
Define exact shared master catalogs for business partner, customer, supplier,
and contact/person references without absorbing CRM, SFA, Sales, Purchase,
Billing, or Accounting source truth.

canonical_role:
- shared business partner / customer / supplier / contact identity truth

# ============================================================
# 1. CORE MASTER CATALOGS
# ============================================================

core_catalogs:
- business_partner_core_master
- customer_core_master
- supplier_core_master
- contact_person_reference_master
- business_partner_identifier
- business_partner_role_assignment
- business_partner_address_reference
- business_partner_contact_point_reference
- customer_supplier_cross_role_reference
- partner_merge_split_lineage

# ============================================================
# 2. BUSINESS PARTNER CORE MASTER
# ============================================================

object_name:
- business_partner_core_master

meaning:
- shared identity for a party that may become customer, supplier, payer,
  payee, contact organization, or other ERP business partner.

required_fields:
- business_partner_id
- company_scope_or_global_scope
- partner_code
- partner_name
- partner_type
- legal_name_or_null
- display_name_or_null
- country_or_region_reference_or_null
- primary_address_reference_or_null
- primary_contact_point_reference_or_null
- tax_identifier_reference_or_null
- registration_identifier_reference_or_null
- partner_status
- current_master_version_id
- effective_from
- effective_to_or_null
- created_at
- created_by
- updated_at
- updated_by
- lineage_reference

partner_type_examples:
- organization
- individual
- group
- public_institution
- internal_company
- unknown_pending_review

allowed_partner_status:
- draft
- active
- inactive
- blocked
- pending_review
- duplicate_candidate
- merged
- split
- deprecated
- cancelled
- superseded

rules:
- business partner core belongs to 52.master-data
- CRM account profile is CRM extension, not business partner core
- supplier qualification is procurement extension, not business partner core
- invoice/payment status is not business partner core
- partner code changes require version/lineage preservation

# ============================================================
# 3. CUSTOMER CORE MASTER
# ============================================================

object_name:
- customer_core_master

meaning:
- shared customer identity and customer role reference for ERP modules.

required_fields:
- customer_id
- business_partner_id
- company_id
- customer_code
- customer_name
- customer_status
- customer_role_type
- bill_to_reference_or_null
- ship_to_reference_or_null
- payer_reference_or_null
- default_currency_code_or_null
- default_tax_reference_or_null
- current_master_version_id
- effective_from
- effective_to_or_null
- lineage_reference

customer_role_type_examples:
- sold_to
- bill_to
- ship_to
- payer
- end_customer
- prospect_customer
- internal_customer

allowed_customer_status:
- draft
- active
- inactive
- blocked
- credit_blocked_reference_only
- merged
- deprecated
- cancelled
- superseded

rules:
- customer core identity belongs to 52
- CRM relationship status belongs to 03.crm
- sales quote belongs to 01.sales
- accepted order belongs to 04.order-management
- invoice belongs to 05.billing
- AR accounting entry belongs to 30.accounting
- credit status may be extension/policy outside core depending future design

# ============================================================
# 4. SUPPLIER CORE MASTER
# ============================================================

object_name:
- supplier_core_master

meaning:
- shared supplier identity and supplier role reference for procurement,
  purchase, receiving, quality, accounting, and cash.

required_fields:
- supplier_id
- business_partner_id
- company_id
- supplier_code
- supplier_name
- supplier_status
- supplier_role_type
- remit_to_reference_or_null
- ordering_address_reference_or_null
- default_currency_code_or_null
- default_tax_reference_or_null
- current_master_version_id
- effective_from
- effective_to_or_null
- lineage_reference

supplier_role_type_examples:
- vendor
- manufacturer
- subcontractor
- logistics_provider
- service_provider
- internal_supplier
- candidate_supplier

allowed_supplier_status:
- draft
- active
- inactive
- blocked
- qualification_pending_reference_only
- merged
- deprecated
- cancelled
- superseded

rules:
- supplier core identity belongs to 52
- supplier qualification belongs to 11.procurement
- purchase order belongs to 10.purchase
- supplier claim belongs to 10.purchase
- AP entry belongs to 30.accounting
- supplier payment execution belongs to 34.cash-management

# ============================================================
# 5. CONTACT / PERSON REFERENCE MASTER
# ============================================================

object_name:
- contact_person_reference_master

meaning:
- shared contact/person reference used by CRM, Sales, Purchase, Billing,
  and other modules when contact identity must be reused.

required_fields:
- contact_person_reference_id
- company_scope_or_global_scope
- contact_code_or_reference
- display_name
- person_name_or_null
- related_business_partner_id_or_null
- contact_status
- primary_contact_point_reference_or_null
- preferred_language_or_null
- current_master_version_id
- effective_from
- effective_to_or_null
- lineage_reference

allowed_contact_status:
- draft
- active
- inactive
- do_not_use
- merged
- left_organization_reference_only
- deprecated
- cancelled
- superseded

rules:
- contact reference identity belongs to 52 when shared across modules
- CRM contact profile / relationship role belongs to 03.crm
- billing contact usage belongs to 05.billing extension where billing-specific
- purchase contact usage belongs to 10.purchase or 11.procurement extension
- contact preference/consent ownership must be explicit when deepened later

# ============================================================
# 6. IDENTIFIERS
# ============================================================

object_name:
- business_partner_identifier

required_fields:
- partner_identifier_id
- business_partner_id
- identifier_type
- identifier_value
- issuing_country_or_context_or_null
- primary_flag
- effective_from
- effective_to_or_null
- identifier_status
- lineage_reference

identifier_type_examples:
- internal_partner_code
- customer_number
- supplier_number
- tax_number
- legal_registration_number
- external_system_id
- legacy_customer_code
- legacy_supplier_code
- EDI_partner_id

allowed_identifier_status:
- active
- inactive
- expired
- replaced
- invalid
- cancelled
- superseded

rules:
- identifiers preserve mapping lineage
- duplicate identifier conflict must create data quality issue
- source modules must not use legacy identifier as master identity without mapping

# ============================================================
# 7. BUSINESS PARTNER ROLE ASSIGNMENT
# ============================================================

object_name:
- business_partner_role_assignment

required_fields:
- partner_role_assignment_id
- business_partner_id
- role_type
- role_reference_id
- role_status
- effective_from
- effective_to_or_null
- lineage_reference

role_type_examples:
- customer
- supplier
- payer
- payee
- carrier
- manufacturer
- subcontractor
- employee_reference_only
- internal_company

rules:
- role assignment links partner to customer/supplier/etc.
- role-specific operational detail remains role/source module extension
- one partner may hold multiple roles
- merge/split must preserve role assignment lineage

# ============================================================
# 8. ADDRESS / CONTACT POINT REFERENCES
# ============================================================

object_name:
- business_partner_address_reference

required_fields:
- partner_address_reference_id
- business_partner_id
- address_master_id
- address_usage_type
- primary_flag
- effective_from
- effective_to_or_null
- address_reference_status
- lineage_reference

address_usage_type_examples:
- legal
- billing
- shipping
- ordering
- remittance
- visit
- service
- temporary

object_name:
- business_partner_contact_point_reference

required_fields:
- contact_point_reference_id
- business_partner_id
- contact_point_type
- contact_value_reference
- usage_type
- primary_flag
- effective_from
- effective_to_or_null
- contact_point_status
- lineage_reference

contact_point_type_examples:
- email
- phone
- fax
- website
- EDI
- app_account
- other

rules:
- common address/contact point references belong to 52
- module-specific usage rules belong to source modules
- changing address reference must preserve effective dates
- historical invoices/orders/POs must remain explainable

# ============================================================
# 9. CUSTOMER / SUPPLIER CROSS-ROLE REFERENCE
# ============================================================

object_name:
- customer_supplier_cross_role_reference

meaning:
- explicit mapping when the same partner acts as both customer and supplier.

required_fields:
- cross_role_reference_id
- business_partner_id
- customer_id_or_null
- supplier_id_or_null
- cross_role_status
- effective_from
- effective_to_or_null
- lineage_reference

allowed_cross_role_status:
- active
- inactive
- under_review
- merged
- cancelled
- superseded

rules:
- cross-role does not net AP/AR automatically
- AP/AR clearing or offset belongs to 30.accounting workflow
- cash settlement belongs to 34.cash-management where applicable

# ============================================================
# 10. MERGE / SPLIT LINEAGE
# ============================================================

object_name:
- partner_merge_split_lineage

required_fields:
- partner_merge_split_lineage_id
- lineage_type
- master_domain
- original_partner_reference_set
- resulting_partner_reference_set
- effective_at
- reason
- approval_reference_or_null
- publication_package_reference
- lineage_status
- created_at
- lineage_reference

lineage_type_examples:
- merge
- split
- correction
- duplicate_resolution
- role_reassignment

rules:
- merge/split must not silently rewrite source transaction history
- source modules receive publication package
- source modules decide open transaction handling according to owner policy
- BI dimensions refresh from snapshots only

# ============================================================
# 11. SOURCE MODULE EXTENSION MAP
# ============================================================

source_extension_map:
- 03.crm:
  - crm_account_profile
  - crm_contact_profile
  - crm_account_contact_relationship
  - crm_customer_relationship_status
  - crm_interaction
- 02.sfa:
  - sfa_lead
  - sfa_opportunity
  - sfa_sales_activity
- 01.sales:
  - sales_quote
  - sales_price_condition
  - sales_discount_condition
  - sales_promotion
- 04.order-management:
  - sales_order
  - order_fulfillment_status
- 05.billing:
  - customer_invoice
  - billing_preference_extension_if_needed
- 10.purchase:
  - purchase_order
  - purchase_supplier_claim
  - supplier_commercial_terms_extension
- 11.procurement:
  - supplier_qualification
  - sourcing_event
  - supplier_evaluation
- 30.accounting:
  - AP_AR_subledger_entry
  - accounting_partner_posting_mapping
- 34.cash-management:
  - payee_bank_execution_reference
  - payment_route_usage

rules:
- source extensions reference 52 IDs
- source extensions do not redefine 52 identity

# ============================================================
# 12. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- CRM account profile used as customer master
- SFA lead used as customer master
- supplier qualification creating supplier core without 52 workflow
- billing contact update rewriting shared contact master without 52 workflow
- partner merge netting AP/AR automatically
- customer deactivation deleting invoices/orders/history
- supplier deactivation deleting purchase/receiving/AP history
- BI customer dimension merge replacing 52 merge workflow

# ============================================================
# 13. COMPLETION STATE
# ============================================================

completion_state:
- business partner/customer/supplier/contact master catalog fixed
- role assignment and identifier rules fixed
- source extension map fixed
- merge/split lineage rule fixed

# ============================================================
