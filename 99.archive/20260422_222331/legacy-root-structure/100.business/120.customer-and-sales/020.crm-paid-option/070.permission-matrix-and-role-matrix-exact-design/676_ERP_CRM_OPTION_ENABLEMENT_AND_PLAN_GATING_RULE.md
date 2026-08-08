# ============================================================
# ERP CRM OPTION ENABLEMENT AND PLAN GATING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-676
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.enablement_and_plan_gating_rule
component: crm-option-enablement-and-plan-gating-rule


# RULE

Permission evaluation must occur after option/plan gating.

Representative evaluation order:

1. company / tenant CRM option state
2. actor role set
3. capability check
4. object state check
5. transition rule check
6. audit-sensitive consequence handling


# CONSEQUENCE

A role that normally has crm_account_write still
cannot write when:
- CRM option is not enabled
- CRM option is suspended and policy blocks writes
- CRM option is archived


# PROHIBITION

Do not let role grants bypass option-state gating.

