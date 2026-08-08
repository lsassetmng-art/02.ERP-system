# ============================================================
# BILLING INFRASTRUCTURE AND STORAGE
# ============================================================

status: draft-exact-design
module: 05.billing

## 1. Storage classes
- canonical relational invoice data
- billing schedule data
- search / monitor projection models
- accounting handoff retry queue records
- invoice rendering/export metadata

## 2. Numbering
- invoice_number generated per company
- immutable after creation

## 3. Search / projection
- search by invoice number, customer, bill-to, status, due date
- billable event monitor projection refresh must be idempotent

## 4. Offline-first support
- draft preparation may queue locally
- issue / memo / accounting handoff require sync-safe command handling
- queue presentation uses Foundation
