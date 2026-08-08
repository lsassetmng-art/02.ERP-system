# ============================================================
# ERP REQUEST TO ACTION MAPPING
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines canonical mapping between requests and downstream actions in ERP.

goals:
- show how requests lead to actions
- prevent request/action confusion
- support workflow and contract design
- clarify when requests do not immediately imply actions

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
A request may lead to zero, one, or multiple actions.
A request is not itself the action.

mapping_patterns:
- request -> one action
- request -> multiple actions over time
- request -> review first, action later
- request -> no accepted action

# ============================================================
# 2. CANONICAL MAPPINGS
# ============================================================

canonical_mappings:

  expense_claim_request:
    likely_actions:
    - create_expense_claim_document
    - submit

  payment_request:
    likely_actions:
    - create_payment_request_document
    - submit
    - later approve
    - later execute_payment

  receipt_report_request:
    likely_actions:
    - create_receipt_report_document
    - submit
    - later create_settlement if applicable

  invoice_generation_request:
    likely_actions:
    - generate_invoice_draft
    - possibly finalize later

  purchase_request:
    likely_actions:
    - create_purchase_request_document
    - submit
    - later approve
    - later create_purchase_order

  sales_order_request:
    likely_actions:
    - create_sales_order_document
    - submit
    - later finalize/fulfill

  approval_request:
    likely_actions:
    - approve
    - reject
    - return

  reopen_request:
    likely_actions:
    - governance_accept_reopen_request
    - or governance_reject_reopen_request
    - and only later reopen_period if separate

  cancel_request:
    likely_actions:
    - governance_accept_cancel_request
    - or governance_reject_cancel_request
    - and only later cancel_document if separate

  retry_request:
    likely_actions:
    - retry

# ============================================================
# 3. REVIEW-FIRST RULE
# ============================================================

review_first_rule:
Some requests do not directly trigger domain mutation actions.
They first enter review or governance handling.

examples:
- reopen_request
- cancel_request
- high_risk_operation_request

# ============================================================
# 4. MAPPING CONSEQUENCE RULE
# ============================================================

mapping_consequence_rule:
The existence of a request does not guarantee that all mapped actions will occur.

examples:
- payment_request may never reach execute_payment
- reopen_request may never reach reopen_period
- invoice_generation_request may be rejected before invoice finalization

# ============================================================
# 5. API CONSEQUENCES
# ============================================================

api_rules:
- request contracts should declare likely downstream actions
- response wording must not imply guaranteed later actions
- review gates must be explicit
- mapping may be sync or async

recommended_fields:
- likely_next_actions
- review_required
- mapped_record_id
- downstream_processing_candidate

# ============================================================
# 6. VALIDATION RULES
# ============================================================

validation_rules:
- each major request family should document likely downstream actions
- request mapping must distinguish direct actions from gated later actions
- contracts must not collapse request acceptance into downstream action completion

# ============================================================
# 7. CONCLUSION
# ============================================================

conclusion:
ERP requests and actions must be linked explicitly but kept distinct.

This document becomes the formal basis for:
- request workflow design
- exact intake contract notes
- request/action linkage review
