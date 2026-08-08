# ============================================================
# MANUFACTURING MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 15.manufacturing

## 1. Logical components
1. Production Order Aggregate Service
2. Operation Progress Service
3. Material Issue Request Service
4. Output Declaration Service
5. Scrap / Rework Service
6. Completion / Closure Service
7. Search / Monitor Projection Service

## 2. Main aggregates
- mfg_production_order
- mfg_operation
- mfg_material_issue_request
- mfg_output_declaration
- mfg_scrap_event
- mfg_completion_record

## 3. Inbound dependencies
From 16.production-planning:
- released production plan reference
- schedule/work-center allocation reference

From 52.master-data:
- item reference
- BOM reference
- routing reference
- work center reference

From 17.quality:
- quality hold / release reference

From 19.asset-management:
- equipment availability reference only

## 4. Outbound surfaces
To 12.inventory:
- material issue / receipt movement reference
- finished goods receipt reference

To 17.quality:
- inspection-required completion reference

To 18.costing:
- labor/machine/material actual reference
- scrap/variance source reference

To 30.accounting:
- reference only, not journal canon

## 5. Architecture rule
Manufacturing owns execution truth and completion truth.
Inventory owns quantity truth.
Costing owns cost truth.
