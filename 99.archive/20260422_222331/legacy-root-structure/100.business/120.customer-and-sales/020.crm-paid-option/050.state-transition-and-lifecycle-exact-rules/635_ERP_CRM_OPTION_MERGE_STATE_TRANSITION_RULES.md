# ============================================================
# ERP CRM OPTION MERGE STATE TRANSITION RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-635
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.merge_state.transition_rules
component: crm-option-merge-state-transition-rules


# PURPOSE

Defines merge as a distinct identity transition.


# REQUIRED MERGE PRECONDITIONS

- primary_object_id exists
- secondary_object_id exists
- object_type matches
- merge authority exists
- merge reason exists
- field resolution set exists when ambiguity exists


# TRANSITION RESULT

For the secondary/source object:

- status -> merged
- merged_into_account_id or equivalent target reference set
- audit trace required

For the primary/target object:

- remains active or current valid status
- receives resolved field state
- receives preserved trace references where applicable


# PROHIBITIONS

- merge through ordinary update contract
- merge without preserved reference trace
- merge across incompatible object families
- merge archived source without explicit controlled handling rule

