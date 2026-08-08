# ============================================================
# ERP ACTUAL CANDIDATE TABLE LIST RECEIVABLE PAYABLE FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the current actual review candidate list
for receivable/payable-family table discovery.

review_position:
This is a candidate extraction result document,
not a final ownership decision document.

candidate_family_patterns:
- receivable
- payable
- ar_
- ap_
- ledger
- balance
- open_amount
- original_amount
- due
- aging
- writeoff
- write_off

priority_schema_focus:
- accounting
- finance
- billing
- public

current_actual_candidate_buckets:

  highest_priority_explicit_names:
  - *receivable*
  - *payable*
  - ar_*
  - ap_*

  high_priority_ledger_names:
  - *ledger*
  - *balance*

  medium_priority_due_and_aging_names:
  - *due*
  - *aging*
  - *open_amount*
  - *original_amount*

  specialized_followup_names:
  - *writeoff*
  - *write_off*

working_notes:
- explicit receivable/payable names should anchor discovery first
- billing overlap is possible, but billing should not automatically own AR/AP truth
- due/aging names may be support/projection rather than source_of_truth

next_required_action:
Locate actual matching table names from schema inventory
and classify them into:
- receivable truth
- payable truth
- support/projection
- specialized writeoff structures
