# ============================================================
# ERP CRM VS SFA BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-719
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_vs_sfa.boundary_rule
component: crm-vs-sfa-boundary-rule


# CRM SIDE

CRM owns:
- customer account context
- contact continuity
- interaction continuity
- inquiry continuity
- customer segmentation
- customer lifecycle interpretation


# SFA SIDE

SFA owns:
- lead
- opportunity
- pipeline stage
- sales next action
- sales forecast
- opportunity closure reason


# RULE

CRM context may enrich SFA.

SFA execution must not redefine CRM as a mere
sales pre-stage list.

CRM and SFA remain tightly linked but distinct.

