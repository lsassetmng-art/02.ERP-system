# ============================================================
# QUALITY TO SUPPLIER CLAIM / PURCHASE RETURN BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 17.quality
target_modules:
- 10.purchase
- 11.procurement
related_modules:
- 12.inventory
- 13.warehouse
- 18.costing
- 30.accounting
- 60.business-intelligence

purpose:
Define how supplier-related quality defects and nonconformances are handed to
purchase/procurement for supplier claim, return, chargeback, or evaluation
without quality owning supplier commercial workflow.

canonical_role:
- 17.quality owns inspection / defect / nonconformance / disposition truth
- 10.purchase owns supplier claim / purchase return commercial action
- 11.procurement owns supplier evaluation / sourcing impact truth

# ============================================================
# 1. QUALITY SUPPLIER ISSUE BASIS
# ============================================================

handoff_object_name:
- quality_to_purchase_supplier_claim_basis

meaning:
- quality-side evidence basis for purchase to create supplier claim or return workflow

required_fields:
- supplier_claim_basis_id
- company_id
- source_module
- target_module
- quality_nonconformance_id_or_null
- quality_disposition_id
- inspection_result_id
- supplier_id
- purchase_order_id_or_null
- purchase_order_line_id_or_null
- purchase_receiving_operation_id_or_null
- item_id
- lot_id_or_null
- serial_id_set_or_null
- affected_quantity
- quantity_uom
- defect_type
- severity
- defect_summary
- evidence_reference_set
- suggested_supplier_action
- suggested_inventory_action_or_null
- suggested_cost_recovery_flag
- basis_status
- created_at
- created_by_or_system_actor
- lineage_reference

suggested_supplier_action_examples:
- supplier_claim_review
- return_to_supplier
- replacement_request
- price_adjustment_request
- chargeback_review
- supplier_corrective_action_request
- supplier_evaluation_update
- no_supplier_action

allowed_basis_status:
- building
- validation_pending
- handoff_ready
- sent_to_purchase
- accepted_by_purchase
- rejected_by_purchase
- sent_to_procurement
- accepted_by_procurement
- corrected
- cancelled
- superseded

rules:
- source_module must be 17.quality
- target_module for claim/return must be 10.purchase
- target module for supplier evaluation impact may be 11.procurement
- quality evidence is not supplier claim
- purchase decides commercial supplier claim / return action
- procurement decides supplier evaluation/sourcing impact

# ============================================================
# 2. PURCHASE ACCEPTANCE / REJECTION
# ============================================================

purchase_acceptance_requires:
- supplier_id present
- item_id present
- affected_quantity valid
- quality disposition present
- evidence_reference_set present
- defect summary present
- lineage_reference present

purchase_reject_reason_codes:
- INVALID_SCHEMA
- SUPPLIER_UNRESOLVABLE
- PURCHASE_REFERENCE_UNRESOLVABLE
- ITEM_UNRESOLVABLE
- QUANTITY_INVALID
- QUALITY_DISPOSITION_MISSING
- EVIDENCE_MISSING
- LINEAGE_MISSING
- DUPLICATE_OR_SUPERSEDED_BASIS

rules:
- rejection does not close quality nonconformance
- quality may issue corrected successor basis
- purchase may create claim/return after acceptance
- purchase may reject supplier action while quality nonconformance remains open or separately closed

# ============================================================
# 3. PURCHASE SUPPLIER CLAIM EXECUTION
# ============================================================

purchase_owned_object_name:
- purchase_supplier_claim

meaning:
- purchase-owned commercial claim against supplier based on quality or receiving evidence

required_fields:
- supplier_claim_id
- company_id
- supplier_id
- source_quality_claim_basis_id_or_null
- purchase_order_id_or_null
- purchase_order_line_id_or_null
- claim_type
- claim_status
- claimed_quantity_or_null
- quantity_uom_or_null
- claimed_amount_or_null
- currency_code_or_null
- claim_reason
- evidence_reference_set
- submitted_at_or_null
- supplier_response_reference_or_null
- resolution_reference_or_null
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
- quality basis remains 17 truth
- accounting impact goes through 30 workflow
- inventory return/stock movement goes through 12/13/14 workflows as applicable

# ============================================================
# 4. PURCHASE RETURN BOUNDARY
# ============================================================

purchase_return_basis:
- quality disposition may recommend return_to_supplier
- purchase creates supplier return commercial document
- warehouse/logistics execute physical return where required
- inventory records stock movement/status effect
- accounting records financial impact

forbidden:
- quality directly creating purchase return document
- quality directly decrementing inventory for supplier return
- purchase return closing quality nonconformance without quality closure
- supplier acceptance directly posting accounting journal

# ============================================================
# 5. PROCUREMENT SUPPLIER EVALUATION IMPACT
# ============================================================

handoff_object_name:
- quality_to_procurement_supplier_evaluation_feedback

required_fields:
- supplier_evaluation_feedback_id
- company_id
- source_module
- target_module
- supplier_id
- quality_nonconformance_id_or_null
- inspection_result_id_or_null
- defect_type
- severity
- occurrence_count_or_null
- quality_impact_summary
- recommended_evaluation_action
- feedback_status
- created_at
- lineage_reference

recommended_evaluation_action_examples:
- monitor
- reduce_score
- require_corrective_action
- suspend_supplier_review
- sourcing_block_review
- no_action

rules:
- target_module must be 11.procurement
- procurement owns supplier evaluation decision
- quality owns defect evidence
- feedback does not automatically change supplier qualification

# ============================================================
# 6. COSTING / ACCOUNTING IMPACT
# ============================================================

costing_rules:
- quality may provide quality cost basis
- supplier recovery expectation may be referenced
- 18.costing calculates internal cost impact
- 30.accounting posts financial recovery/adjustment only through accounting workflow

accounting_rules:
- supplier credit / refund / chargeback accounting belongs to 30.accounting
- purchase claim resolution may provide accounting basis
- claim basis is not GL journal

# ============================================================
# 7. BI OUTPUT
# ============================================================

BI_consumable_outputs:
- supplier defect snapshot
- supplier claim basis snapshot
- supplier claim status snapshot
- supplier evaluation feedback snapshot
- quality cost recovery snapshot

rules:
- BI may show supplier quality performance
- BI may not create claim
- BI may not change supplier score
- BI may not close nonconformance

# ============================================================
# 8. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- quality disposition directly becoming supplier claim
- supplier claim directly changing quality result
- procurement supplier score directly changing quality nonconformance
- purchase return directly changing inventory without inventory/warehouse workflow
- accounting recovery directly closing supplier claim without purchase workflow
- BI dashboard changing supplier quality score or claim status

# ============================================================
# 9. DECISION TEST
# ============================================================

decision_test:
- If it is defect/inspection/disposition/nonconformance, 17 owns it.
- If it is supplier claim/return commercial action, 10 owns it.
- If it is supplier evaluation/sourcing impact, 11 owns it.
- If it is stock movement/status, 12 owns it.
- If it is accounting posting/recovery, 30 owns it.
- If it is dashboard projection, 60 owns it.

# ============================================================
# 10. COMPLETION STATE
# ============================================================

completion_state:
- quality to supplier claim boundary fixed
- purchase supplier claim ownership fixed
- procurement supplier evaluation feedback fixed
- purchase return / inventory / accounting boundaries clarified

# ============================================================
