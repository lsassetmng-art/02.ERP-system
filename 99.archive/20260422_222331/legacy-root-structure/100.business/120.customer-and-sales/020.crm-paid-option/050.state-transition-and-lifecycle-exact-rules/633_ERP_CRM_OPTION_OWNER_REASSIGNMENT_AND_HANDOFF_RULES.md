# ============================================================
# ERP CRM OPTION OWNER REASSIGNMENT AND HANDOFF RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-633
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.owner_reassignment_and_handoff.rules
component: crm-option-owner-reassignment-and-handoff-rules


# PURPOSE

Defines exact transition rules for ownership change
and responsibility handoff in CRM option objects.


# APPLICABLE OBJECTS

- crm_customer_account
- crm_inquiry_case
- later expandable to other CRM managed objects


# REQUIRED CHANGE SET

Owner reassignment must preserve:

- previous_owner_user_id
- next_owner_user_id
- reassignment_reason_code
- reassignment_note
- changed_at
- changed_by


# HANDOFF RULE

Reassignment is not only a field mutation.

It is a responsibility transition and may require:

- acknowledgement workflow
- pending work visibility
- due item carry-forward
- audit reflection


# PROHIBITIONS

- silent owner replacement on governed objects
- reassignment without reason on controlled flows
- loss of previous owner trace

