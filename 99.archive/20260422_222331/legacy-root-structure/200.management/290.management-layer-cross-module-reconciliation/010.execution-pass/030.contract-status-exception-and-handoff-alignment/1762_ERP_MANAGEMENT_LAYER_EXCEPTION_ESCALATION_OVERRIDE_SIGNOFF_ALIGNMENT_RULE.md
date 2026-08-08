# ============================================================
# ERP MANAGEMENT LAYER EXCEPTION ESCALATION OVERRIDE SIGNOFF ALIGNMENT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1762
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management_layer.exception_escalation_override_signoff_alignment_rule
component: management-layer-exception-escalation-override-signoff-alignment-rule


# RULE

Management-layer exception classes must remain distinct across modules.

Representative distinctions:
- escalation is not override
- override is not signoff
- labor compliance resolution is not governance signoff
- epm variance is not management decision
- company_wide_mbo support closure is not directive closure

