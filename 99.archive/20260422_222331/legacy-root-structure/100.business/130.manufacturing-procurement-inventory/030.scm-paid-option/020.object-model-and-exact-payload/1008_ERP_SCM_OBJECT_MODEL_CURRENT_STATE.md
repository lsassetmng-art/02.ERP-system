# ============================================================
# ERP SCM OBJECT MODEL CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1008
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.scm_option.object_model.current_state
component: scm-object-model-current-state


# ABSTRACT

Defines the current state for the first exact object
model and payload pass for the SCM paid option.

This pass fixes:
- network/supplier/lane separation
- supply plan and replenishment signal treatment
- transfer recommendation treatment
- disruption and resilience object treatment

