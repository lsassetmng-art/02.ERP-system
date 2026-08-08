# ============================================================
# ERP SCM OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1009
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.object_family_set
component: scm-object-family-set


# PRIMARY OBJECT FAMILIES

- scm_supply_network_node
- scm_supplier_profile
- scm_supply_lane
- scm_supply_plan
- scm_replenishment_signal
- scm_transfer_order_recommendation
- scm_disruption_event
- scm_resilience_assessment


# RULE

Network node is not supplier profile.
Supply lane is not supply plan.
Replenishment signal is not transfer recommendation.
Disruption event is not resilience assessment.

