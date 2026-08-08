# ============================================================
# ERP CROSS-MODULE COMPACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- ERP cross-module boundary
- source truth ownership
- BI / CommonOS / Approval / Audit / Master Data boundaries

# 1. Core rule

Existing ERP design is not rebuilt from scratch.  
The current ERP work is additive deepening.

canonical_rules:
- ERP business canon remains in ERP modules.
- CommonOS may provide shared UI / presentation / ERP dense variant.
- CommonOS does not own ERP business canon.
- Queue presentation may be CommonOS.
- Queue meaning remains module-side.
- BI owns analytical projection only.
- Approval owns approval workflow / decision truth only.
- Audit owns audit finding / evidence / remediation lifecycle truth only.
- Master Data owns shared identity / reference truth only.
- Source modules own transactions / execution / calculation / posting truth.

# 2. Major cross-module boundaries

demand_flow:
- 06.demand-forecasting = market-side forecast truth
- 07.sop-consensus = agreed consensus demand/supply/capacity/inventory truth
- 16.production-planning = executable planning truth
- 15.manufacturing = execution truth
- 60.business-intelligence = analytical projection only

SCM_bundle:
- 06.demand-forecasting
- 07.sop-consensus
- 10.purchase
- 11.procurement
- 12.inventory
- 13.warehouse
- 14.logistics
- 15.manufacturing
- 16.production-planning
- 17.quality
- 18.costing
- 19.asset-management

finance_boundary:
- 30.accounting = GL / AP / AR / statutory posting / close truth
- 31.management-accounting = internal management view / managerial close
- 33.fixed-assets = fixed asset accounting lifecycle
- 34.cash-management = payment / receipt / bank / reconciliation truth

commercial_boundary:
- 52.master-data = customer/business partner identity
- 03.crm = relationship / account / contact / interaction
- 02.sfa = lead / opportunity / activity / pipeline
- 01.sales = quote / price / discount / promotion
- 04.order-management = accepted order
- 05.billing = invoice / billing
- 06.demand-forecasting = forecast truth

HRM_boundary:
- 40.human-resources = HR master / employment / assignment
- 41.labor-management = attendance / shift / leave / overtime / work result
- 42.payroll = payroll calculation / payslip / payroll close

governance_boundary:
- 50.approval = approval route/request/decision/evidence
- 51.audit = audit finding/evidence/closure
- 51.audit/06.remediation-tracking = corrective action lifecycle

# 3. Global forbidden shortcuts

forbidden:
- BI absorbing source business canon
- CommonOS absorbing ERP business canon
- approval decision directly mutating source transaction
- audit finding directly mutating source transaction
- master-data changing source transactions directly
- source module forking shared master identity outside 52 workflow
- forecast output becoming consensus truth without S&OP workflow
- quote becoming accepted order without order-management intake
- posting basis becoming GL journal
- payment basis becoming bank execution
- quality disposition directly writing stock ledger
- manufacturing completion directly writing stock ledger
- invoice directly becoming cash receipt
- master merge silently rewriting historical transactions

# 4. Key source docs

source_docs:
- 9200000314_ERP_CROSS_MODULE_BOUNDARY_INDEX.md
- 9200000315_ERP_DEEPENING_CURRENT_STATE_LEDGER.md
- 9200000316_ERP_NEXT_DEEPENING_ROADMAP.md
- 9200000336_ERP_ALL_TRACK_DEEPENING_INDEX_REFRESH.md
- 9200000337_ERP_MODULE_COVERAGE_MATRIX_REFRESH.md
- 9200000338_ERP_INTEGRATED_REGENERATION_PLAN.md

# ============================================================
