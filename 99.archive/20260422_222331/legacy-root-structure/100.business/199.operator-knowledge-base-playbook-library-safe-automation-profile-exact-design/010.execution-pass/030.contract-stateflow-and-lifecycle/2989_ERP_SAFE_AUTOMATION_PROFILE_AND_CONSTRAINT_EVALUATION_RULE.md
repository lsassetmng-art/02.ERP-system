# ============================================================
# ERP SAFE AUTOMATION PROFILE AND CONSTRAINT EVALUATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2989
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.safe_automation_profile_and_constraint_evaluation.rule
component: safe-automation-profile-and-constraint-evaluation-rule


# RULE

Safe automation profile and constraint evaluation progression must preserve:
- linked profile reference
- linked automation action policy reference
- risk and gate visibility
- dry-run and rollback visibility
- violated, bypassed, and resolved trace when applicable

