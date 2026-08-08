# ============================================================
# ERP BUSINESS UNRESOLVED QUESTIONS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Lists the main unresolved architecture questions for business design.

unresolved_questions:
- What is the best top-level business domain split across sales, purchase, inventory, and manufacturing?
- Which document families are primary business truth versus subordinate detail?
- Which business objects are handoff carriers rather than domain truth anchors?
- How should billing, purchase invoice, and three-way-match be layered?
- Where does customer/business master stop and transaction truth begin?
- Which business flows should be treated as lifecycle chains rather than isolated tables?

conclusion:
These questions should guide the first full business architecture pass.
