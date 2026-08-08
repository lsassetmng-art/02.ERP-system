# ============================================================
# ERP OBJECTIVE FUNCTION EXCEPTION HIERARCHY DELEGATION POLICY OWNERSHIP MAP
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3192
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.objective_function_exception_hierarchy_delegation_policy.ownership_map
component: objective-function-exception-hierarchy-delegation-policy-ownership-map


# OWNERSHIP MAP

Optimization owns:
- optimization-cycle interpretation
- lane-assignment interpretation

Org-level governance owns:
- org-wide governance interpretation
- org exception interpretation

Objective function / exception hierarchy / delegation policy owns:
- objective interpretation
- exception routing interpretation
- delegation interpretation
- delegated-decision interpretation

Management owns:
- higher-order approval and policy truth

