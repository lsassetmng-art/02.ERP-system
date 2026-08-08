# ============================================================
# ERP MANAGEMENT VS BUSINESS BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2254
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management_vs_business.boundary_rule
component: management-vs-business-boundary-rule


# RULE

Management owns:
- review truth
- approval truth
- execution-request truth
- escalation truth

Business owns:
- source transaction truth

# CONSEQUENCE

A review case is not sales, purchase, or inventory source truth.
Approval visibility may govern business progression,
but it does not replace business-owned transaction truth.

