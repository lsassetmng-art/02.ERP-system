# ============================================================
# ERP AUDIT EXPORT BOUNDARY ARCHITECTURE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass architecture
for audit export and delivery boundaries.

main_objects:
- integration.audit_export_queue
- integration.siem_delivery_queue

role_split:
- integration.audit_export_queue:
  - audit export queue boundary

- integration.siem_delivery_queue:
  - SIEM delivery queue boundary

main_rule:
These objects do not define audit truth.
They define outbound delivery and transport boundaries.

design_implication:
Audit architecture must distinguish:
- internal audit truth
from
- export / externalization / SIEM transport layers

conclusion:
Audit export and SIEM delivery belong to the integration boundary of audit,
not to the primary audit truth layer.
