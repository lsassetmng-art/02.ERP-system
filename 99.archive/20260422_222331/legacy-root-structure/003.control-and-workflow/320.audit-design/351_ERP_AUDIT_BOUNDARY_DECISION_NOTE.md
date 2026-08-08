# ============================================================
# ERP AUDIT BOUNDARY DECISION NOTE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the first-pass audit boundary decisions.

boundary_decisions:
- audit truth must stay distinct from business truth
- audit truth must stay distinct from notify/support layers
- audit export queues must stay distinct from audit truth
- cross-cutting infrastructure must stay distinct from audit-domain truth objects
- status history and anomaly events should remain inside audit architecture,
  but not be collapsed into the same role as generic audit_event

main_result:
Audit architecture now has explicit domain boundaries,
not only object lists.

conclusion:
Boundary clarity is now strong enough
to support deeper audit design work without mixing roles.
