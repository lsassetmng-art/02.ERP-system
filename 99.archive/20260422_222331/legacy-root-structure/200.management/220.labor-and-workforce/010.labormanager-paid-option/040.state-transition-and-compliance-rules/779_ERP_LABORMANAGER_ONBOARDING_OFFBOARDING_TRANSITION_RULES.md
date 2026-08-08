# ============================================================
# ERP LABORMANAGER ONBOARDING OFFBOARDING TRANSITION RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-779
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.labormanager_option.onboarding_offboarding.transition_rules
component: labormanager-onboarding-offboarding-transition-rules


# ONBOARDING STATUS SET

- planned
- in_progress
- compliance_hold
- completed
- canceled


# OFFBOARDING STATUS SET

- planned
- in_progress
- access_revocation_pending
- asset_return_pending
- completed
- canceled


# RULE

Onboarding/offboarding are governed case progressions.
They must preserve owner, checklist state, and hold reasons.

