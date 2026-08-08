# ============================================================
# ERP REAL SCHEMA INVENTORY FILLED
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first filled real-schema inventory
based on the uploaded ERP schema summary/full files.

review_basis:
- erp_schema_table_column_summary.txt
- erp_schema_table_column_full.txt

# ============================================================
# 1. SCHEMA LIST
# ============================================================

real_schema_list:
- accounting
- ai
- analytics
- approval
- audit
- auth
- billing
- ci
- compliance
- core
- cron
- devops
- extensions
- finance
- govern
- governance
- graphql
- graphql_public
- hr
- integration
- inventory
- licensing
- manufacturing
- master
- media
- net
- notify
- ops
- pgbouncer
- planning
- public
- purchase
- realtime
- sales
- shipping
- staging
- storage
- system
- tenant
- vault
- workflow

# ============================================================
# 2. INITIAL GROUPING
# ============================================================

likely_business_facing:
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

likely_management_facing:
- approval
- compliance
- govern
- governance
- planning
- licensing

likely_analytics_facing:
- analytics
- ai

likely_platform_facing:
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

infra_or_system_support_not_business_truth_first:
- extensions
- graphql
- graphql_public
- pgbouncer
- public

# ============================================================
# 3. IMPORTANT NOTE
# ============================================================

important_note:
This grouping is an initial inventory grouping,
not a final table-by-table ownership judgment.

Some schemas are likely mixed and must remain under review.

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
The real ERP database uses a much more fine-grained physical schema split
than the canonical ERP design, so inventory and mapping must proceed
through grouped review and then table-level review.
