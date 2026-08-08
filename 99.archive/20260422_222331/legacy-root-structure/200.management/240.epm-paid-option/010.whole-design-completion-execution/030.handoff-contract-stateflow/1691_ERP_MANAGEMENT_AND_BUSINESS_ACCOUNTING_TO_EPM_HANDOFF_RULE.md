# ============================================================
# ERP MANAGEMENT AND BUSINESS ACCOUNTING TO EPM HANDOFF RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1691
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.management_and_business_accounting_to_epm.handoff_rule
component: management-and-business-accounting-to-epm-handoff-rule


# RULE

Management, business core, and accounting core may hand off:
- reviewed priority context
- operational actuals context
- posted financial actuals context
- closure and variance visibility context

EPM creates new owned truths:
- objective set
- KPI metric
- scorecard snapshot
- planning/review cycle
- variance case

