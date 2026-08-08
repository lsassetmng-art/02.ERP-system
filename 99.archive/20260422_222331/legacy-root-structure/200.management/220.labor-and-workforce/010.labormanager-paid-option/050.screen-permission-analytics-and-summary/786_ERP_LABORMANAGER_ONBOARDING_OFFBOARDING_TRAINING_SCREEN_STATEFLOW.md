# ============================================================
# ERP LABORMANAGER ONBOARDING OFFBOARDING TRAINING SCREEN STATEFLOW
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-786
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.onboarding_offboarding_training.screen_stateflow
component: labormanager-onboarding-offboarding-training-screen-stateflow


# PRIMARY STATES

- case_loading
- case_ready
- compliance_hold_visible
- completion_confirmation_required
- blocked_by_compliance
- permission_denied
- failed


# RULE

Onboarding/offboarding case completion must not be
presented as ordinary edit when blocking conditions remain.

Training completion and compliance pass remain distinct.

