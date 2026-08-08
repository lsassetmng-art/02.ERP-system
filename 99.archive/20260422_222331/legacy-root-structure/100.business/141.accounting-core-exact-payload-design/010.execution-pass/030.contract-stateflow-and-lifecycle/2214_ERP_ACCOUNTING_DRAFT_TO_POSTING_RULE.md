# ============================================================
# ERP ACCOUNTING DRAFT TO POSTING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2214
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.draft_to_posting.rule
component: accounting-draft-to-posting-rule


# RULE

Accounting draft approval may justify journal posting,
but draft truth does not disappear.

Progression should preserve:
- originating draft reference
- posting actor
- posting timestamp
- source business reference continuity
- reversal visibility if later needed

