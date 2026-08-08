# ============================================================
# ERP AUDIT DESIGN SCOPE AND BOUNDARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the design scope and boundary for ERP audit architecture.

inside_audit_scope:
- approval audit truth
- approval action logs
- entity status history linkage
- execution audit events
- NG / exception event evidence
- audit export / SIEM-facing integration surfaces
- retention / review / evidence chain rules

outside_audit_scope:
- direct business truth ownership for ordinary business documents
- notification delivery truth
- runtime execution truth itself
- projection-only public read surfaces unless audit-specific

boundary_questions:
- what belongs in audit as source-of-truth
- what remains operational truth but mirrored into audit
- what is history only
- what is evidence only
- what is export-only

conclusion:
Audit architecture must be designed as its own domain,
not as a generic leftovers bucket.
