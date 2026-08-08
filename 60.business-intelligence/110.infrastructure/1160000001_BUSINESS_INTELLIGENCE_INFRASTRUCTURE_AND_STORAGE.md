# ============================================================
# BUSINESS INTELLIGENCE INFRASTRUCTURE AND STORAGE
# ============================================================

status: draft-exact-design
module: 60.business-intelligence

## 1. Storage classes
- KPI definition data
- analytical snapshot data
- dashboard projection data
- refresh run registry
- filter profile registry

## 2. Search / projection
- search by dashboard code, KPI code, dataset name, refresh status
- dashboard rendering should use latest published snapshot deterministically

## 3. Offline-first support
- local filter profile changes may queue locally
- publish / refresh require sync-safe command handling
- queue presentation uses Foundation
