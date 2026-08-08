# ============================================================
# ERP AUDIT EXPORT AND DELIVERY JUDGMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first-pass judgment
for audit export and delivery objects.

current_reading:
- integration.audit_export_queue is the strongest audit-export queue candidate
- integration.siem_delivery_queue is the strongest SIEM-delivery queue candidate

interpretation:
These objects belong to the audit-delivery boundary,
not to primary audit truth itself.

meaning:
They are important for externalization and transport,
but should remain separated from:
- audit truth
- audit history
- audit event authority

conclusion:
Audit export and SIEM delivery should be modeled
as boundary/integration layers of audit architecture.
