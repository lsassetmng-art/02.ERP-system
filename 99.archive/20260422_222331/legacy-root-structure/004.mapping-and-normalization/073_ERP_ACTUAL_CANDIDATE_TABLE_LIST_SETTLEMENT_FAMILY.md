# ============================================================
# ERP ACTUAL CANDIDATE TABLE LIST SETTLEMENT FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the current actual review candidate list
for settlement-family table discovery.

review_position:
This is a candidate extraction result document,
not a final ownership decision document.

candidate_family_patterns:
- settlement
- settled
- apply
- applied
- clearing
- allocation
- offset
- receipt_to_ar
- payment_to_ap
- match

priority_schema_focus:
- accounting
- finance
- public
- core

current_actual_candidate_buckets:

  highest_priority_explicit_settlement_names:
  - settlement*
  - settled*

  accounting_context_application_names:
  - *apply*
  - *applied*
  - *allocation*
  - *offset*
  - *clearing*

  lower_confidence_generic_match_names:
  - *match*

working_notes:
- generic *match* names should not be over-trusted without accounting context
- settlement-family may appear as header/line pairs or as allocation/application structures
- downstream journal linkage must not be mistaken for settlement source-of-truth automatically

next_required_action:
Locate actual matching table names from schema inventory
and classify them into:
- header truth
- line/application truth
- support/history
