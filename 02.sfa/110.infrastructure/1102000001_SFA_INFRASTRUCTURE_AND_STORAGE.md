# ============================================================
# SFA INFRASTRUCTURE AND STORAGE
# ============================================================

status: draft-exact-design
module: 02.sfa

## 1. Storage classes
- canonical relational lead/opportunity/activity data
- search and pipeline projection models
- operational retry queue records

## 2. Numbering
- lead_number generated per company
- opportunity_number generated per company
- immutable after creation

## 3. Search / projection
- list search by lead number, opportunity number, customer, owner, stage, status
- pipeline projection refresh must be idempotent

## 4. Offline-first support
- activities and next actions may queue locally
- stage changes and quote requests require sync-safe command handling
- queue presentation uses Foundation
