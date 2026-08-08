# ============================================================
# PROCUREMENT TO PURCHASE BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 11.procurement
consumer_module: 10.purchase

purpose:
Define how procurement request, sourcing, supplier selection, and authorized
buying basis are handed to purchase without transferring purchase order
ownership back into procurement.

canonical_role:
- procurement request / sourcing / supplier selection / authorized buying truth

# ============================================================
# 1. CORE PROCUREMENT OBJECTS
# ============================================================

core_objects:
- procurement_request
- purchase_requisition
- sourcing_event
- supplier_candidate_set
- supplier_quote
- quote_comparison
- supplier_selection_decision
- procurement_policy_check
- procurement_approval_package
- authorized_buying_package
- procurement_contract_reference

# ============================================================
# 2. PURCHASE REQUISITION / PROCUREMENT REQUEST
# ============================================================

object_name:
- procurement_request

meaning:
- internal request for procurement before purchase order execution

required_fields:
- procurement_request_id
- company_id
- request_source_module
- request_source_object_type
- request_source_object_id_or_null
- requested_item_or_service_scope
- requested_quantity_or_null
- quantity_uom_or_null
- requested_delivery_date_or_null
- requested_location_id_or_null
- budget_reference_or_null
- requester_reference
- request_reason
- request_status
- created_at
- created_by
- lineage_reference

allowed_request_status:
- draft
- submitted
- policy_check_pending
- sourcing_required
- approval_pending
- approved_for_sourcing
- approved_for_purchase
- rejected
- cancelled
- superseded

rules:
- request is procurement truth
- approval for purchase does not equal purchase order issuance
- PO creation belongs to 10.purchase

# ============================================================
# 3. SOURCING EVENT
# ============================================================

object_name:
- sourcing_event

meaning:
- procurement-side sourcing process for supplier / quote / terms comparison

required_fields:
- sourcing_event_id
- company_id
- procurement_request_id_or_null
- sourcing_type
- item_or_service_scope
- supplier_candidate_set_reference
- rfq_reference_or_null
- quote_comparison_reference_or_null
- sourcing_status
- opened_at
- closed_at_or_null
- owner_role
- lineage_reference

sourcing_type_examples:
- rfq
- competitive_bid
- direct_sourcing
- contract_calloff
- catalog_sourcing
- emergency_sourcing

allowed_sourcing_status:
- draft
- open
- quote_collecting
- evaluation
- selected
- cancelled
- superseded

rules:
- sourcing event belongs to procurement
- supplier selection decision belongs to procurement
- resulting PO belongs to purchase

# ============================================================
# 4. SUPPLIER SELECTION DECISION
# ============================================================

object_name:
- supplier_selection_decision

required_fields:
- supplier_selection_decision_id
- company_id
- sourcing_event_id
- selected_supplier_id
- selected_quote_id_or_null
- selection_reason
- evaluation_score_reference_or_null
- policy_exception_reference_or_null
- selected_at
- selected_by
- approval_reference_or_null
- decision_status
- lineage_reference

allowed_decision_status:
- draft
- selected_pending_approval
- approved
- rejected
- superseded

rules:
- approved supplier selection may become authorized buying basis
- purchase may consume decision but cannot rewrite procurement decision
- procurement correction requires new decision version or supersession

# ============================================================
# 5. AUTHORIZED BUYING PACKAGE HANDOFF
# ============================================================

handoff_object_name:
- procurement_to_purchase_authorized_buying_package

meaning:
- authorized procurement basis for purchase order creation

required_fields:
- authorized_buying_package_id
- company_id
- source_module
- target_module
- procurement_request_id_or_null
- sourcing_event_id_or_null
- supplier_selection_decision_id_or_null
- selected_supplier_id
- selected_quote_id_or_null
- item_or_service_scope
- approved_quantity_or_null
- quantity_uom_or_null
- target_delivery_date_or_null
- target_location_id_or_null
- budget_reference_or_null
- contract_reference_or_null
- policy_check_reference
- approval_reference
- package_status
- created_at
- created_by
- lineage_reference

allowed_package_status:
- building
- validation_pending
- handoff_ready
- handed_off
- accepted_by_purchase
- rejected_by_purchase
- superseded
- cancelled

rules:
- source_module must be 11.procurement
- target_module must be 10.purchase
- only handoff_ready may be accepted by purchase
- accepted package may seed PO creation
- accepted package does not itself become PO
- correction after acceptance requires successor package or purchase-side change process as applicable

# ============================================================
# 6. PURCHASE ACCEPTANCE / REJECTION
# ============================================================

purchase_acceptance_requires:
- selected_supplier_id present
- item_or_service_scope resolvable
- approval_reference present
- policy_check_reference present
- company_id resolvable
- lineage_reference present
- package_status = handoff_ready

purchase_reject_reason_codes:
- INVALID_SCHEMA
- SUPPLIER_UNRESOLVABLE
- ITEM_SCOPE_UNRESOLVABLE
- MISSING_APPROVAL
- POLICY_CHECK_MISSING
- BUDGET_REFERENCE_INVALID
- CONTRACT_REFERENCE_INVALID
- PACKAGE_NOT_READY
- MISSING_LINEAGE
- DUPLICATE_PACKAGE
- SUPERSEDED_PACKAGE

rules:
- rejection does not delete procurement package
- procurement may issue corrected successor package
- purchase may not patch procurement sourcing decision directly

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- procurement package treated as issued PO
- supplier quote treated as PO confirmation
- sourcing decision directly creating warehouse receiving expectation
- procurement editing purchase order after PO issuance
- purchase changing supplier selection decision in place
- BI dashboard approving supplier selection
- audit finding changing supplier decision directly

# ============================================================
# 8. DECISION TEST
# ============================================================

decision_test:
- If it is request/sourcing/supplier selection/authorized buying basis, 11 owns it.
- If it is issued supplier order document, 10 owns it.
- If it is physical receipt, 13 owns it.
- If it is stock receipt effect, 12 owns it.

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- procurement to purchase handoff fixed
- sourcing and supplier selection ownership fixed
- purchase acceptance and rejection baseline fixed
- PO ownership separation fixed

# ============================================================
