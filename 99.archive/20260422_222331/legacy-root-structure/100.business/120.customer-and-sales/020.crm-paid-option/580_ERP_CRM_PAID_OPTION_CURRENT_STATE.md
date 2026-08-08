# ============================================================
# ERP CRM PAID OPTION CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-580
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_paid_option.current_state
component: crm-paid-option-current-state


# ABSTRACT

Defines the current state for CRM as an ERP-attached
paid option module.

CRM is not treated as a mandatory ERP-wide base layer.

CRM is treated as a paid option that enriches the ERP
with customer-management capability for contracted users.


# CURRENT POSITION

CRM is now interpreted as:

- optional
- paid
- ERP-attached
- organization-scoped
- permissioned
- auditable

CRM is not interpreted as:
- mandatory ERP core
- unavoidable system-wide prerequisite
- always-on baseline for every tenant/company


# DESIGN CONSEQUENCE

ERP core must stay operable without CRM enabled.

When CRM is enabled, it enriches customer-facing
operations and visibility without becoming a hidden
hard dependency for every core transaction flow.

