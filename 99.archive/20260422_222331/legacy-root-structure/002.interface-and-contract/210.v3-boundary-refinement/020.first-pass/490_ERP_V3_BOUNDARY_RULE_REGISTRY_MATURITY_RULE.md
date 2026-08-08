# ============================================================
# ERP V3 BOUNDARY RULE REGISTRY MATURITY RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the maturity rule
for boundary registry entries.

maturity_levels:
- draft
- first-pass
- reviewed
- stable-candidate

progression_rule:
- draft:
  - candidate wording exists
- first-pass:
  - wording is explicit and linked to objects
- reviewed:
  - wording has passed explicit comparison against nearby domains
- stable-candidate:
  - wording is strong enough to guide later ERP design consistently

review_status_examples:
- drafted
- under-review
- accepted-for-now
- superseded

main_rule:
Maturity expresses strength of architectural confidence.
Review status expresses process state.
They must not be collapsed into one field.

conclusion:
Separate maturity from review state
to keep the registry readable and stable.
