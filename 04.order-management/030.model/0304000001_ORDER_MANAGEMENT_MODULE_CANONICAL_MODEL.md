# ============================================================
# ORDER MANAGEMENT MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 04.order-management

## 1. Canonical entities

### 1.1 om_sales_order
- om_sales_order_id
- company_id
- sales_order_number
- order_source_type
- source_sales_quote_id nullable
- source_sales_quote_revision_no nullable
- customer_id
- ship_to_id
- order_status
- order_date
- requested_ship_date
- currency_code
- latest_revision_no
- confirmed_at nullable
- released_at nullable
- fulfilled_at nullable
- cancelled_at nullable
- closed_at nullable
- created_by
- created_at
- updated_by
- updated_at

### 1.2 om_sales_order_revision
- om_sales_order_revision_id
- om_sales_order_id
- revision_no
- revision_reason
- revision_status
- subtotal_amount
- tax_amount
- total_amount
- approval_request_id nullable
- approval_status_snapshot nullable
- created_by
- created_at

### 1.3 om_sales_order_line
- om_sales_order_line_id
- om_sales_order_revision_id
- line_no
- item_id
- item_code_snapshot
- item_name_snapshot
- ordered_quantity
- open_quantity
- allocated_quantity
- fulfilled_quantity
- cancelled_quantity
- uom_code_snapshot
- unit_price
- discount_amount
- line_subtotal
- tax_category_snapshot
- tax_amount
- line_total
- requested_ship_date
- warehouse_preference_id nullable
- note

### 1.4 om_order_hold
- om_order_hold_id
- om_sales_order_id
- hold_type
- hold_reason_code
- hold_status
- placed_by
- placed_at
- released_by nullable
- released_at nullable
- release_note nullable

### 1.5 om_allocation_request
- om_allocation_request_id
- om_sales_order_id
- request_status
- requested_by
- requested_at
- transmitted_at nullable
- last_response_at nullable
- allocation_reference_no nullable
- error_code nullable
- error_message nullable

### 1.6 om_fulfillment_progress
- om_fulfillment_progress_id
- om_sales_order_id
- fulfillment_status
- total_ordered_quantity
- total_allocated_quantity
- total_shipped_quantity
- total_delivered_quantity
- total_cancelled_quantity
- last_progress_at
- downstream_summary_note

### 1.7 om_order_cancellation
- om_order_cancellation_id
- om_sales_order_id
- cancellation_scope
- cancellation_reason_code
- cancelled_quantity_summary
- cancelled_by
- cancelled_at
- cancellation_note

## 2. Status canon

### 2.1 order_status
- draft
- confirmed
- released
- partially_fulfilled
- fulfilled
- on_hold
- cancelled
- closed

### 2.2 revision_status
- working
- confirmed_snapshot
- superseded

### 2.3 hold_status
- active
- released
- expired

### 2.4 request_status
- pending
- sent
- accepted_by_downstream
- failed
- cancelled

### 2.5 fulfillment_status
- not_started
- allocated_partial
- allocated_full
- shipped_partial
- shipped_full
- delivered_partial
- delivered_full
- cancelled_partial
- closed

## 3. Keys and uniqueness
- sales_order_number unique per company
- om_sales_order_id immutable
- revision_no unique inside order
- active hold may have multiple records but active blocking rule is evaluated canonically

## 4. Canonical invariants
- released order must not remain in draft revision state
- fulfilled quantity + cancelled quantity must not exceed ordered quantity
- hold active blocks release and selected downstream requests
- billing reference surfaces only for billable fulfilled conditions
