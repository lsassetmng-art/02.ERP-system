# ============================================================
# ERP TRACK E GAP AND IMPLEMENTATION PREP COMPACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track E
scope:
- ERP remaining gaps
- integrated regeneration status
- implementation-prep candidates

# 1. Current state

current_state:
- Track A production-side complete at design-deepening layer.
- Track B finance-side complete at design-deepening layer.
- Track C commercial-side complete at design-deepening layer.
- Track D master-data catalog complete at design-deepening layer.
- Track E integrated split regeneration prepared.
- Upload-friendly compact pack created.
- No DB apply.
- No implementation.
- No destructive operation.

# 2. High priority remaining gaps

high_priority_gaps:
- chart of accounts / ledger setup catalog
- tax code / tax jurisdiction / tax invoice catalog
- bank account / payment route catalog
- supplier invoice matching exact design
- order return / customer return lifecycle
- BOM / routing / engineering change catalog
- WIP inventory / WIP costing lifecycle
- CAPA lifecycle and quality/audit boundary
- customer consent / privacy preference catalog
- financial statement output exact design

# 3. Medium priority gaps

medium_priority_gaps:
- sales target / territory / quota
- promotion ROI and settlement
- fixed asset class / depreciation method formula catalog
- treasury / cash forecast
- predictive maintenance / IoT meter integration
- quality sampling / inspection characteristic catalog
- supplier corrective action request lifecycle
- inventory valuation accounting integration
- row-level dashboard authorization

# 4. Implementation-prep candidates

candidate_A_production:
- 16.production-planning
- 15.manufacturing
- 17.quality
- 12.inventory
- 18.costing
reason:
- Track A exact design is strong.
needs:
- BOM/routing ownership detail
- WIP scope decision
- lot/serial genealogy scope

candidate_B_finance:
- 30.accounting
- 34.cash-management
- 33.fixed-assets
- 19.asset-management
reason:
- Track B exact design is strong.
needs:
- COA catalog
- bank account/payment route catalog
- tax catalog
- accounting period/close checklist

candidate_C_commercial:
- 03.crm
- 02.sfa
- 01.sales
- 04.order-management
- 05.billing
- 06.demand-forecasting
reason:
- Track C exact design is strong.
needs:
- price/promotion catalog
- order return scope
- billing dispute/refund scope
- commercial KPI scope

candidate_D_master_data:
- 52.master-data
- source module extension consumers
reason:
- Track D catalog design is strong.
- Stable master identity reduces later transaction rework.
needs:
- API exact payloads
- RLS/authorization
- v1 catalog scope
- data quality rule catalog

recommended_first:
- Candidate D master-data foundation

# 5. Next options

next_options:
- Track F detailed remaining catalogs
- Master-data implementation-prep freeze
- Full integrated pack regeneration after Track F
- Selected module cluster implementation-prep

# ============================================================
