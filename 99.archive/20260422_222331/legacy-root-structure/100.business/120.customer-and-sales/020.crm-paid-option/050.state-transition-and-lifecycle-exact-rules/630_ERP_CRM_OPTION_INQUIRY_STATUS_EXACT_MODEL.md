# ============================================================
# ERP CRM OPTION INQUIRY STATUS EXACT MODEL
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-630
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.inquiry_status.exact_model
component: crm-option-inquiry-status-exact-model


# OBJECT

crm_inquiry_case


# PRIMARY STATUS SET

Recommended exact inquiry_status_code set:

- open
- triaged
- in_progress
- waiting_customer
- waiting_internal
- resolved
- closed
- blocked
- archived


# ALLOWED TRANSITIONS

- open -> triaged
- open -> blocked
- triaged -> in_progress
- triaged -> waiting_customer
- triaged -> waiting_internal
- in_progress -> waiting_customer
- in_progress -> waiting_internal
- in_progress -> resolved
- waiting_customer -> in_progress
- waiting_internal -> in_progress
- resolved -> closed
- blocked -> triaged
- blocked -> in_progress
- closed -> archived


# CONTROLLED REOPEN TRANSITIONS

Allowed only with explicit permission and reason:

- resolved -> in_progress
- closed -> in_progress


# PROHIBITED TRANSITIONS

- open -> closed without intervening handling path
- archived -> open
- archived -> in_progress
- closed -> resolved
- any -> deleted by direct state mutation


# INTERPRETATION RULE

resolved and closed are not the same.

resolved means a proposed or executed resolution exists.
closed means the case lifecycle is administratively ended.

