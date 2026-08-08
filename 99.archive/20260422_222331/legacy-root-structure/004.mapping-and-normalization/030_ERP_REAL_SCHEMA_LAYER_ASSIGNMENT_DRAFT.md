# ============================================================
# ERP REAL SCHEMA LAYER ASSIGNMENT DRAFT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first draft of assigning real schemas
to canonical ERP layers.

# ============================================================
# 1. 000.platform DRAFT
# ============================================================

canonical_layer:
- 000.platform

draft_assigned_schemas:
- audit
- auth
- core
- cron
- devops
- integration
- media
- net
- notify
- ops
- realtime
- storage
- system
- tenant
- vault
- workflow
- staging

notes:
- core, ops, and system are likely mixed and require table-level review
- staging is operational support, not authoritative business truth
- audit is platform-owned structurally even though cross-cutting semantically

# ============================================================
# 2. 100.business DRAFT
# ============================================================

canonical_layer:
- 100.business

draft_assigned_schemas:
- accounting
- billing
- finance
- hr
- inventory
- manufacturing
- master
- purchase
- sales
- shipping

notes:
- billing may span business and management/reporting concerns
- master is likely platform-data-adjacent and business-adjacent, so table-level review is needed
- accounting and finance remain semantically separate even if operationally close

# ============================================================
# 3. 200.management DRAFT
# ============================================================

canonical_layer:
- 200.management

draft_assigned_schemas:
- approval
- compliance
- govern
- governance
- planning
- licensing
- ci

notes:
- approval is strongly management-facing by semantic meaning
- govern and governance must be reviewed together for overlap and separation
- ci may be management support or platform-devops support depending tables

# ============================================================
# 4. 300.analytics DRAFT
# ============================================================

canonical_layer:
- 300.analytics

draft_assigned_schemas:
- analytics
- ai

notes:
- ai may also contain management-support or policy-support tables
- analytics views should not be mistaken for source-of-truth business tables

# ============================================================
# 5. NON-CANONICAL-APP-MEANING-FIRST SUPPORT SCHEMAS
# ============================================================

support_or_infra_schemas:
- extensions
- graphql
- graphql_public
- pgbouncer
- public

notes:
These should not be treated as business-domain or management-domain truth
without very specific evidence.

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
This is a draft layer assignment only.
Final ownership must be decided at table level,
especially for mixed schemas such as core, system, ops, ai, and govern.
