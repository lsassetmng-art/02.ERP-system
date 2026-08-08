# ============================================================
# ERP CRM SFA PAID OPTION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2316
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.crm_sfa_paid_option.rule
component: crm-sfa-paid-option-rule


# RULE

CRM and SFA are classified as ERP paid-option modules.

# REASON

They are:
- official ERP-side systems
- valuable across many organizations
- not universally required at the same baseline level as sales / purchase / inventory / accounting

# CONSEQUENCE

They should have official ERP design lines,
but they do not need to block baseline ERP implementation closure.

