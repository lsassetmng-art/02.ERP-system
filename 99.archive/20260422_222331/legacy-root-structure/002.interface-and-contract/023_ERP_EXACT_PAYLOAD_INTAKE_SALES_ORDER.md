# ============================================================
# ERP EXACT PAYLOAD INTAKE SALES ORDER
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Fixes the exact intake payload and response contract shape
for sales order intake.

endpoint:
POST /erp/intake/requests/sales-orders

semantic_owner:
- layer: 100.business
- module: 110.sales

request_payload_shape:
- company_id
- order_title optional
- customer_partner_id
- order_date
- requested_delivery_date optional
- currency_code
- total_amount
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
- unit_price
- line_amount
- tax_amount optional
- warehouse_id optional
- project_id optional

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
- accepted_for_processing does not mean order approved
- mapped_record_id does not mean shipment created
- mapped_record_id does not mean invoice finalized

non_goals:
- shipment completion
- invoice completion
- receivable recognition
