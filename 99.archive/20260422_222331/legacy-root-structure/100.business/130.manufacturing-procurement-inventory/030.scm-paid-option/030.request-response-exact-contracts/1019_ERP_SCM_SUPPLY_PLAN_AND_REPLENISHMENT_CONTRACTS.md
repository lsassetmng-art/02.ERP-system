# ============================================================
# ERP SCM SUPPLY PLAN AND REPLENISHMENT CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1019
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.supply_plan_and_replenishment_contracts
component: scm-supply-plan-and-replenishment-contracts


# SUPPLY PLAN WRITE REQUEST BODY

- planning_horizon_start
- planning_horizon_end
- node_scope_code
- item_scope_code
- plan_basis_code


# REPLENISHMENT SIGNAL WRITE REQUEST BODY

- linked_supply_plan_id
- item_reference_code
- source_node_id
- destination_node_id
- required_date
- suggested_date
- suggested_quantity
- signal_basis_code


# RULE

Supply plan creation and replenishment signal generation
must remain separate controlled actions.

