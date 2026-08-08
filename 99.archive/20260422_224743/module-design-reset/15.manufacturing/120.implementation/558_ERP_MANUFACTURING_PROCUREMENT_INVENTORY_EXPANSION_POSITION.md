# ============================================================
# ERP MANUFACTURING PROCUREMENT INVENTORY EXPANSION POSITION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-558
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.additional_systems.manufacturing_procurement_inventory.position
component: manufacturing-procurement-inventory-expansion-position


# DOMAIN

manufacturing_procurement_inventory


# SYSTEMS

- MRP
- WMS
- SCM


# POSITIONING

MRP is the planning-centered manufacturing core.

WMS is the warehouse execution core.

SCM is the broader supply-network and external
coordination layer.


# MRP POSITION

Main scope:
- material requirements planning
- BOM
- purchase proposal
- production planning
- stock allocation
- lead time control


# WMS POSITION

Main scope:
- warehouse management
- inventory location
- inbound
- outbound
- stocktaking
- picking


# SCM POSITION

Main scope:
- procurement
- supplier management
- supply planning
- shipment linkage
- supply network visibility


# RELATIONSHIP RULE

MRP, WMS, and SCM must not be flattened into one
undifferentiated operations block.

They interact, but their design centers differ:

- MRP = planning
- WMS = warehouse execution
- SCM = broader supply network management

