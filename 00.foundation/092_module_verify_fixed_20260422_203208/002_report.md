# ============================================================
# ERP MODULE VERIFY FIXED REPORT
# ============================================================

status: generated
owner: Boss
prepared_by: Zero

## Summary
- total_count: 46
- pass_count: 11
- warn_count: 35
- fail_count: 0

## Exclusions
- 00.foundation
- 90.transition-triage
- 99.archive

## Status rule
- PASS: canonical structure exists and no inbox/unclassified/conflict remains and payload > 0
- WARN: canonical structure exists but remaining inbox/conflict/unclassified or payload = 0
- FAIL: canonical structure or root docs missing

## Detail

| unit_path | kind | inbox_payload_file_count | archive_payload_file_count | unclassified_payload_file_count | unclassified_dir_count | conflict_payload_file_count | conflict_dir_count | canonical_payload_file_count | status | note |
|---|---|---:|---:|---:|---:|---:|---:|---:|---|---|
| `/data/data/com.termux/files/home/02.ERP-system/01.sales` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 4 | PASS | module-clean |
| `/data/data/com.termux/files/home/02.ERP-system/02.sfa` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/03.crm` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/04.order-management` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/05.billing` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/10.purchase` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 1 | PASS | module-clean |
| `/data/data/com.termux/files/home/02.ERP-system/11.procurement` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/12.inventory` | root-module | 0 | 0 | 0 | 0 | 2 | 0 | 24 | WARN | unclassified or conflict payload remains |
| `/data/data/com.termux/files/home/02.ERP-system/13.warehouse` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 1 | PASS | module-clean |
| `/data/data/com.termux/files/home/02.ERP-system/13.warehouse/01.inbound` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/13.warehouse/02.outbound` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/13.warehouse/03.allocation` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/13.warehouse/04.picking` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/13.warehouse/05.shipping` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/13.warehouse/06.receiving` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/14.logistics` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/14.logistics/01.transportation` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/14.logistics/02.delivery` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 1 | PASS | module-clean |
| `/data/data/com.termux/files/home/02.ERP-system/14.logistics/03.route-planning` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/15.manufacturing` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 5 | PASS | module-clean |
| `/data/data/com.termux/files/home/02.ERP-system/16.production-planning` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/16.production-planning/01.mrp` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 1 | PASS | module-clean |
| `/data/data/com.termux/files/home/02.ERP-system/16.production-planning/02.crp` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/16.production-planning/03.scheduling` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/17.quality` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/18.costing` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/19.asset-management` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/19.asset-management/01.asset-register` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/19.asset-management/02.maintenance-planning` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/19.asset-management/03.utilization` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/30.accounting` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 203 | PASS | module-clean |
| `/data/data/com.termux/files/home/02.ERP-system/31.management-accounting` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/32.project-accounting` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/33.fixed-assets` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/34.cash-management` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/40.human-resources` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/41.labor-management` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 3 | PASS | module-clean |
| `/data/data/com.termux/files/home/02.ERP-system/41.labor-management/01.attendance` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/41.labor-management/02.shift` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/41.labor-management/03.leave` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/41.labor-management/04.overtime` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/41.labor-management/05.work-record` | submodule | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/42.payroll` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 0 | WARN | canonical structure exists but no payload distributed yet |
| `/data/data/com.termux/files/home/02.ERP-system/50.approval` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 2 | PASS | module-clean |
| `/data/data/com.termux/files/home/02.ERP-system/51.audit` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 21 | PASS | module-clean |
| `/data/data/com.termux/files/home/02.ERP-system/52.master-data` | root-module | 0 | 0 | 0 | 0 | 0 | 0 | 19 | PASS | module-clean |
