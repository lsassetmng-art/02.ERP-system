# ============================================================
# ERP DECAY_REBASELINE_AND_SUPERSESSION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3054
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.decay_rebaseline_and_supersession.rule
component: decay-rebaseline-and-supersession-rule


# RULE

Decay, rebaseline, and supersession progression must preserve:
- linked stale policy visibility
- linked superseded profile visibility
- rebaseline reason visibility
- applied timing visibility
- restored and superseded trace when applicable

