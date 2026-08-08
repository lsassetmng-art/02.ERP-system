# ============================================================
# ERP CRM OPTION INQUIRY RESPONSE OWNER WORKLOAD ANALYTICS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-691
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.inquiry_response_owner_workload.analytics
component: crm-option-inquiry-response-owner-workload-analytics


# PRIMARY ANALYTICS SURFACES

- inquiry count by status
- inquiry count by category
- overdue response count
- average first-response timing surface
- open inquiry count by owner
- blocked inquiry count by owner
- follow-up required interaction count by owner


# PRIMARY STATEFLOW

dashboard entry
-> workload card selected
-> filtered inquiry or interaction list
-> inquiry detail or interaction detail


# REQUIRED FILTER DIMENSIONS

- inquiry_status_code
- inquiry_category_code
- assigned_owner_user_id
- escalation_flag
- followup_required_flag
- opened_at window
- first_response_at / last_response_at window


# RULE

Response timing surfaces are derived analytical surfaces.
They must not replace exact timestamps stored on inquiry
or interaction objects.

