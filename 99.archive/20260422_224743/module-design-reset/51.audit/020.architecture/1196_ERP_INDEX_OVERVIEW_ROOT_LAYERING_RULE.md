# ============================================================
# ERP INDEX OVERVIEW ROOT LAYERING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1196
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.index_overview_root.layering_rule
component: index-overview-root-layering-rule


# RULE

Navigation should be read in this order:

1. local INDEX and OVERVIEW
2. local canonical documents
3. family-level horizontal summaries where present
4. whole-system summary layers where present

Higher layers summarize lower layers,
but do not replace their local canonical ownership.

