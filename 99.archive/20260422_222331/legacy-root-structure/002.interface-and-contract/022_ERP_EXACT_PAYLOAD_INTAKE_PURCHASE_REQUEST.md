# ============================================================
# ERP EXACT PAYLOAD INTAKE PURCHASE REQUEST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact intake payload and response contract shape
for purchase request intake.

endpoint:
POST /erp/intake/requests/purchase-requests

semantic_owner:
- layer: 100.business
- module: 120.purchase

request_payload_shape:
- company_id
- request_title
- requester_actor_id optional if implicit by auth
- needed_by_date optional
- currency_code
- total_amount_estimate optional
- lines
- attachments optional
- request_reason_code optional
- request_reason_text optional
- idempotency_key optional but recommended

lines_item_shape:
- line_no
- product_id optional
- item_description
- quantity
- unit_code
- estimated_unit_price optional
- estimated_line_amount optional
- supplier_partner_id optional
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
- accepted_for_processing does not mean approved
- mapped_record_id does not mean purchase order created
- mapped_record_id does not mean goods received

non_goals:
- approval completion
- purchase order issuance
- supplier confirmation
