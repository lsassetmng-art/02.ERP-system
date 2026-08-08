# ============================================================
# PROCUREMENT MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 11.procurement

Entities:
- procurement_request
- procurement_rfq
- procurement_rfq_line
- procurement_supplier_response
- procurement_award_decision
- procurement_po_request

Status canon:
- requested
- rfq_open
- responses_received
- comparison_ready
- awarded
- po_request_ready
- closed

Invariant:
- awarded supplier decision is required before PO request ready
