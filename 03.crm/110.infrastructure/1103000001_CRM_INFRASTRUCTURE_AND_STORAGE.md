# ============================================================
# CRM INFRASTRUCTURE AND STORAGE
# ============================================================

status: draft-exact-design
module: 03.crm

## 1. Storage classes
- canonical relational relationship/interaction/follow-up data
- timeline/search read models
- operational retry queue records

## 2. Search / projection
- search by customer, owner, relationship health, relationship status, overdue follow-up
- timeline projection refresh must be idempotent

## 3. Offline-first support
- interaction and follow-up updates may queue locally
- relationship corrections require sync-safe command handling
- queue presentation uses Foundation

## 4. Retention direction
- closed/dormant relationship data remains historically visible
- interaction history is not hard-overwritten by routine edits
