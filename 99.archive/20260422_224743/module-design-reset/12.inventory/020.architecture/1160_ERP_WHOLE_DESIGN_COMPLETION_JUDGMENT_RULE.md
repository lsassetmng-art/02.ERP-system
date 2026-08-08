# ============================================================
# ERP WHOLE DESIGN COMPLETION JUDGMENT RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1160
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.whole_design_completion.judgment_rule
component: whole-design-completion-judgment-rule


# RULE

The ERP whole design should not be treated as complete
until all of the following are true:

- base layer whole design is complete
- business layer whole design is complete
- management layer whole design is complete
- cross-layer boundary consistency is complete
- cross-layer navigation consistency is complete
- cross-layer reporting interpretation is complete


# CONSEQUENCE

Formal roadmap fixation should happen
after whole-design completion,
not before it.

