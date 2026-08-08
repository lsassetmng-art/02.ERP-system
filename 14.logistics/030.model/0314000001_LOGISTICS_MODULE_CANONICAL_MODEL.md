# ============================================================
# LOGISTICS MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 14.logistics

Entities:
- logistics_dispatch
- logistics_transport_assignment
- logistics_delivery_execution
- logistics_route_plan
- logistics_exception

Status canon:
- pending
- dispatched
- in_transit
- delivered
- failed
- cancelled
