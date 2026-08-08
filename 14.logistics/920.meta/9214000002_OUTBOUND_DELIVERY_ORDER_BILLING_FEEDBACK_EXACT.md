# ============================================================
# OUTBOUND DELIVERY ORDER / BILLING FEEDBACK EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 14.logistics
related_modules:
- 04.order-management
- 05.billing
- 13.warehouse
- 12.inventory

purpose:
Define logistics outbound delivery ownership and feedback to order management
and billing without transferring delivery truth to those modules.

canonical_role:
- transport / delivery / proof of delivery truth

# ============================================================
# 1. ACCEPTED INPUT
# ============================================================

accepted_input_object:
- warehouse_shipping_to_logistics_handoff

acceptance_requires:
- source_module = 13.warehouse
- target_module = 14.logistics
- outbound fulfillment operation present
- sales_order_id present
- shipment units present
- package set resolvable
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- WAREHOUSE_HANDOFF_NOT_READY
- SHIPMENT_UNIT_MISSING
- PACKAGE_UNRESOLVABLE
- ORDER_REFERENCE_MISSING
- MISSING_LINEAGE
- DUPLICATE_HANDOFF

# ============================================================
# 2. DELIVERY OBJECTS
# ============================================================

core_objects:
- logistics_shipment
- logistics_transport_plan
- logistics_route_plan
- logistics_dispatch
- logistics_tracking_event
- logistics_proof_of_delivery
- logistics_delivery_exception
- logistics_to_order_delivery_feedback
- logistics_to_billing_delivery_evidence

# ============================================================
# 3. LOGISTICS SHIPMENT
# ============================================================

object_name:
- logistics_shipment

required_fields:
- logistics_shipment_id
- company_id
- warehouse_handoff_id
- sales_order_id
- shipment_status
- origin_location_id
- destination_location_id
- shipment_unit_set
- carrier_assignment_id_or_null
- route_plan_id_or_null
- dispatch_reference_or_null
- proof_of_delivery_reference_or_null
- delivery_exception_reference_set
- created_at
- lineage_reference

allowed_shipment_status:
- candidate
- planning
- carrier_assigned
- dispatched
- in_transit
- delivered
- partially_delivered
- delivery_failed
- returned
- cancelled
- superseded

rules:
- shipment status is logistics truth
- delivered may feed order and billing eligibility
- delivered does not directly create invoice
- delivered does not rewrite warehouse task truth

# ============================================================
# 4. LOGISTICS TO ORDER DELIVERY FEEDBACK
# ============================================================

handoff_object_name:
- logistics_to_order_delivery_feedback

required_fields:
- delivery_feedback_id
- company_id
- source_module
- target_module
- logistics_shipment_id
- sales_order_id
- delivery_status
- proof_of_delivery_reference_or_null
- delivery_exception_reference_or_null
- delivered_at_or_null
- feedback_created_at
- lineage_reference

allowed_delivery_status:
- dispatched
- in_transit
- delivered
- partially_delivered
- failed
- returned
- cancelled

rules:
- target_module must be 04.order-management
- order may update fulfillment status
- order may not mutate logistics proof truth
- delivery feedback is not invoice

# ============================================================
# 5. LOGISTICS TO BILLING DELIVERY EVIDENCE
# ============================================================

handoff_object_name:
- logistics_to_billing_delivery_evidence

meaning:
- delivery evidence that billing may use if billing policy requires delivery-based billing

required_fields:
- delivery_evidence_id
- company_id
- source_module
- target_module
- logistics_shipment_id
- sales_order_id
- customer_id_or_null
- proof_of_delivery_reference_or_null
- delivery_status
- delivered_quantity_summary_or_null
- delivered_at_or_null
- billing_relevance_flag
- evidence_status
- created_at
- lineage_reference

allowed_evidence_status:
- building
- handoff_ready
- sent_to_billing
- accepted_by_billing
- rejected_by_billing
- superseded
- cancelled

rules:
- target_module must be 05.billing
- delivery evidence may satisfy billing trigger
- billing decides invoice creation
- delivery evidence is not invoice

# ============================================================
# 6. DELIVERY EXCEPTION FEEDBACK
# ============================================================

delivery_exception_feedback_targets:
- 04.order-management
- 05.billing
- 12.inventory where return/custody investigation is required
- 13.warehouse where warehouse-origin issue is suspected

rules:
- logistics owns delivery exception lifecycle
- billing may block or adjust billing through billing workflow
- order may update fulfillment exception status
- inventory correction requires 12 workflow
- warehouse correction requires 13 workflow

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- proof of delivery directly creating invoice
- proof of delivery directly posting accounting journal
- logistics delivery event directly changing order line quantity
- logistics tracking event completing warehouse task
- billing editing proof of delivery
- BI dashboard treated as delivery evidence source truth

# ============================================================
# 8. DECISION TEST
# ============================================================

decision_test:
- If it is transport / delivery / POD truth, 14 owns it.
- If it is order status, 04 owns orchestration.
- If it is invoice or billing eligibility decision, 05 owns it.
- If it is stock issue or return stock effect, 12 owns it.
- If it is warehouse task, 13 owns it.

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- logistics outbound delivery truth fixed
- feedback to order fixed
- delivery evidence to billing fixed
- delivery exception feedback boundary fixed

# ============================================================
