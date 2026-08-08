# ============================================================
# ERP CRM OPTION VS SFA RELATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-586
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option_vs_sfa.relation_rule
component: crm-option-vs-sfa-relation-rule


# RULE

CRM and SFA must remain distinct even if both are
later sold as paid ERP options.


# CRM ROLE

- customer truth enrichment
- customer context
- customer continuity
- inquiry and relationship history


# SFA ROLE

- lead and opportunity execution
- sales-stage movement
- next action management
- forecast and sales KPI


# INTERPRETATION

CRM may feed SFA.

SFA may consume CRM context.

But SFA must not redefine CRM as only a sales pre-stage list.

