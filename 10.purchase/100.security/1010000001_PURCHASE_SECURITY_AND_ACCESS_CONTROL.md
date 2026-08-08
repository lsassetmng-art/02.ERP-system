# ============================================================
# PURCHASE SECURITY AND ACCESS CONTROL
# ============================================================

status: draft-exact-design
module: 10.purchase

Access scopes:
- purchase.order.read
- purchase.order.write
- purchase.order.issue
- purchase.order.cancel
- purchase.order.admin.correct

Audit:
- PO issue logged
- supplier acknowledgement logged
- cancellation logged
