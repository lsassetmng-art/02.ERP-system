# ============================================================
# ERP NEXT DEEPENING ROADMAP
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- ERP next design work
- module exact design roadmap
- additive-only continuation

purpose:
Define the next additive ERP deepening roadmap after cross-module boundary
indexing and current state ledger creation.

# ============================================================
# 1. ROADMAP POLICY
# ============================================================

roadmap_policy:
- continue additive-only deepening
- do not restart ERP from scratch
- do not move business canon to CommonOS or BI
- deepen by module cluster
- keep exact handoff / payload / ownership rules
- prefer one-shot bundled outputs where possible

# ============================================================
# 2. CURRENT POSITION
# ============================================================

current_position:
- cross-module boundaries are broadly fixed
- core source ownership has been clarified
- BI / approval / audit / master-data / CommonOS boundaries are clarified
- next step should move from boundary-level design to remaining module exact design

# ============================================================
# 3. RECOMMENDED TRACK A
# QUALITY / MANUFACTURING / PLANNING / COSTING
# ============================================================

track_a_modules:
- 17.quality
- 15.manufacturing
- 16.production-planning
- 18.costing
- 12.inventory
- 13.warehouse
- 30.accounting
- 60.business-intelligence

track_a_goal:
- complete production-side exact design after demand/S&OP/warehouse/inventory boundaries.

track_a_suggested_outputs:
- 17.quality inspection / nonconformance / disposition exact design
- 15.manufacturing work order / actual / scrap / rework exact design
- 16.production-planning MPS / MRP / CRP / scheduling exact design
- 18.costing standard cost / actual cost / variance / rollup exact design
- production-to-inventory / quality / costing / accounting handoff exact design

why_track_a_first:
- quality is referenced by purchase receiving, inventory, warehouse, manufacturing, and audit
- manufacturing actuals are already boundary-defined but object model remains thin
- costing needs detailed production/inventory inputs
- production planning already has S&OP intake but needs MRP/CRP/scheduling detail

# ============================================================
# 4. RECOMMENDED TRACK B
# ACCOUNTING / CASH / FIXED ASSETS / ASSET MANAGEMENT
# ============================================================

track_b_modules:
- 30.accounting
- 33.fixed-assets
- 34.cash-management
- 19.asset-management
- 32.project-accounting
- 05.billing
- 10.purchase
- 42.payroll

track_b_goal:
- complete finance-side exact design around posting, payment, reconciliation,
  fixed assets, asset lifecycle, and close dependencies.

track_b_suggested_outputs:
- 30.accounting AP/AR/subledger/posting exact design
- 34.cash-management payment execution / bank reconciliation exact design
- 33.fixed-assets capitalization / depreciation / disposal exact design
- 19.asset-management asset register / maintenance / utilization exact design
- project-to-fixed-asset capitalization boundary
- purchase/billing/payroll-to-accounting posting basis refinements

# ============================================================
# 5. RECOMMENDED TRACK C
# CRM / SFA / SALES COMMERCIAL SIDE
# ============================================================

track_c_modules:
- 02.sfa
- 03.crm
- 01.sales
- 04.order-management
- 05.billing
- 06.demand-forecasting
- 52.master-data

track_c_goal:
- complete customer-facing commercial-side exact design before or after finance-side work.

track_c_suggested_outputs:
- 03.crm customer relationship / account / contact / interaction exact design
- 02.sfa lead / opportunity / activity / pipeline exact design
- SFA opportunity to quote boundary
- CRM customer extension to master-data boundary
- sales price / discount / promotion exact design
- promotion to demand-forecasting signal boundary

# ============================================================
# 6. RECOMMENDED TRACK D
# MASTER DATA CATALOGS
# ============================================================

track_d_modules:
- 52.master-data
- all source modules

track_d_goal:
- expand the generic master-data design into concrete master catalogs.

track_d_suggested_outputs:
- customer / supplier / business partner master exact catalog
- item / product master exact catalog
- location / site / address master exact catalog
- UOM / currency / tax / calendar reference exact catalog
- organization / legal entity reference exact catalog
- source module extension map by master domain

# ============================================================
# 7. RECOMMENDED TRACK E
# INTEGRATED REGENERATION / VERIFICATION
# ============================================================

track_e_goal:
- regenerate ERP integrated design after additive docs are created.
- verify file existence, index coverage, and key boundary terms.

track_e_suggested_outputs:
- ERP integrated markdown regeneration
- boundary doc existence check
- module coverage report
- key term grep verification
- missing module deepening report

note:
- Track E is best after one more deepening track or when Boss wants a checkpoint.

# ============================================================
# 8. NEXT RECOMMENDED ONE-SHOT
# ============================================================

next_recommended_one_shot:
- Track A first bundle:
  - 17.quality inspection / nonconformance / disposition exact design
  - 15.manufacturing work order / actual / scrap / rework exact design
  - production-quality-inventory-costing boundary memo

reason:
- Quality is referenced by purchase receiving, inventory, warehouse, manufacturing, audit, and supplier claim flows.
- Manufacturing has boundary feedback fixed but needs execution object depth.
- Costing depends on manufacturing and inventory actuals.
- This track strengthens SCM/production core.

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- next deepening roadmap created
- recommended tracks fixed
- next one-shot recommendation fixed

# ============================================================
