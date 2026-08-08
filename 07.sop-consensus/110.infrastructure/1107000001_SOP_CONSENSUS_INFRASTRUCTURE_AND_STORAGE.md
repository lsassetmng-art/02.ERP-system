# ============================================================
# SOP CONSENSUS INFRASTRUCTURE AND STORAGE
# ============================================================

status: draft-exact-design
module: 07.sop-consensus

## 1. Storage classes
- canonical consensus version data
- compare/search projection models
- handoff retry queue records
- issue and decision audit registry

## 2. Search / projection
- search by version code, item, horizon, issue status, freeze status
- compare projection refresh must be idempotent

## 3. Offline-first support
- agreement commands may queue locally
- freeze / send-to-production-planning require sync-safe command handling
- queue presentation uses Foundation
