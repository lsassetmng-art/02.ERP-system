# ============================================================
# ERP INVENTORY / WAREHOUSE / LOGISTICS BOUNDARY MEMO EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- 12.inventory
- 13.warehouse
- 14.logistics
- 17.quality
- 18.costing
- 30.accounting
- 51.audit
- 60.business-intelligence

purpose:
Fix the upper boundary between stock truth, warehouse operation truth, and
logistics / delivery truth so that inventory quantity, physical warehouse work,
and transportation execution do not drift.

# ============================================================
# 1. MODULE POSITIONS
# ============================================================

## 1.1 12.inventory
canonical_role:
- stock quantity / stock ledger / availability truth

owns_truth:
- inventory balance
- stock ledger
- on-hand quantity
- available quantity
- reserved quantity
- allocated quantity at inventory level
- stock status
- lot / serial inventory balance where applicable
- inventory adjustment
- stock transfer inventory effect
- inventory valuation quantity basis
- ATP / availability basis where inventory-side
- cycle count approved stock adjustment result

does_not_own:
- warehouse task execution detail
- picking task execution truth
- carrier route truth
- delivery proof truth
- product quality inspection result truth
- statutory accounting journal truth
- BI dashboard projection truth

## 1.2 13.warehouse
canonical_role:
- physical warehouse operation truth

owns_truth:
- receiving operation
- putaway task
- bin / location work task
- replenishment task
- picking task
- packing task
- staging task
- shipping operation
- warehouse movement execution
- warehouse task assignment
- cycle count execution observation
- warehouse exception
- warehouse worker / equipment operation record

does_not_own:
- enterprise stock ledger as final stock truth
- accounting journal truth
- delivery route / carrier transport truth
- quality inspection decision truth
- BI projection truth

## 1.3 14.logistics
canonical_role:
- transportation / delivery / route / carrier execution truth

owns_truth:
- shipment transportation plan
- carrier assignment
- route plan
- delivery dispatch
- tracking event
- proof of delivery
- delivery exception
- transport cost basis where logistics-side
- delivery completion
- returns transportation event where applicable

does_not_own:
- stock ledger truth
- warehouse picking / packing task truth
- accounting posting truth
- product quality inspection truth
- BI projection truth

# ============================================================
# 2. TOP-LEVEL FLOW
# ============================================================

inbound_flow:
- purchase / procurement / manufacturing receipt source
- -> 13.warehouse receiving operation
- -> 17.quality if inspection required
- -> 12.inventory stock ledger / balance update after accepted receiving basis

internal_warehouse_flow:
- 12.inventory availability / reservation / allocation basis
- -> 13.warehouse physical task execution
- -> 12.inventory stock movement / balance effect after confirmed operation

outbound_flow:
- order / allocation / shipment requirement
- -> 12.inventory reservation / allocation
- -> 13.warehouse picking / packing / shipping operation
- -> 12.inventory issue / balance effect
- -> 14.logistics transportation / delivery execution

analytics_flow:
- 12 / 13 / 14 source truth
- -> 60.business-intelligence snapshot / dashboard projection

rules:
- 12 owns quantity truth
- 13 owns physical work truth
- 14 owns delivery / transport truth
- 60 owns analytical projection only
- 51.audit may audit but may not own stock, warehouse, or logistics truth

# ============================================================
# 3. OWNERSHIP MATRIX
# ============================================================

| concept | owner_module | note |
|---|---|---|
| stock ledger | 12.inventory | stock quantity truth |
| on-hand quantity | 12.inventory | inventory balance |
| reserved quantity | 12.inventory | inventory-side commitment |
| allocated quantity | 12.inventory | inventory-level allocation truth |
| warehouse receiving task | 13.warehouse | physical receiving operation |
| putaway / bin task | 13.warehouse | warehouse work truth |
| picking / packing task | 13.warehouse | outbound warehouse execution |
| shipping confirmation operation | 13.warehouse | warehouse outbound handoff evidence |
| transportation route | 14.logistics | logistics execution truth |
| carrier assignment | 14.logistics | transport ownership |
| proof of delivery | 14.logistics | delivery completion evidence |
| product inspection result | 17.quality | quality truth |
| accounting journal | 30.accounting | accounting truth |
| inventory valuation cost basis | 18.costing / 30.accounting as applicable | cost/accounting boundary |
| dashboard projection | 60.business-intelligence | analytical projection |

# ============================================================
# 4. CORE BOUNDARY RULES
# ============================================================

inventory_rule:
- Quantity-changing warehouse operations must result in inventory ledger events in 12.
- 13 may emit confirmed operation evidence, but 12 records stock quantity truth.

warehouse_rule:
- Warehouse tasks are physical operation truth.
- 12 may request movement / reservation / allocation, but 13 executes physical work.

logistics_rule:
- Logistics starts after transportation handoff or shipment readiness.
- 14 owns delivery movement and carrier execution.
- 14 delivery completion may notify 12 / 13 / order modules but does not directly overwrite stock ledger.

quality_rule:
- If inspection is required, 17.quality owns inspection decision.
- 12 stock status may be updated based on approved quality result.
- 13 only performs physical handling around quarantine / hold / release tasks.

audit_rule:
- 51.audit may create findings and remediation.
- 51.audit does not change stock ledger, warehouse task truth, or logistics delivery truth directly.

BI_rule:
- 60 may snapshot / visualize 12 / 13 / 14.
- 60 may not mutate source module truth.

# ============================================================
# 5. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- 13 directly becoming final inventory balance owner
- 14 directly decrementing stock ledger without 12 workflow
- 12 recording warehouse task completion without 13 execution evidence where warehouse operation is required
- 13 deciding quality acceptance without 17.quality workflow
- 51.audit changing stock quantity directly
- 60 dashboard value used as stock correction
- logistics proof of delivery treated as warehouse picking confirmation
- warehouse shipping confirmation treated as customer delivery completion
- inventory reservation treated as physical pick completion
- carrier dispatch treated as inventory issue without warehouse/inventory workflow

# ============================================================
# 6. DECISION TEST
# ============================================================

decision_tests:
- If the object answers "how many stock units exist / are available / are reserved?" -> 12.inventory
- If the object answers "what physical warehouse work was performed?" -> 13.warehouse
- If the object answers "how was the shipment transported or delivered?" -> 14.logistics
- If the object answers "is the product accepted / rejected by quality?" -> 17.quality
- If the object answers "how should the data be visualized?" -> 60.business-intelligence

# ============================================================
# 7. COMPLETION STATE
# ============================================================

completion_state:
- inventory / warehouse / logistics boundary fixed
- quantity truth vs physical operation truth separated
- shipping vs delivery boundary separated
- quality / audit / BI boundaries clarified

# ============================================================
