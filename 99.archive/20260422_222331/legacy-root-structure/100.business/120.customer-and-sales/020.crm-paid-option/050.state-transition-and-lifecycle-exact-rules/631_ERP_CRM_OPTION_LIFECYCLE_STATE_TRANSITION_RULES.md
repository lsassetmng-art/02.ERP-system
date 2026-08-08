# ============================================================
# ERP CRM OPTION LIFECYCLE STATE TRANSITION RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-631
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.lifecycle_state.transition_rules
component: crm-option-lifecycle-state-transition-rules


# OBJECT

crm_customer_lifecycle_state


# RECOMMENDED LIFECYCLE CODE SET

Representative first set:

- lead
- active_customer
- growth_customer
- at_risk
- dormant
- reactivated
- closed_relationship


# RULES

Only one lifecycle state should be current for one
account at one time unless a later multi-track rule
is explicitly added.

Lifecycle change must preserve:

- effective_from
- effective_to
- transition_reason_code
- assigned_by


# REPRESENTATIVE ALLOWED TRANSITIONS

- lead -> active_customer
- active_customer -> growth_customer
- active_customer -> at_risk
- at_risk -> reactivated
- reactivated -> active_customer
- active_customer -> dormant
- dormant -> reactivated
- active_customer -> closed_relationship
- dormant -> closed_relationship


# CONTROLLED TRANSITIONS

Require stronger justification:

- lead -> closed_relationship
- growth_customer -> dormant
- closed_relationship -> reactivated


# PROHIBITION

Do not rewrite historical lifecycle to make the
current interpretation look simpler.

