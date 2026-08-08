# ============================================================
# ORDER RETURN / CUSTOMER RETURN LIFECYCLE EXACT DESIGN
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 04.order-management
track: Track F
related_modules:
- 01.sales
- 05.billing
- 12.inventory
- 13.warehouse
- 14.logistics
- 17.quality
- 30.accounting
- 34.cash-management
- 60.business-intelligence

purpose:
Define customer return lifecycle from return request to return authorization,
physical return, quality inspection, inventory effect, billing adjustment,
refund, and accounting.

canonical_role:
- customer return orchestration / return order truth

# ============================================================
# 1. CORE OBJECTS
# ============================================================

core_objects:
- customer_return_request
- return_authorization
- return_order
- return_order_line
- return_receipt_request
- return_quality_request
- return_disposition_summary
- return_billing_adjustment_basis
- return_refund_basis
- return_accounting_basis
- return_lifecycle_feedback

# ============================================================
# 2. CUSTOMER RETURN REQUEST
# ============================================================

object_name:
- customer_return_request

required_fields:
- customer_return_request_id
- company_id
- customer_id
- sales_order_id_or_null
- customer_invoice_id_or_null
- original_delivery_reference_or_null
- return_reason
- requested_return_line_set
- request_status
- requested_at
- requested_by_or_channel
- lineage_reference

return_reason_examples:
- damaged
- wrong_item
- quality_issue
- customer_change
- over_delivery
- warranty
- billing_dispute
- delivery_issue
- other

allowed_request_status:
- received
- validation_pending
- approved_for_authorization
- rejected
- cancelled
- superseded

rules:
- return request belongs to 04.order-management
- invoice correction belongs to 05.billing
- physical receipt belongs to 13.warehouse
- stock ledger belongs to 12.inventory
- quality decision belongs to 17.quality

# ============================================================
# 3. RETURN AUTHORIZATION / RETURN ORDER
# ============================================================

object_name:
- return_authorization

required_fields:
- return_authorization_id
- company_id
- customer_return_request_id
- authorization_number
- authorization_status
- authorized_return_line_set
- return_window_start_or_null
- return_window_end_or_null
- return_shipping_instruction_or_null
- approved_at_or_null
- lineage_reference

allowed_authorization_status:
- draft
- approved
- issued_to_customer
- expired
- cancelled
- superseded

object_name:
- return_order

required_fields:
- return_order_id
- company_id
- return_authorization_id
- original_sales_order_id_or_null
- customer_id
- return_order_status
- return_order_line_set
- warehouse_return_reference_or_null
- quality_reference_or_null
- billing_adjustment_reference_or_null
- refund_reference_or_null
- lineage_reference

allowed_return_order_status:
- created
- awaiting_return
- return_in_transit
- received_pending_quality
- received_pending_inventory
- disposition_pending
- billing_adjustment_pending
- refund_pending
- closed
- cancelled
- superseded

# ============================================================
# 4. RETURN ORDER LINE
# ============================================================

object_name:
- return_order_line

required_fields:
- return_order_line_id
- return_order_id
- original_sales_order_line_id_or_null
- original_invoice_line_id_or_null
- item_id_or_service_id
- authorized_return_quantity
- received_return_quantity_or_null
- quantity_uom
- return_reason
- return_line_status
- quality_disposition_reference_or_null
- inventory_effect_reference_or_null
- billing_adjustment_line_reference_or_null
- lineage_reference

allowed_return_line_status:
- authorized
- in_transit
- received
- quality_pending
- accepted
- rejected
- scrapped
- returned_to_stock
- billing_adjusted
- closed
- cancelled
- superseded

rules:
- return line belongs to 04
- stock status belongs to 12
- quality disposition belongs to 17
- invoice/credit memo belongs to 05

# ============================================================
# 5. WAREHOUSE / QUALITY / INVENTORY HANDOFF
# ============================================================

handoff_object_name:
- return_to_warehouse_receipt_request

required_fields:
- return_receipt_request_id
- company_id
- source_module
- target_module
- return_order_id
- return_order_line_set
- expected_return_location_or_warehouse_id
- receipt_instruction
- request_status
- created_at
- lineage_reference

rules:
- target_module must be 13.warehouse
- warehouse owns physical return receipt operation
- return request is not warehouse receipt

handoff_object_name:
- return_to_quality_inspection_request

required_fields:
- return_quality_request_id
- company_id
- source_module
- target_module
- return_order_id
- return_order_line_id
- item_id
- returned_quantity
- quantity_uom
- inspection_reason
- request_status
- lineage_reference

rules:
- target_module must be 17.quality
- quality owns inspection/disposition
- return order consumes quality disposition

handoff_object_name:
- return_to_inventory_effect_basis

required_fields:
- return_inventory_effect_basis_id
- company_id
- source_module
- target_module
- return_order_id
- return_order_line_id
- item_id
- quantity
- quantity_uom
- quality_disposition_reference_or_null
- suggested_inventory_effect
- basis_status
- lineage_reference

suggested_inventory_effect_examples:
- return_to_available_stock
- return_to_blocked_stock
- return_to_quarantine
- scrap
- no_stock_effect

rules:
- target_module must be 12.inventory
- inventory owns stock ledger
- return order does not directly write stock ledger

# ============================================================
# 6. BILLING / CASH / ACCOUNTING HANDOFF
# ============================================================

handoff_object_name:
- return_to_billing_adjustment_basis

required_fields:
- return_billing_adjustment_basis_id
- company_id
- source_module
- target_module
- return_order_id
- customer_invoice_id_or_null
- adjustment_type
- adjustment_amount_or_null
- currency_code_or_null
- reason
- basis_status
- lineage_reference

adjustment_type_examples:
- credit_memo
- debit_memo
- invoice_cancellation
- partial_credit
- no_billing_adjustment

rules:
- target_module must be 05.billing
- billing owns credit memo/invoice adjustment

handoff_object_name:
- return_to_cash_refund_basis

required_fields:
- return_refund_basis_id
- company_id
- source_module
- target_module
- return_order_id
- customer_id
- refund_amount
- currency_code
- refund_reason
- refund_basis_status
- lineage_reference

rules:
- target_module must be 34.cash-management
- cash owns refund execution
- accounting owns clearing/posting

handoff_object_name:
- return_to_accounting_basis

required_fields:
- return_accounting_basis_id
- company_id
- source_module
- target_module
- return_order_id
- accounting_event_type
- amount_or_null
- currency_code_or_null
- source_reference_set
- basis_status
- lineage_reference

rules:
- target_module must be 30.accounting
- basis is not GL journal

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- return request directly creating credit memo
- return receipt directly changing stock ledger
- quality return disposition directly refunding customer
- return authorization directly posting accounting journal
- invoice paid status directly closing return order
- BI dashboard approving return

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- customer return lifecycle exact design fixed
- return order / warehouse / quality / inventory / billing / cash / accounting boundaries fixed
- return shortcut prohibitions fixed

# ============================================================
