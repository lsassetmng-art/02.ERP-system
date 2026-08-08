# ============================================================
# ERP CANDIDATE TABLE EXTRACTION SETTLEMENT FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the candidate table extraction rule
for settlement-family real tables.

target_family:
- settlement

search_name_patterns:
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

candidate_bucket_rules:
- names containing settlement -> highest priority
- names containing apply/applied with accounting context -> medium priority
- names containing clearing/allocation/offset -> medium priority
- names containing generic match only -> low priority unless accounting context is obvious

expected_candidate_outputs:
- header-like candidate tables
- line/application candidate tables
- support or history candidate tables
- possible duplicate or specialized variants

next_classification_goal:
For every extracted candidate:
- source_of_truth vs support
- header vs line
- direct vs derived
