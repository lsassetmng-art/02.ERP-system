# ============================================================
# ERP SCM SUPPLY PLAN AND REPLENISHMENT RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1025
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.supply_plan_and_replenishment.rules
component: scm-supply-plan-and-replenishment-rules


# SUPPLY PLAN STATUS SET

- draft
- open
- locked
- closed
- archived


# REPLENISHMENT STATUS SET

- detected
- reviewed
- approved
- rejected
- archived


# RULE

Locked supply plan is not closed plan.
Approved replenishment signal is not converted transfer action.

