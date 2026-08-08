# ============================================================
# SALES MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 01.sales

## 1. Canonical entities

### 1.1 sales_quote
- sales_quote_id
- company_id
- quote_number
- customer_id
- quote_status
- currency_code
- issue_due_date
- validity_end_date
- latest_revision_no
- accepted_revision_no
- issued_at
- accepted_at
- rejected_at
- expired_at
- cancelled_at
- created_by
- created_at
- updated_by
- updated_at

### 1.2 sales_quote_revision
- sales_quote_revision_id
- sales_quote_id
- revision_no
- revision_status
- commercial_snapshot_id
- subtotal_amount
- tax_amount
- total_amount
- customer_display_name_snapshot
- issue_ready_flag
- issue_ready_reason
- approval_request_id
- approval_status_snapshot
- created_by
- created_at

### 1.3 sales_quote_line
- sales_quote_line_id
- sales_quote_revision_id
- line_no
- item_id
- item_code_snapshot
- item_name_snapshot
- quantity
- uom_code_snapshot
- unit_price
- discount_amount
- line_subtotal
- tax_category_snapshot
- tax_amount
- line_total
- requested_delivery_date
- note

### 1.4 sales_quote_attachment
- sales_quote_attachment_id
- sales_quote_id
- sales_quote_revision_id nullable
- attachment_id
- attachment_kind
- attachment_title
- uploaded_by
- uploaded_at

### 1.5 sales_quote_acceptance
- sales_quote_acceptance_id
- sales_quote_id
- revision_no
- acceptance_result
- acceptance_channel
- acceptance_reference_no
- acceptance_note
- accepted_by_party
- accepted_recorded_by
- accepted_recorded_at

### 1.6 sales_quote_handoff_request
- sales_quote_handoff_request_id
- sales_quote_id
- revision_no
- handoff_status
- handoff_payload_version
- handoff_payload_hash
- requested_by
- requested_at
- transmitted_at
- downstream_reference_no
- handoff_error_code
- handoff_error_message

## 2. Status canon

### 2.1 quote_status
- draft
- under_review
- approved_for_issue
- issued
- accepted
- rejected
- expired
- cancelled

### 2.2 revision_status
- working
- review_pending
- issue_ready
- issued_snapshot
- superseded

### 2.3 handoff_status
- pending
- ready
- sent
- accepted_by_downstream
- failed
- cancelled

## 3. Keys and uniqueness
- quote_number unique per company
- sales_quote_id immutable
- revision_no unique inside sales_quote
- accepted revision must match one issued revision only

## 4. Canonical invariants
- accepted quote must reference issued revision
- handoff request allowed only for accepted quote
- issued revision snapshot is immutable
- superseded revision cannot become accepted later
