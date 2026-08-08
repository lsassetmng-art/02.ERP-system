# ============================================================
# ERP AUDIT DESIGN ROADMAP
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the roadmap for full audit design coverage.

audit_targets:
- audit domain role
- audit event model
- audit trail architecture
- evidence chain model
- approval-to-audit linkage
- runtime-to-audit linkage
- retention and review boundaries

main_questions:
- what belongs to audit truth
- what is operational truth vs audit history
- how approval decisions are reflected into audit
- how runtime execution is reflected into audit
- how evidence should be queryable and retained

conclusion:
Audit design still needs a dedicated full-pass architecture phase.
