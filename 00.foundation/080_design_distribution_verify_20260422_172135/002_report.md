# ============================================================
# ERP DESIGN DISTRIBUTION VERIFY REPORT
# ============================================================

status: generated
owner: Boss
prepared_by: Zero

## Summary
- total_count: 49
- pass_count: 0
- warn_count: 48
- fail_count: 1

## Status rule
- PASS: canonical structure exists and no inbox/unclassified/conflict remains
- WARN: canonical structure exists but remaining inbox/conflict/unclassified or no distributed content
- FAIL: canonical structure or root docs missing

## Detail

| unit_path | kind | inbox_file_count | archive_file_count | unclassified_file_count | unclassified_dir_count | conflict_file_count | conflict_dir_count | canonical_file_count | status | note |
|---|---|---:|---:|---:|---:|---:|---:|---:|---|---|
| `/data/data/com.termux/files/home/02.ERP-system/00.foundation` | root-module | 2 | 0 | 4 | 0 | 0 | 0 | 35 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/01.sales` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/02.sfa` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/03.crm` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/04.order-management` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/05.billing` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/10.purchase` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/11.procurement` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/12.inventory` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/13.warehouse` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/13.warehouse/01.inbound` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/13.warehouse/02.outbound` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/13.warehouse/03.allocation` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/13.warehouse/04.picking` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/13.warehouse/05.shipping` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/13.warehouse/06.receiving` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/14.logistics` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/14.logistics/01.transportation` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/14.logistics/02.delivery` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/14.logistics/03.route-planning` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/15.manufacturing` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/16.production-planning` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/16.production-planning/01.mrp` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/16.production-planning/02.crp` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/16.production-planning/03.scheduling` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/17.quality` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/18.costing` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/19.asset-management` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/19.asset-management/01.asset-register` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/19.asset-management/02.maintenance-planning` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/19.asset-management/03.utilization` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/30.accounting` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/31.management-accounting` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/32.project-accounting` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/33.fixed-assets` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/34.cash-management` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/40.human-resources` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/41.labor-management` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/41.labor-management/01.attendance` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/41.labor-management/02.shift` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/41.labor-management/03.leave` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/41.labor-management/04.overtime` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/41.labor-management/05.work-record` | submodule | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/42.payroll` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/50.approval` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/51.audit` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/52.master-data` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | WARN | transition inbox still has remaining files |
| `/data/data/com.termux/files/home/02.ERP-system/90.transition-triage` | root-module | 2 | 0 | 0 | 0 | 0 | 0 | 28 | FAIL | missing canonical design structure |
| `/data/data/com.termux/files/home/02.ERP-system/90.transition-triage/00.root-files` | submodule | 2 | 0 | 115 | 0 | 0 | 0 | 225 | WARN | transition inbox still has remaining files |
