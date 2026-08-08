# ============================================================
# ERP SUPPRESSION OVERRIDE AND POSTINCIDENT CLOSURE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2925
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.suppression_override_and_postincident_closure.rule
component: suppression-override-and-postincident-closure-rule


# RULE

Suppression override and postincident closure progression must preserve:
- linked alert rule visibility
- override timing visibility
- review owner visibility
- root-cause and followup visibility
- closed and revoked trace when applicable

