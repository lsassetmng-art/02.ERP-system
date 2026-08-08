# ============================================================
# ERP EXACT PAYLOAD INTAKE PAYMENT REQUEST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact intake payload and response contract shape
for payment request intake.

endpoint:
POST /erp/intake/requests/payment-requests

semantic_owner:
- layer: 100.business
- module: 150.finance

request_payload_shape:
- company_id
- payment_title
- payee_partner_id
- requested_payment_date
- currency_code
- total_amount
- payment_reason_code optional
- source_document_refs optional
- lines
- attachments optional
- request_reason_code optional
- request_reason_text optional
- idempotency_key optional but recommended

lines_item_shape:
- line_no
- payable_category_code
- description
- line_amount
- tax_amount optional
- source_document_id optional
- project_id optional
- cost_center_id optional

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
- accepted_for_processing does not mean payment executed
- mapped_record_id does not mean approved
- mapped_record_id does not mean journal posted

non_goals:
- approval completion
- payment execution completion
- settlement completion
