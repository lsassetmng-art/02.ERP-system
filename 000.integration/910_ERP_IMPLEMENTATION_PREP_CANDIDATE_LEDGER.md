# ============================================================
# ERP IMPLEMENTATION PREP CANDIDATE LEDGER
# ============================================================

status: active
owner: Boss
prepared_by: Zero
generated_at: 2026-04-28 18:54:22 +0900
system: ERP
purpose:
Identify candidate module clusters for future implementation-prep after
Tracks A/B/C/D and Track E verification/regeneration.

# ============================================================
# 1. IMPLEMENTATION PREP POLICY
# ============================================================

policy:
- no DB apply in this regeneration step
- no API implementation in this regeneration step
- no UI implementation in this regeneration step
- implementation artifacts must later go under ~/04.ERP-development/<module>/...
- design docs remain under ~/02.ERP-system/<module>/...
- CommonOS can be used for shared UI / ERP dense variant
- ERP business canon remains in ERP modules
- queue presentation can be CommonOS
- queue meaning remains module-side

# ============================================================
# 2. CANDIDATE CLUSTERS
# ============================================================

## Candidate A: Production-side core
modules:
- 16.production-planning
- 15.manufacturing
- 17.quality
- 12.inventory
- 18.costing

why:
- Track A exact design is strong.
- Production / quality / inventory / costing handoffs are fixed.
- Good candidate for API payload freeze and DB schema prep.

needs_before_implementation:
- BOM / routing ownership detail
- WIP inventory/costing detail if v1 includes WIP
- lot/serial genealogy scope decision
- selected v1 flow definition

## Candidate B: Finance-side core
modules:
- 30.accounting
- 34.cash-management
- 33.fixed-assets
- 19.asset-management

why:
- Track B exact design is strong.
- GL / AP / AR / cash / bank / fixed asset boundaries are fixed.

needs_before_implementation:
- chart of accounts catalog
- bank account/payment route catalog
- tax catalog
- accounting period/close checklist
- payment approval variant decision

## Candidate C: Commercial-side core
modules:
- 03.crm
- 02.sfa
- 01.sales
- 04.order-management
- 05.billing
- 06.demand-forecasting

why:
- Track C exact design is strong.
- CRM/SFA/Sales/Order/Billing/Demand signal boundaries are fixed.

needs_before_implementation:
- customer master payloads
- price list/promotion catalog
- order change/return scope
- billing dispute/refund scope
- commercial KPI scope

## Candidate D: Master-data foundation
modules:
- 52.master-data
- source module extension consumers

why:
- Track D master catalog design is strong.
- Master publication and source extension matrix are fixed.
- Good foundation candidate before transaction modules.

needs_before_implementation:
- API exact payloads for publication/acknowledgement
- RLS/authorization
- customer/item/location/company minimum v1 catalog decision
- data quality rule catalog

# ============================================================
# 3. RECOMMENDED FIRST IMPLEMENTATION-PREP
# ============================================================

recommended_first:
- Candidate D: Master-data foundation

reason:
- Transaction modules across Tracks A/B/C/B reference master catalogs.
- Stable master identity reduces later rework.
- Implementation-prep can start with read-only catalog, create/update workflow,
  publication, acknowledgement, and source extension reference patterns.

alternate_first:
- Candidate C if user-facing commercial flow is preferred.
- Candidate A if production/SCM core is preferred.
- Candidate B if finance core is preferred.

# ============================================================
# 4. COMPLETION STATE
# ============================================================

completion_state:
- implementation-prep candidate ledger generated
- no implementation performed
- no DB apply performed

# ============================================================
