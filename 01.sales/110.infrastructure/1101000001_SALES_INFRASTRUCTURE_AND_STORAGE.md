# ============================================================
# SALES INFRASTRUCTURE AND STORAGE
# ============================================================

status: draft-exact-design
module: 01.sales

## 1. Storage classes
- canonical relational quote data
- attachment object storage
- projection/search read models
- operational retry queue records

## 2. Numbering
- quote_number generated per company
- immutable after creation

## 3. Attachment handling
- metadata stored in relational canon
- binary stored separately
- revision-scoped historical reference preserved

## 4. Search / projection
- list search index by quote number, customer, status, salesperson, validity
- projection refresh must be idempotent

## 5. Offline-first support
- draft edits may be queued locally
- issue / acceptance / handoff require sync-safe command handling
- queue presentation uses Foundation
