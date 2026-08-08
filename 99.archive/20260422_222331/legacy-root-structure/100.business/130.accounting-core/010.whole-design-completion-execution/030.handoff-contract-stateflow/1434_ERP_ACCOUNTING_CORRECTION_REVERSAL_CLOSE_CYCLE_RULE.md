# ============================================================
# ERP ACCOUNTING CORRECTION REVERSAL CLOSE CYCLE RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1434
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.correction_reversal_close_cycle.rule
component: accounting-correction-reversal-close-cycle-rule


# RULE

Correction, reversal, and close-cycle semantics must remain distinct.

Representative distinctions:
- correction request is not reversal entry
- reversal entry is not close-cycle reopen
- closed period is not archived period

# CONSEQUENCE

Every correction-class or close-class action must preserve:
- original accounting object reference
- reason
- actor
- timestamp
- downstream audit visibility

