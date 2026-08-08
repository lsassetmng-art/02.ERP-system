# ============================================================
# ERP CROSS LAYER DEPENDENCY DECLARATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1197
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.cross_layer_dependency_declaration.rule
component: cross-layer-dependency-declaration-rule


# RULE

When a business or management module depends on
base-layer semantics, that dependency should be explicit.

Representative dependency families:
- shared references
- source-truth interpretation
- option enablement interpretation
- permission family semantics
- audit-sensitive action semantics

