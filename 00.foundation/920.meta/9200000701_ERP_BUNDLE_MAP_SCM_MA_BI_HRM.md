# ============================================================
# ERP BUNDLE MAP SCM MA BI HRM
# ============================================================

status: generated
owner: Boss
prepared_by: Zero

bundle_map:
  scm:
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

  ma:
    core:
      - 31.management-accounting
    related:
      - 18.costing
      - 32.project-accounting

  bi:
    - 60.business-intelligence

  hrm:
    - 40.human-resources
    - 41.labor-management
    - 42.payroll

notes:
- SCM is treated as a bundle, not a single canonical root replacing existing modules.
- MA is centered on 31.management-accounting.
- BI is analytics/projection oriented and must not absorb business canon.
- HRM remains 40/41/42 as currently structured.
