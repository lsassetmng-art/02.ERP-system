# ============================================================
# ERP ANALYTICS UNRESOLVED QUESTIONS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Lists the main unresolved architecture questions for analytics design.

unresolved_questions:
- What are the best top-level analytics object families in the ERP?
- Which objects are true analytics anchors versus ordinary read/projection surfaces?
- Which analytical outputs are management-facing versus business-facing?
- How should alert and judgement analytics be modeled?
- Where should analytics boundary to audit and management be fixed?
- Which analytical layers are refreshable derived truth versus disposable projections?

conclusion:
These questions should guide the first full analytics architecture pass.
