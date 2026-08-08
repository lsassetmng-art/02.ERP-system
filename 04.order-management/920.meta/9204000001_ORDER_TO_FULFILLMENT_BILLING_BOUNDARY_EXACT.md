# ============================================================
# ORDER TO FULFILLMENT AND BILLING BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 04.order-management
related_modules:
- 01.sales
- 05.billing
- 12.inventory
- 13.warehouse
- 14.logistics

purpose:
Define customer order truth and fulfillment orchestration boundaries with
inventory, warehouse, logistics, and billing.

canonical_role:
- accepted customer order / fulfillment orchestration truth

# ============================================================
# 1. CORE ORDER OBJECTS
# ============================================================

core_objects:
- sales_order
- sales_order_line
- order_change
- order_cancellation
- order_fulfillment_plan
- order_fulfillment_status
- order_to_inventory_allocation_request
- order_to_billing_invoice_request
- order_exception
- order_delivery_feedback_intake

# ============================================================
# 2. SALES ORDER
# ============================================================

object_name:
- sales_order

meaning:
- canonical accepted customer order

required_fields:
- sales_order_id
- company_id
- customer_id
- sales_order_number
- order_status
- source_sales_basis_reference_or_null
- order_date
- requested_delivery_date_or_null
- currency_code
- order_line_set
- fulfillment_policy_reference
- billing_policy_reference
- payment_terms_reference_or_null
- ship_to_location_reference
- bill_to_reference
- created_at
- created_by
- updated_at
- updated_by
- lineage_reference

allowed_order_status:
- draft
- validation_pending
- accepted
- allocation_requested
- partially_allocated
- allocated
- fulfillment_requested
- partially_fulfilled
- fulfilled
- partially_delivered
- delivered
- billing_requested
- billed
- closed
- cancelled
- superseded

rules:
- accepted order is 04 truth
- order status may reflect downstream feedback
- downstream modules own their detailed truth
- order status update must retain source feedback lineage

# ============================================================
# 3. SALES ORDER LINE
# ============================================================

object_name:
- sales_order_line

required_fields:
- sales_order_line_id
- sales_order_id
- line_number
- item_id_or_service_id
- ordered_quantity
- quantity_uom
- agreed_unit_price_or_condition_reference
- requested_delivery_date_or_null
- fulfillment_location_preference_or_null
- line_status
- inventory_requirement_flag
- warehouse_fulfillment_required_flag
- logistics_required_flag
- billing_required_flag
- lineage_reference

allowed_line_status:
- accepted
- allocation_requested
- allocated
- short
- fulfillment_requested
- picked
- shipped
- delivered
- billing_requested
- billed
- closed
- cancelled
- superseded

rules:
- order line is not inventory allocation
- order line is not warehouse pick task
- order line is not invoice line
- order line may link to downstream source references

# ============================================================
# 4. ORDER TO INVENTORY ALLOCATION REQUEST
# ============================================================

handoff_object_name:
- order_to_inventory_allocation_request

meaning:
- request from order management to inventory for reservation/allocation

required_fields:
- allocation_request_id
- company_id
- source_module
- target_module
- sales_order_id
- sales_order_line_set
- customer_id
- requested_fulfillment_date_or_null
- requested_location_preference_or_null
- priority_class
- allocation_policy_reference
- request_status
- created_at
- created_by
- lineage_reference

sales_order_line_set_required_fields:
- sales_order_line_id
- item_id_or_service_id
- requested_quantity
- quantity_uom
- requested_location_or_region_or_null
- substitution_allowed_flag
- partial_allowed_flag

allowed_request_status:
- draft
- handoff_ready
- sent_to_inventory
- accepted_by_inventory
- rejected_by_inventory
- partially_allocated
- allocated
- short
- cancelled
- superseded

rules:
- source_module must be 04.order-management
- target_module must be 12.inventory
- inventory owns reservation/allocation result
- allocation result may update order fulfillment status

# ============================================================
# 5. ORDER FULFILLMENT STATUS
# ============================================================

object_name:
- order_fulfillment_status

meaning:
- order-level orchestration status based on downstream feedback

required_fields:
- fulfillment_status_id
- company_id
- sales_order_id
- sales_order_line_id_or_null
- inventory_status_reference_or_null
- warehouse_status_reference_or_null
- logistics_status_reference_or_null
- billing_status_reference_or_null
- fulfillment_state
- updated_at
- lineage_reference

fulfillment_state_examples:
- awaiting_allocation
- allocation_short
- allocated
- awaiting_pick
- picking
- picked
- shipped_from_warehouse
- in_transit
- delivered
- delivery_failed
- billing_eligible
- billed
- closed

rules:
- fulfillment status is orchestration projection inside order management
- source details remain in downstream modules
- correction must follow source module workflow

# ============================================================
# 6. DELIVERY FEEDBACK INTAKE
# ============================================================

intake_object_name:
- logistics_to_order_delivery_feedback

required_fields:
- delivery_feedback_id
- company_id
- source_module
- target_module
- logistics_shipment_id
- sales_order_id
- sales_order_line_set_or_null
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
- source_module must be 14.logistics
- target_module must be 04.order-management
- order may update fulfillment state
- order may not alter proof of delivery truth

# ============================================================
# 7. ORDER TO BILLING INVOICE REQUEST
# ============================================================

handoff_object_name:
- order_to_billing_invoice_request

meaning:
- controlled request from order management to billing when billing eligibility is met

required_fields:
- invoice_request_id
- company_id
- source_module
- target_module
- sales_order_id
- customer_id
- billing_policy_reference
- billing_trigger_type
- billing_trigger_reference_set
- invoice_request_line_set
- requested_invoice_date_or_null
- currency_code
- request_status
- created_at
- created_by
- lineage_reference

billing_trigger_type_examples:
- order_acceptance
- shipment
- delivery
- milestone
- service_completion
- subscription_period
- manual_approved

invoice_request_line_required_fields:
- invoice_request_line_id
- sales_order_line_id
- item_id_or_service_id
- billable_quantity
- quantity_uom
- price_condition_reference_or_null
- delivery_reference_or_null
- shipment_reference_or_null
- milestone_reference_or_null

allowed_request_status:
- building
- validation_pending
- handoff_ready
- sent_to_billing
- accepted_by_billing
- rejected_by_billing
- billed
- cancelled
- superseded

rules:
- invoice request is not invoice
- billing decides invoice creation
- billing may reject request
- source trigger references must remain traceable

# ============================================================
# 8. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- order directly decrementing stock ledger
- order directly completing warehouse task
- order directly creating proof of delivery
- order directly creating invoice without billing intake
- billing changing order quantity directly
- logistics changing order line truth directly
- BI dashboard changing order status

# ============================================================
# 9. DECISION TEST
# ============================================================

decision_test:
- If it is accepted order / fulfillment orchestration, 04 owns it.
- If it is allocation / stock issue, 12 owns it.
- If it is physical warehouse fulfillment, 13 owns it.
- If it is delivery proof, 14 owns it.
- If it is invoice, 05 owns it.

# ============================================================
# 10. COMPLETION STATE
# ============================================================

completion_state:
- order management truth fixed
- allocation request boundary fixed
- delivery feedback intake fixed
- invoice request boundary fixed

# ============================================================
