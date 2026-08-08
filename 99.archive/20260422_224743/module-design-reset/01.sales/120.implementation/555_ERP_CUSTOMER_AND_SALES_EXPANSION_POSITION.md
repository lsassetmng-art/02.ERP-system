# ============================================================
# ERP CUSTOMER AND SALES EXPANSION POSITION
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-555
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.additional_systems.customer_and_sales.position
component: customer-and-sales-expansion-position


# DOMAIN

customer_and_sales


# SYSTEMS

- CRM
- SFA


# POSITIONING

CRM is the customer-side source-of-truth foundation.

SFA is the execution-side sales front layer that
operates on top of CRM while remaining ERP-attached.


# CRM POSITION

CRM should be treated as the formal ERP-side
customer management base.

Main scope:
- customer master
- contact history
- inquiry and response history
- customer classification
- customer analysis


# SFA POSITION

SFA should be treated as the formal ERP-side
sales execution layer.

Main scope:
- lead management
- opportunity management
- stage management
- sales forecast
- next action
- sales KPI


# RELATIONSHIP RULE

CRM and SFA should remain separable but tightly linked.

CRM is not merely a view of SFA.
SFA is not merely an activity log on top of CRM.

Each has its own design center and truth-bearing role.

