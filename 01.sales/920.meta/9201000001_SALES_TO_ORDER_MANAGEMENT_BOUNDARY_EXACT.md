# ============================================================
# SALES TO ORDER MANAGEMENT BOUNDARY EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 01.sales
consumer_module: 04.order-management

purpose:
Define sales quote, sales condition, and authorized order basis handoff to
order management without transferring accepted order ownership to sales.

canonical_role:
- sales quote / sales commercial condition / pre-order truth

# ============================================================
# 1. CORE SALES OBJECTS
# ============================================================

core_objects:
- sales_quote
- sales_quote_line
- sales_price_condition
- sales_discount_condition
- sales_commercial_terms
- sales_quote_approval_package
- customer_purchase_intent_evidence
- sales_to_order_authorized_order_basis

# ============================================================
# 2. SALES QUOTE
# ============================================================

object_name:
- sales_quote

meaning:
- canonical pre-order offer or quote to customer

required_fields:
- sales_quote_id
- company_id
- customer_id
- quote_number
- quote_status
- quote_date
- valid_from
- valid_until
- currency_code
- sales_channel_or_null
- sales_person_or_role_reference
- quote_line_set
- price_condition_reference_set
- discount_condition_reference_set
- commercial_terms_reference
- approval_reference_or_null
- customer_acceptance_evidence_or_null
- created_at
- created_by
- updated_at
- updated_by
- lineage_reference

allowed_quote_status:
- draft
- review_pending
- approved
- issued
- accepted_by_customer
- rejected_by_customer
- expired
- converted_to_order
- cancelled
- superseded

rules:
- quote is not accepted sales order
- accepted_by_customer may become order basis
- converted_to_order requires handoff to 04.order-management
- quote correction requires new quote version or supersession after issue

# ============================================================
# 3. SALES QUOTE LINE
# ============================================================

object_name:
- sales_quote_line

required_fields:
- sales_quote_line_id
- sales_quote_id
- line_number
- item_id_or_service_id
- proposed_quantity
- quantity_uom
- proposed_unit_price
- currency_code
- discount_reference_or_null
- tax_condition_reference_or_null
- requested_delivery_date_or_null
- fulfillment_location_preference_or_null
- line_status
- lineage_reference

allowed_line_status:
- draft
- approved
- issued
- accepted
- rejected
- expired
- converted_to_order
- cancelled
- superseded

rules:
- proposed quantity is not order quantity until accepted into 04
- proposed price is sales condition basis, not invoice truth
- billing amount is determined by 05.billing under billing policy

# ============================================================
# 4. AUTHORIZED ORDER BASIS HANDOFF
# ============================================================

handoff_object_name:
- sales_to_order_authorized_order_basis

meaning:
- approved / accepted sales basis for creating or updating customer order

required_fields:
- authorized_order_basis_id
- company_id
- source_module
- target_module
- sales_quote_id
- customer_id
- customer_acceptance_evidence_reference
- commercial_terms_reference
- price_condition_reference_set
- discount_condition_reference_set
- quote_line_basis_set
- requested_fulfillment_reference_or_null
- approval_reference_or_null
- package_status
- created_at
- created_by
- lineage_reference

quote_line_basis_required_fields:
- quote_line_basis_id
- sales_quote_line_id
- item_id_or_service_id
- accepted_quantity
- quantity_uom
- accepted_unit_price_or_condition_reference
- requested_delivery_date_or_null
- fulfillment_note_or_null

allowed_package_status:
- building
- validation_pending
- handoff_ready
- handed_off
- accepted_by_order_management
- rejected_by_order_management
- superseded
- cancelled

rules:
- source_module must be 01.sales
- target_module must be 04.order-management
- only handoff_ready may be accepted by 04
- accepted handoff may create sales order
- handoff itself is not sales order

# ============================================================
# 5. ORDER MANAGEMENT ACCEPTANCE / REJECTION
# ============================================================

order_acceptance_requires:
- customer_id present
- customer acceptance evidence present
- quote line basis exists
- item / service scope resolvable
- price / terms basis resolvable
- package_status = handoff_ready
- lineage_reference present

reject_reason_codes:
- INVALID_SCHEMA
- CUSTOMER_UNRESOLVABLE
- CUSTOMER_ACCEPTANCE_MISSING
- ITEM_SCOPE_UNRESOLVABLE
- PRICE_CONDITION_UNRESOLVABLE
- TERMS_UNRESOLVABLE
- PACKAGE_NOT_READY
- MISSING_LINEAGE
- DUPLICATE_OR_SUPERSEDED_BASIS

rules:
- rejection does not delete sales quote
- sales may issue corrected successor basis
- order management may not rewrite quote truth directly

# ============================================================
# 6. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- quote accepted status treated as sales order without 04 intake
- quote line quantity treated as inventory allocation
- quote price treated as invoice amount without billing policy
- order management editing quote approval in place
- BI dashboard approving quote conversion
- audit finding converting quote to order directly

# ============================================================
# 7. DECISION TEST
# ============================================================

decision_test:
- If it is quote / selling condition / customer pre-order acceptance basis, 01 owns it.
- If it is accepted customer order and fulfillment orchestration, 04 owns it.
- If it is invoice, 05 owns it.

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- sales quote truth fixed
- sales to order handoff fixed
- order acceptance / rejection baseline fixed
- quote vs order boundary fixed

# ============================================================
