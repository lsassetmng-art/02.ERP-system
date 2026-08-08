# ============================================================
# ERP EXACT PAYLOAD INTAKE EXPENSE CLAIM
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact intake payload and response contract shape
for expense claim intake.

endpoint:
POST /erp/intake/requests/expense-claims

semantic_owner:
- layer: 100.business
- module: expense-claim business owner

request_payload_shape:
- company_id
- claim_title
- claimant_actor_id optional if not implicit by auth
- expense_date
- currency_code
- total_amount
- lines
- attachments optional
- request_reason_code optional
- request_reason_text optional
- idempotency_key optional but recommended

lines_item_shape:
- line_no
- expense_category_code
- description
- line_amount
- tax_amount optional
- project_id optional
- cost_center_id optional
- receipt_attachment_ref optional

request_example_fields:
company_id:
  type: uuid
claim_title:
  type: text
expense_date:
  type: date
currency_code:
  type: code
total_amount:
  type: numeric
lines:
  type: array

response_payload_shape:
- correlation_id
- request_id
- request_status
- acceptance_status
- mapped_record_id optional
- mapped_record_type optional
- review_required
- warnings
- errors

response_notes:
- accepted_for_processing does not mean approved
- mapped_record_id does not mean finalized

non_goals:
- approval completion
- reimbursement execution
- accounting posting
