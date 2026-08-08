# ============================================================
# ERP CANONICAL LAYER TO REAL SCHEMA MAPPING
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the initial mapping hypothesis from canonical ERP layers
to real physical database schemas.

# ============================================================
# 1. PLATFORM CANDIDATE SCHEMAS
# ============================================================

canonical_layer:
- 000.platform

likely_real_schemas:
- auth
- core
- integration
- system
- ops
- audit
- notify
- cron
- storage
- media
- realtime
- net

notes:
These schemas likely contain platform-owned or platform-adjacent structures,
but not every table in them should be assumed purely platform without review.

# ============================================================
# 2. BUSINESS CANDIDATE SCHEMAS
# ============================================================

canonical_layer:
- 100.business

likely_real_schemas:
- accounting
- finance
- sales
- purchase
- inventory
- hr
- manufacturing
- shipping
- billing
- master

notes:
Business truth may be distributed across multiple schemas.
Accounting and finance must remain semantically distinct even if physically related.

# ============================================================
# 3. MANAGEMENT CANDIDATE SCHEMAS
# ============================================================

canonical_layer:
- 200.management

likely_real_schemas:
- approval
- governance
- govern
- compliance
- planning
- licensing
- ci
- devops

notes:
Not every governance/control concern may live only here.
Some supporting policy tables may also appear in core/system/auth.

# ============================================================
# 4. ANALYTICS CANDIDATE SCHEMAS
# ============================================================

canonical_layer:
- 300.analytics

likely_real_schemas:
- analytics
- ai

notes:
AI-related schemas may contain both analytics and management-support meaning,
so semantic review is required before final ownership.

# ============================================================
# 5. MIXED OR AMBIGUOUS SCHEMAS
# ============================================================

mixed_or_ambiguous_schemas:
- core
- ops
- system
- ai
- govern

reason:
These names suggest cross-cutting or legacy mixed responsibility.
They should not be treated as canonically pure without table-level review.

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
This is an initial layer-to-schema mapping hypothesis only.

It must be refined at:
- schema level
- table level
- mutation authority level
- contract linkage level
