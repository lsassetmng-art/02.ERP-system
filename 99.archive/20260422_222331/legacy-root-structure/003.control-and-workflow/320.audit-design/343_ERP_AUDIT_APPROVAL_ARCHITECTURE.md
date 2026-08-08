# ============================================================
# ERP AUDIT APPROVAL ARCHITECTURE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass architecture
for the approval-audit subdomain.

main_objects:
- audit.approval_request
- audit.approval_log

role_split:
- audit.approval_request:
  - approval audit truth anchor
  - lifecycle and decision carrier

- audit.approval_log:
  - subordinate action / decision log
  - linked history under approval_request

boundary_to_non_audit_layers:
- system.approval_request is not primary audit truth
- notify.approval_request is not primary audit truth
- public.approval_request_with_url is not primary audit truth

main_rule:
Approval audit truth should remain centered on audit.approval_request,
with linked history captured in audit.approval_log.

conclusion:
Approval is the strongest and most mature audit subdomain
and should serve as the anchor for broader audit architecture.
