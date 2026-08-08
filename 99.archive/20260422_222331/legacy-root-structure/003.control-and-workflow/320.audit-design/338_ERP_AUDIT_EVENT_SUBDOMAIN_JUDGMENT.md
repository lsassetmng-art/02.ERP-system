# ============================================================
# ERP AUDIT EVENT SUBDOMAIN JUDGMENT
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first-pass judgment
for generic audit event families.

current_reading:
- audit.audit_event is the strongest generic audit-event anchor
- audit.exec_audit_event is a narrower execution-linked event family
- audit.ng_event is a specialized anomaly/NG event family
- audit.entity_status_history is a history-focused audit-linked family

important_interpretation:
These are not interchangeable.
They represent different audit roles:
- generic event
- execution event
- anomaly/NG event
- status history

conclusion:
Audit event architecture should be modeled as a differentiated event family,
not collapsed into one generic table.
