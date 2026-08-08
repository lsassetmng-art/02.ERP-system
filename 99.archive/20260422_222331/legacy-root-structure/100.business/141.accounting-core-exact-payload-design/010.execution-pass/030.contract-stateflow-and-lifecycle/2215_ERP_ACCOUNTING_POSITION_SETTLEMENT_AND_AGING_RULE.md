# ============================================================
# ERP ACCOUNTING POSITION SETTLEMENT AND AGING RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2215
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.position_settlement_and_aging.rule
component: accounting-position-settlement-and-aging-rule


# RULE

Receivable and payable positions may progress through
open, partial settlement, settlement, and aging states.

Progression should preserve:
- original journal reference
- counterparty reference
- due-date basis
- settlement actor and timestamp
- remaining balance visibility

