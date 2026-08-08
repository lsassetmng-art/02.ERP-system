# ============================================================
# ERP PRODUCTION / QUALITY / INVENTORY / COSTING BOUNDARY MEMO EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- 15.manufacturing
- 16.production-planning
- 17.quality
- 18.costing
- 12.inventory
- 13.warehouse
- 30.accounting
- 60.business-intelligence

purpose:
Fix the production-side boundary between planning, manufacturing execution,
quality inspection/disposition, inventory effects, costing rollup, accounting
posting, and BI projection.

# ============================================================
# 1. MODULE POSITIONS
# ============================================================

## 1.1 16.production-planning
canonical_role:
- executable production planning truth

owns_truth:
- MPS
- MRP
- CRP
- production schedule
- planned order
- released planning proposal
- material/capacity feasibility result
- planning exception
- planning run
- planning basis snapshot

does_not_own:
- shop-floor execution actual
- quality inspection result
- inventory stock ledger
- cost calculation result
- accounting journal
- BI projection

## 1.2 15.manufacturing
canonical_role:
- production execution truth

owns_truth:
- production order
- work order
- operation execution
- production start / completion
- actual produced quantity
- actual consumed quantity observation
- scrap / rework execution
- downtime / disruption event
- manufacturing actual package
- production-to-inventory confirmation
- production-to-quality inspection request

does_not_own:
- MRP / CRP planning truth
- final inventory balance
- quality acceptance/rejection decision
- cost rollup truth
- GL journal
- BI projection

## 1.3 17.quality
canonical_role:
- quality inspection / nonconformance / disposition truth

owns_truth:
- inspection plan
- inspection request intake
- inspection result
- quality decision
- accepted / rejected / conditional disposition
- nonconformance record
- CAPA / corrective action quality-side package where applicable
- quality release / hold / quarantine / reject decision

does_not_own:
- production execution actual
- inventory stock ledger
- manufacturing work order
- purchase order
- cost calculation
- accounting journal
- BI projection

## 1.4 18.costing
canonical_role:
- cost calculation / cost rollup / variance basis truth

owns_truth:
- standard cost
- planned cost
- actual cost rollup
- production cost component
- material / labor / overhead cost basis
- cost variance
- cost estimate version
- production actual cost package
- cost-to-accounting posting basis where applicable

does_not_own:
- manufacturing execution actual
- inventory stock ledger
- quality disposition
- GL journal
- BI projection

## 1.5 12.inventory
canonical_role:
- stock quantity / stock ledger / inventory balance truth

owns_truth:
- finished goods receipt
- component issue effect
- scrap inventory effect
- rework stock effect where applicable
- stock status
- inventory ledger

does_not_own:
- manufacturing execution detail
- quality decision
- costing calculation
- production planning truth

# ============================================================
# 2. CANONICAL PRODUCTION FLOW
# ============================================================

canonical_flow:
- 07.sop-consensus
- -> 16.production-planning
- -> 15.manufacturing
- -> 17.quality if inspection required
- -> 12.inventory
- -> 18.costing
- -> 30.accounting
- -> 60.business-intelligence

flow_meaning:
- 16 creates executable plan from S&OP basis.
- 15 executes production against released plan/work order.
- 17 evaluates quality when inspection/disposition is required.
- 12 records inventory quantity/status effects.
- 18 calculates production cost/variance.
- 30 posts accounting truth.
- 60 visualizes only.

# ============================================================
# 3. OWNERSHIP MATRIX
# ============================================================

| concept | owner_module | note |
|---|---|---|
| MPS / MRP / CRP | 16.production-planning | planning truth |
| production schedule | 16.production-planning | executable planning truth |
| production order / work order | 15.manufacturing | execution truth |
| operation actual | 15.manufacturing | execution actual |
| scrap / rework execution | 15.manufacturing | execution truth |
| inspection result | 17.quality | quality truth |
| nonconformance | 17.quality | quality issue truth |
| quality disposition | 17.quality | accept/reject/hold/release truth |
| component issue ledger | 12.inventory | stock truth |
| finished goods receipt ledger | 12.inventory | stock truth |
| production cost rollup | 18.costing | cost truth |
| cost variance | 18.costing | cost calculation truth |
| GL journal | 30.accounting | accounting truth |
| dashboard projection | 60.business-intelligence | analytical projection |

# ============================================================
# 4. HANDOFF CHAIN
# ============================================================

handoff_chain:
- planning_to_manufacturing_release_package
- manufacturing_to_quality_inspection_request
- quality_to_inventory_disposition_reference
- manufacturing_to_inventory_production_confirmation
- manufacturing_to_costing_actual_input_package
- inventory_to_costing_inventory_effect_basis
- costing_to_accounting_posting_basis
- source_modules_to_bi_snapshot

rules:
- 16 to 15 transfers released execution basis, not execution ownership.
- 15 to 17 transfers inspection request/evidence, not quality decision ownership.
- 17 to 12 transfers disposition reference, not inventory ledger ownership.
- 15 to 12 transfers production confirmation, not stock ledger ownership.
- 15/12/17 to 18 transfer cost inputs, not cost calculation ownership.
- 18 to 30 transfers posting basis, not GL journal ownership.
- 60 consumes snapshots only.

# ============================================================
# 5. QUALITY GATE RULE
# ============================================================

quality_gate_rule:
- If inspection is required, finished goods cannot become unrestricted available stock
  without 17.quality disposition.
- 15 may physically complete production.
- 17 decides quality acceptance/rejection/conditional release.
- 12 records inventory stock status based on approved quality disposition.
- 18 may calculate cost with quality/scrap/rework references.
- 30 posts accounting through accounting workflow only.

# ============================================================
# 6. SCRAP / REWORK RULE
# ============================================================

scrap_rework_rule:
- Manufacturing owns scrap/rework execution event.
- Quality may own defect/nonconformance/disposition classification.
- Inventory owns stock effect of scrap/rework.
- Costing owns scrap/rework cost impact.
- Accounting owns journal posting.
- BI visualizes scrap/rework KPI only.

# ============================================================
# 7. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- production schedule treated as execution actual
- work order completion directly creating unrestricted inventory without quality gate where required
- manufacturing directly deciding quality acceptance
- quality disposition directly changing stock ledger without 12 workflow
- inventory receipt directly calculating production cost
- costing variance directly changing production actual
- BI dashboard correcting production actual, quality result, inventory ledger, or cost rollup
- accounting journal correcting manufacturing actual
- scrap event automatically closing nonconformance without quality review
- rework order automatically editing original work order history in place

# ============================================================
# 8. DECISION TEST
# ============================================================

decision_tests:
- If the object answers "what should be produced and when?" -> 16.production-planning
- If the object answers "what was produced or executed?" -> 15.manufacturing
- If the object answers "was it accepted/rejected/held by quality?" -> 17.quality
- If the object answers "what stock quantity/status changed?" -> 12.inventory
- If the object answers "what did it cost?" -> 18.costing
- If the object answers "what was posted to ledger?" -> 30.accounting
- If the object answers "how should it be analyzed or displayed?" -> 60.business-intelligence

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- production-side boundary fixed
- planning / execution / quality / inventory / costing / accounting separated
- quality gate rule fixed
- scrap/rework ownership fixed
- BI projection boundary preserved

# ============================================================
