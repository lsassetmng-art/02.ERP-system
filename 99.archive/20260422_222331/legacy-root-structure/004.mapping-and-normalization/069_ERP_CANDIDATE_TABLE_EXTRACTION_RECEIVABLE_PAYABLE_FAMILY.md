# ============================================================
# ERP CANDIDATE TABLE EXTRACTION RECEIVABLE PAYABLE FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the candidate table extraction rule
for receivable/payable-family real tables.

target_families:
- receivable
- payable

search_name_patterns:
- receivable
- payable
- ar_
- ap_
- open_amount
- original_amount
- due
- aging
- ledger
- balance
- writeoff
- write_off

priority_schema_focus:
- accounting
- finance
- billing
- public

candidate_bucket_rules:
- explicit receivable/payable names -> highest priority
- ledger + accounting context -> high priority
- balance/open_amount/due patterns -> medium priority
- writeoff/write_off patterns -> support or specialized candidate unless strong ledger semantics appear

expected_candidate_outputs:
- receivable truth candidates
- payable truth candidates
- balance/aging support candidates
- writeoff specialized candidates

next_classification_goal:
For every extracted candidate:
- authoritative ledger vs support/projection
- receivable vs payable split
- source_of_truth vs projection
