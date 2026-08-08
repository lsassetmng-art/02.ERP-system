# ============================================================
# ERP AUDIT APPROVAL SUBDOMAIN JUDGMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first-pass judgment
for the approval audit subdomain.

current_reading:
- audit.approval_request is the approval audit truth anchor
- audit.approval_log is subordinate action/decision history linked to approval_request

supporting_points:
- approval_log has FK to approval_request
- approval_request has strong policy concentration
- approval_request has insert/update lifecycle evidence
- approval_request already emerged as approval truth in frozen-v2 work

conclusion:
The approval audit subdomain is currently the strongest and most mature audit subdomain.
