# ============================================================
# ERP NUMBERED FOLDER CANON
# ============================================================

status: canonical
owner: Boss
prepared_by: Zero

purpose:
Define canonical numbered ERP folders for both design and implementation.

# 1. Canonical roots

design_root:
- ~/02.ERP-system

implementation_root:
- ~/04.ERP-development

foundation_root:
- ~/02.ERP-system/00.foundation

# 2. Canonical alignment rule

Rule:
- design: ~/02.ERP-system/<nn.module>
- implementation: ~/04.ERP-development/<nn.module>

If a submodule exists:
- design: ~/02.ERP-system/<nn.module>/<nn.submodule>
- implementation: ~/04.ERP-development/<nn.module>/<nn.submodule>

# 3. CommonOS consumer rule

Each ERP module or submodule may consume CommonOS through:
- ~/04.ERP-development/<nn.module>/_commonos
- ~/04.ERP-development/<nn.module>/<nn.submodule>/_commonos

Standard subfolders:
- adapter
- bridge
- mapper
- presenter
- theme
- sync
- test

# 4. Root module canon

01.sales
02.sfa
03.crm
04.order-management
05.billing

10.purchase
11.procurement
12.inventory
13.warehouse
14.logistics
15.manufacturing
16.production-planning
17.quality
18.costing
19.asset-management

30.accounting
31.management-accounting
32.project-accounting
33.fixed-assets
34.cash-management

40.human-resources
41.labor-management
42.payroll

50.approval
51.audit
52.master-data

# 5. Submodule canon

13.warehouse
- 01.inbound
- 02.outbound
- 03.allocation
- 04.picking
- 05.shipping
- 06.receiving

14.logistics
- 01.transportation
- 02.delivery
- 03.route-planning

16.production-planning
- 01.mrp
- 02.crp
- 03.scheduling

19.asset-management
- 01.asset-register
- 02.maintenance-planning
- 03.utilization

41.labor-management
- 01.attendance
- 02.shift
- 03.leave
- 04.overtime
- 05.work-record

# 6. Important semantic rule

SCM is treated as an umbrella business domain, not a mandatory root folder.

MRP and CRP are canonical submodules under:
- 16.production-planning/01.mrp
- 16.production-planning/02.crp

SFA, CRM, labor-management, and asset-management are canonical ERP modules and must not be omitted.

# 7. Boundary rule

Module-specific business canon must remain in each numbered module or submodule folder.

Do not place the following into CommonOS:
- accounting decision core
- inventory decision core
- costing decision core
- approval decision core
- payload canon
- secrets / keys / DB credentials

# 8. Transitional rule

Existing unnumbered ERP folders may remain temporarily as transitional references.
New canonical work must target the numbered folders only.
