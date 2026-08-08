# ============================================================
# ERP DEPENDENCY GROUPING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1960
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.dependency_grouping.rule
component: dependency-grouping-rule


# RULE

Dependency grouping should prefer:
1. source truth layers first
2. oversight and assurance next
3. derived interpretation after source and assurance
4. cross-domain reporting after all core contracts stabilize

