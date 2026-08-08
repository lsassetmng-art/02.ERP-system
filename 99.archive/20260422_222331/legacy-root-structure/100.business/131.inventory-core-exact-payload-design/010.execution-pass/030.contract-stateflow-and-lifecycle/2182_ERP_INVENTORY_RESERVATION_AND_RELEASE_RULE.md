# ============================================================
# ERP INVENTORY RESERVATION AND RELEASE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2182
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.inventory.reservation_and_release.rule
component: inventory-reservation-and-release-rule


# RULE

Reservation may be opened, allocated, released, or expired,
but reservation truth must remain separate from sales order truth.

Release should preserve:
- originating sales reference
- release reason
- affected quantity
- release actor
- release timestamp

