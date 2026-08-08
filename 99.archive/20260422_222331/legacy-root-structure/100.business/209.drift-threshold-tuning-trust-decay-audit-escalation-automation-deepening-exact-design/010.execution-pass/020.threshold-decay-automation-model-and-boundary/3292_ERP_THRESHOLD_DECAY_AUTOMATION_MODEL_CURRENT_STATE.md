# ============================================================
# ERP THRESHOLD DECAY AUTOMATION MODEL CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3292
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.threshold_decay_automation_model.current_state
component: threshold-decay-automation-model-current-state


# ABSTRACT

Defines the current state for the official threshold-decay-automation-model pass.

The current need is to stop ad hoc threshold adjustment
and manual trust decay handling
from becoming implicit canonical behavior.
All important threshold, decay,
and automation transitions
must now be fixed as named official surfaces.

