# ============================================================
# ERP CROSS FAMILY RECOVERY MODEL CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2844
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.cross_family_recovery_model.current_state
component: cross-family-recovery-model-current-state


# ABSTRACT

Defines the current state for the official recovery-model pass.

The current need is to stop hidden retry and replay behavior
from becoming implicit canonical behavior.
All recovery paths must now be fixed as named official surfaces.

