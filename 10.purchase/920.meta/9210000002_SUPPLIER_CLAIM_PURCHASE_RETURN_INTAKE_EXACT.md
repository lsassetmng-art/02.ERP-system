# ============================================================
# SUPPLIER CLAIM / PURCHASE RETURN INTAKE EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 10.purchase
producer_module: 17.quality
related_modules:
- 11.procurement
- 12.inventory
- 13.warehouse
- 14.logistics
- 30.accounting
- 60.business-intelligence

purpose:
Define purchase-side intake and lifecycle for quality-driven supplier claims,
supplier returns, replacements, refunds, chargebacks, and supplier responses.

canonical_role:
- supplier claim / purchase return commercial workflow truth

# ============================================================
# 1. ACCEPTED INPUT
# ============================================================

accepted_input_object:
- quality_to_purchase_supplier_claim_basis

acceptance_requires:
- source_module = 17.quality
- target_module = 10.purchase
- supplier_id present
- item_id present
- affected quantity valid
- quality disposition present
- evidence present
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- SUPPLIER_UNRESOLVABLE
- ITEM_UNRESOLVABLE
- PURCHASE_REFERENCE_UNRESOLVABLE
- QUALITY_DISPOSITION_MISSING
- EVIDENCE_MISSING
- QUANTITY_INVALID
- MISSING_LINEAGE
- DUPLICATE_OR_SUPERSEDED_BASIS

rules:
- accepted basis may create purchase supplier claim
- rejected basis returns issue to quality for correction/review
- purchase does not alter quality result

# ============================================================
# 2. SUPPLIER CLAIM
# ============================================================

object_name:
- purchase_supplier_claim

required_fields:
- supplier_claim_id
- company_id
- supplier_id
- source_quality_claim_basis_id
- purchase_order_id_or_null
- purchase_order_line_id_or_null
- item_id
- lot_id_or_null
- serial_id_set_or_null
- claim_type
- claim_status
- claimed_quantity_or_null
- quantity_uom_or_null
- claimed_amount_or_null
- currency_code_or_null
- claim_reason
- evidence_reference_set
- supplier_response_reference_or_null
- resolution_reference_or_null
- accounting_basis_reference_or_null
- created_at
- created_by
- lineage_reference

claim_type_examples:
- replacement
- return
- refund
- price_adjustment
- chargeback
- corrective_action_request
- warranty_claim
- documentation_claim

allowed_claim_status:
- draft
- review_pending
- approved_for_submission
- submitted_to_supplier
- supplier_response_pending
- accepted_by_supplier
- rejected_by_supplier
- negotiated
- resolved
- cancelled
- superseded

rules:
- supplier claim belongs to 10.purchase
- quality nonconformance remains 17 truth
- procurement may consume supplier quality feedback
- accounting impact requires 30 workflow

# ============================================================
# 3. SUPPLIER RESPONSE
# ============================================================

object_name:
- supplier_claim_response

required_fields:
- supplier_claim_response_id
- company_id
- supplier_claim_id
- supplier_id
- response_type
- response_summary
- accepted_quantity_or_amount_or_null
- rejected_reason_or_null
- replacement_commitment_or_null
- credit_commitment_or_null
- return_authorization_reference_or_null
- response_status
- responded_at
- lineage_reference

response_type_examples:
- accept
- reject
- partial_accept
- replacement_offer
- credit_offer
- return_authorization
- corrective_action_response
- request_more_evidence

allowed_response_status:
- received
- under_review
- accepted
- rejected
- negotiation_required
- superseded
- cancelled

rules:
- response belongs to purchase claim workflow
- supplier response does not change quality result
- replacement/return/payment effects require downstream workflows

# ============================================================
# 4. PURCHASE RETURN REQUEST
# ============================================================

object_name:
- purchase_return_request

required_fields:
- purchase_return_request_id
- company_id
- supplier_claim_id
- supplier_id
- purchase_order_id_or_null
- item_id
- return_quantity
- quantity_uom
- return_reason
- source_quality_disposition_reference
- inventory_reference_or_null
- warehouse_reference_or_null
- logistics_reference_or_null
- return_status
- created_at
- lineage_reference

allowed_return_status:
- draft
- approval_pending
- approved
- sent_to_inventory
- sent_to_warehouse
- sent_to_logistics
- in_transit
- returned_to_supplier
- supplier_received
- cancelled
- superseded

rules:
- purchase return request is commercial return workflow
- inventory owns stock movement/status
- warehouse/logistics own physical return handling
- accounting owns financial impact

# ============================================================
# 5. ACCOUNTING BASIS FOR CLAIM
# ============================================================

handoff_object_name:
- purchase_supplier_claim_to_accounting_basis

required_fields:
- supplier_claim_accounting_basis_id
- company_id
- source_module
- target_module
- supplier_claim_id
- supplier_id
- claim_type
- resolved_amount_or_null
- currency_code_or_null
- credit_or_refund_reference_or_null
- accounting_basis_status
- created_at
- lineage_reference

allowed_accounting_basis_status:
- building
- handoff_ready
- sent_to_accounting
- accepted_by_accounting
- rejected_by_accounting
- posted
- cancelled
- superseded

rules:
- source_module must be 10.purchase
- target_module must be 30.accounting
- accounting basis is not GL journal
- accounting owns posting truth

# ============================================================
# 6. FEEDBACK
# ============================================================

feedback_to_quality:
- claim accepted by purchase
- claim rejected by purchase
- claim submitted
- supplier accepted/rejected
- claim resolved/cancelled
- return completed where relevant

feedback_to_procurement:
- supplier defect claim created
- supplier corrective action requested
- supplier response outcome
- repeated supplier quality issue

feedback_to_inventory_warehouse_logistics:
- return approved
- return quantity/lot/serial
- return handling requirement
- supplier return authorization

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- supplier claim changing inspection result
- purchase return changing inventory ledger directly
- supplier response posting accounting journal
- procurement score update closing purchase claim
- accounting credit closing quality nonconformance
- BI dashboard submitting supplier claim

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- supplier claim intake fixed
- purchase-side claim lifecycle fixed
- supplier response fixed
- purchase return request fixed
- accounting basis boundary fixed

# ============================================================
