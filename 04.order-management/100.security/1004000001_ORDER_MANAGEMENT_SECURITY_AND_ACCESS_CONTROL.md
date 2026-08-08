# ============================================================
# ORDER MANAGEMENT SECURITY AND ACCESS CONTROL
# ============================================================

status: draft-exact-design
module: 04.order-management

## 1. Access scopes
- om.order.read
- om.order.write
- om.order.release
- om.order.hold.manage
- om.order.cancel
- om.order.handoff.execute
- om.order.admin.correct

## 2. Segregation of duties
- creator may draft/confirm
- release permission may be narrower
- hold release may require elevated authority
- cancellation of large/open orders may require additional gate

## 3. Sensitive surfaces
- customer commercial/order data
- ship-to destinations
- hold reasons
- downstream handoff identifiers

## 4. Audit requirements
- release logged
- hold placement/release logged
- cancellation logged
- downstream request hash/reference logged
