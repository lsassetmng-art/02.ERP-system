# ============================================================
# ERP AUDIT DESIGN CURRENT STATE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Explains the current audit-design position
after reconciliation, evidence, and frozen-registry work.

already_strengthened:
- audit.approval_request is now a strong approval truth anchor
- audit.approval_log is structurally linked to approval truth
- audit-side policies and lifecycle evidence are visible
- audit has begun to appear as more than passive history

not_yet_fully_designed:
- full audit domain architecture
- audit event taxonomy
- audit truth vs operational truth boundary
- audit retention and export layers
- audit query/read models
- audit evidence chain across runtime / approval / business domains

current_position:
Audit is no longer only a supporting observation layer.
It now needs a full architecture pass.

conclusion:
Audit design is the strongest next expansion target
after frozen authority registry v2 actual closure.
