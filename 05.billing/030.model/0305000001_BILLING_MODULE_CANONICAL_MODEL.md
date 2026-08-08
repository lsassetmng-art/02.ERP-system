# ============================================================
# BILLING MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 05.billing

## 1. Canonical entities

### 1.1 billing_invoice
- billing_invoice_id
- company_id
- invoice_number
- customer_id
- bill_to_id
- invoice_status
- invoice_date
- due_date
- currency_code
- latest_revision_no
- issued_at nullable
- cancelled_at nullable
- credited_at nullable
- closed_at nullable
- payment_term_id
- created_by
- created_at
- updated_by
- updated_at

### 1.2 billing_invoice_revision
- billing_invoice_revision_id
- billing_invoice_id
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

### 1.3 billing_invoice_line
- billing_invoice_line_id
- billing_invoice_revision_id
- line_no
- source_module
- source_reference_id
- item_id nullable
- item_code_snapshot
- item_name_snapshot
- billed_quantity
- uom_code_snapshot
- unit_price
- discount_amount
- line_subtotal
- tax_category_snapshot
- tax_amount
- line_total
- note

### 1.4 billing_billable_event_consumption
- billing_billable_event_consumption_id
- source_module
- source_reference_id
- billable_event_type
- billable_event_occurred_at
- consumption_status
- consumed_by_invoice_id nullable
- consumed_by_invoice_line_id nullable
- payload_hash
- created_at
- updated_at

### 1.5 billing_schedule
- billing_schedule_id
- customer_id
- schedule_type
- billing_cycle
- next_billing_date
- schedule_status
- related_reference_id nullable
- created_at
- updated_at

### 1.6 billing_credit_memo_request
- billing_credit_memo_request_id
- billing_invoice_id
- request_status
- request_reason_code
- requested_amount
- requested_by
- requested_at
- processed_at nullable
- downstream_reference_no nullable

### 1.7 billing_accounting_reference
- billing_accounting_reference_id
- billing_invoice_id
- reference_type
- accounting_reference_status
- payload_version
- payload_hash
- transmitted_at nullable
- acknowledged_at nullable
- error_code nullable
- error_message nullable

## 2. Status canon

### 2.1 invoice_status
- draft
- reviewed
- issued
- partially_settled_reference
- settled_reference
- cancelled
- credited
- closed

### 2.2 revision_status
- working
- issue_ready
- issued_snapshot
- superseded

### 2.3 consumption_status
- pending
- consumed
- skipped
- reversed

### 2.4 schedule_status
- active
- paused
- completed
- cancelled

### 2.5 request_status
- pending
- approved
- rejected
- processed
- cancelled

### 2.6 accounting_reference_status
- pending
- sent
- acknowledged
- failed
- cancelled

## 3. Keys and uniqueness
- invoice_number unique per company
- billing_invoice_id immutable
- billable event consumption idempotent by payload_hash and source reference
- revision_no unique inside invoice

## 4. Canonical invariants
- issued invoice snapshot is immutable
- consumed billable event must not be double-billed unless reversal flow exists
- credited/cancelled invoice remains historically referencable
- Billing does not become accounting truth
