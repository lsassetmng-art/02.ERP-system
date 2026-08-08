# ============================================================
# ERP COMPANY WIDE MBO EPM LINKAGE AND TRACEABILITY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-893
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.epm_linkage_and_traceability_rule
component: company-wide-mbo-epm-linkage-and-traceability-rule


# RULE

Every material company_wide_mbo object should preserve
traceability back to EPM framework objects when relevant.

Representative linkage set:
- linked_objective_id
- linked_review_cycle_id
- linked_plan_cycle_id where relevant


# CONSEQUENCE

company_wide_mbo deeper objects enrich enterprise-goal
operation, but do not become free-floating objects detached
from EPM framework context.

