# ============================================================
# SALES ORDER ALLOCATION AND OUTBOUND INVENTORY EFFECT EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 12.inventory
related_modules:
- 04.order-management
- 13.warehouse
- 14.logistics

purpose:
Define inventory reservation, allocation, and outbound issue effects for sales
orders without taking over order, warehouse, or logistics truth.

canonical_role:
- reservation / allocation / stock issue truth

# ============================================================
# 1. INTAKE FROM ORDER MANAGEMENT
# ============================================================

accepted_input_object:
- order_to_inventory_allocation_request

acceptance_requires:
- source_module = 04.order-management
- target_module = 12.inventory
- sales_order_id present
- requested item / quantity / uom resolvable
- allocation policy resolvable
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- ORDER_UNRESOLVABLE
- ITEM_UNRESOLVABLE
- UOM_UNRESOLVABLE
- ALLOCATION_POLICY_UNRESOLVABLE
- QUANTITY_INVALID
- MISSING_LINEAGE
- DUPLICATE_REQUEST

# ============================================================
# 2. ORDER RESERVATION / ALLOCATION
# ============================================================

object_name:
- inventory_order_reservation

required_fields:
- reservation_id
- company_id
- sales_order_id
- sales_order_line_id
- item_id
- requested_quantity
- reserved_quantity
- quantity_uom
- reservation_status
- priority_class
- created_at
- lineage_reference

allowed_reservation_status:
- requested
- active
- partially_reserved
- reserved
- released
- expired
- cancelled
- short

object_name:
- inventory_order_allocation

required_fields:
- allocation_id
- company_id
- sales_order_id
- sales_order_line_id
- reservation_id_or_null
- item_id
- warehouse_id
- bin_id_or_null
- lot_id_or_null
- serial_id_or_null
- allocated_quantity
- quantity_uom
- allocation_status
- warehouse_request_reference_or_null
- created_at
- lineage_reference

allowed_allocation_status:
- proposed
- allocated
- sent_to_warehouse
- partially_picked
- picked
- issued
- released
- cancelled
- short

rules:
- reservation/allocation is inventory truth
- warehouse pick task is 13 truth
- order fulfillment status is 04 truth
- delivery status is 14 truth

# ============================================================
# 3. INVENTORY TO WAREHOUSE FULFILLMENT REQUEST
# ============================================================

handoff_object_name:
- inventory_to_warehouse_fulfillment_request

required_fields:
- fulfillment_request_id
- company_id
- source_module
- target_module
- sales_order_id
- sales_order_line_set
- allocation_reference_set
- warehouse_id
- requested_pick_window_start_or_null
- requested_pick_window_end_or_null
- priority_class
- request_status
- created_at
- created_by
- lineage_reference

sales_order_line_set_required_fields:
- sales_order_line_id
- item_id
- allocated_quantity
- quantity_uom
- bin_id_or_null
- lot_id_or_null
- serial_id_or_null

allowed_request_status:
- building
- handoff_ready
- sent_to_warehouse
- accepted_by_warehouse
- rejected_by_warehouse
- picking
- picked
- short
- cancelled
- superseded

rules:
- source_module must be 12.inventory
- target_module must be 13.warehouse
- 13 owns physical pick / pack / ship task
- 12 owns stock allocation and issue effect

# ============================================================
# 4. OUTBOUND ISSUE EFFECT
# ============================================================

object_name:
- inventory_outbound_issue_event

meaning:
- inventory-side stock issue effect for outbound fulfillment

required_fields:
- outbound_issue_event_id
- company_id
- sales_order_id
- sales_order_line_id_or_null
- warehouse_confirmation_reference
- item_id
- warehouse_id
- location_id
- bin_id_or_null
- lot_id_or_null
- serial_id_or_null
- issued_quantity
- quantity_uom
- stock_ledger_event_id
- issue_status
- recorded_at
- recorded_by_system_actor
- lineage_reference

allowed_issue_status:
- pending
- ledger_recorded
- reversed
- corrected
- superseded

rules:
- issue event belongs to 12.inventory
- warehouse confirmation is evidence from 13
- issue event does not create delivery proof
- issue event does not create invoice

# ============================================================
# 5. FEEDBACK TO ORDER / WAREHOUSE / LOGISTICS
# ============================================================

allowed_feedback:
- to 04.order-management: allocation accepted / short / issued
- to 13.warehouse: fulfillment request / allocation release / cancellation
- to 14.logistics: shipment readiness context only through warehouse handoff where applicable
- to 60.business-intelligence: allocation and issue snapshot

rules:
- order may update status from inventory feedback
- warehouse executes physical tasks
- logistics delivery does not alter stock issue without defined return/custody workflow

# ============================================================
# 6. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- allocation treated as pick completion
- pick completion treated as delivery completion
- proof of delivery directly creating stock issue
- invoice directly creating stock issue
- order status directly changing stock ledger
- BI dashboard correcting allocation or stock issue

# ============================================================
# 7. DECISION TEST
# ============================================================

decision_test:
- If it is reservation/allocation/stock issue, 12 owns it.
- If it is sales order, 04 owns it.
- If it is warehouse pick/pack/ship, 13 owns it.
- If it is delivery proof, 14 owns it.
- If it is invoice, 05 owns it.

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- sales order allocation boundary fixed
- inventory to warehouse fulfillment request fixed
- outbound issue truth fixed
- order / warehouse / logistics / billing separation fixed

# ============================================================
