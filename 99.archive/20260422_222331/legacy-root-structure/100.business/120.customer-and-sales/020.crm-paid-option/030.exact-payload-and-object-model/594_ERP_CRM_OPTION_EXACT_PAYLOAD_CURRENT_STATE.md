# ============================================================
# ERP CRM OPTION EXACT PAYLOAD CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-594
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.exact_payload.current_state
component: crm-option-exact-payload-current-state


# ABSTRACT

Defines the current state for the first exact payload
and object exactness pass for the CRM paid option.

The previous pass fixed:
- CRM is a paid option
- CRM is not mandatory ERP core
- core keeps only minimum customer reference
- CRM option keeps richer customer-management surfaces

This pass makes the design more exact by fixing the
first payload shape and object family rules.


# GOAL

The goal is not implementation code.

The goal is exact design shape:
- what the main objects are
- what fields belong where
- what must stay out of core
- what authority / audit / analytics exactness is needed


# CONSTRAINTS

Do not let CRM option exactness leak into universal core assumptions.

Do not flatten all CRM payloads into one giant customer blob.

Do not omit audit / authority / lifecycle exactness.

