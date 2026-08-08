# ============================================================
# ORDER MANAGEMENT INFRASTRUCTURE AND STORAGE
# ============================================================

status: draft-exact-design
module: 04.order-management

## 1. Storage classes
- canonical relational order data
- search / monitor projection models
- operational retry queue records
- attachment metadata if needed at order scope

## 2. Numbering
- sales_order_number generated per company
- immutable after creation

## 3. Search / projection
- search by sales order number, customer, status, ship date, hold state
- fulfillment monitor projection refresh must be idempotent

## 4. Offline-first support
- draft/order correction commands may queue locally
- release / hold / cancel / downstream handoff require sync-safe command handling
- queue presentation uses Foundation
