# ============================================================
# DEMAND FORECASTING INFRASTRUCTURE AND STORAGE
# ============================================================

status: draft-exact-design
module: 06.demand-forecasting

## 1. Storage classes
- canonical forecast version data
- compare/search projection models
- handoff retry queue records
- assumption and adjustment audit registry

## 2. Search / projection
- search by version code, item, store, region, channel, period
- compare projection refresh must be idempotent

## 3. Offline-first support
- adjustment commands may queue locally
- freeze / send-to-sop require sync-safe command handling
- queue presentation uses Foundation
