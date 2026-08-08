# ============================================================
# ERP ACCOUNTING CLOSE AND REOPENING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2216
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.close_and_reopening.rule
component: accounting-close-and-reopening-rule


# RULE

Close cycle may progress from open to review to soft or hard close,
and may be reopened under controlled conditions.

Reopening should preserve:
- original closed period reference
- reopen reason
- authorization actor
- reopened timestamp
- affected downstream visibility

