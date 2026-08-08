# ============================================================
# APPROVAL INTEGRATION AND EXACT PAYLOAD
# ============================================================

status: draft-exact-design
module: 50.approval

Approval request example:
{
  "source_module": "04.order-management",
  "source_reference_id": "uuid",
  "request_type": "order_release_exception",
  "requested_by": "uuid",
  "summary": "release blocked by threshold exception"
}

Approval result example:
{
  "approval_request_id": "uuid",
  "source_module": "04.order-management",
  "source_reference_id": "uuid",
  "approval_status": "approved",
  "final_decided_at": "2026-04-22T23:00:00+09:00"
}
