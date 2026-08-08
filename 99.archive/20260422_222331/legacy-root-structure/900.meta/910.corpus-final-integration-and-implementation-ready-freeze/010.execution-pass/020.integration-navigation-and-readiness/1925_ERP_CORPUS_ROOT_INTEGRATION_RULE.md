# ============================================================
# ERP CORPUS ROOT INTEGRATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1925
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.corpus.root_integration.rule
component: corpus-root-integration-rule


# RULE

All major ERP design lines must be readable from root-level domain folders.

Root integration must preserve:
- domain-level separation
- cross-domain continuity
- implementation-ready reading order
- meta-level freeze and handover visibility

