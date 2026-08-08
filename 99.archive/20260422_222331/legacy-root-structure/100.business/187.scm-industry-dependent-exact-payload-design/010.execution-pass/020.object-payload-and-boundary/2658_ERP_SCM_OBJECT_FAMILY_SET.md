# ============================================================
# ERP SCM OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2658
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.scm.object_family_set
component: scm-object-family-set


# PRIMARY OBJECT FAMILIES

- supply_network_node_registry
- inter_node_transfer_plan_case
- supply_commitment_coordination_case
- service_level_exception_case
- supply_risk_snapshot

# RULE

Network node is not transfer plan.
Transfer plan is not supply commitment coordination.
Supply commitment coordination is not service-level exception.
Service-level exception is not supply-risk snapshot.

