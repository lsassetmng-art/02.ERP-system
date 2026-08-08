# ============================================================
# ERP AUDIT EVENT ARCHITECTURE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass architecture
for event-oriented audit families.

main_objects:
- audit.audit_event
- audit.exec_audit_event
- audit.entity_status_history
- audit.ng_event

role_split:
- audit.audit_event:
  - generic audit event authority

- audit.exec_audit_event:
  - execution-linked audit event family

- audit.entity_status_history:
  - state transition / status history family

- audit.ng_event:
  - anomaly / NG / severity / quarantine family

main_rule:
These families should not be collapsed into one table role.
They represent different event semantics inside the audit domain.

design_implication:
Audit event architecture should support:
- generic events
- execution events
- status history
- anomaly events
as separate but related layers.

conclusion:
The audit event subdomain is a differentiated event architecture,
not a flat event store.
