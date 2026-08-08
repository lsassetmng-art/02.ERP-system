# ============================================================
# ERP ACTUAL CANDIDATE EXTRACTION RESULT SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the current actual candidate extraction posture
for unresolved real table families.

covered_families:
- settlement
- receivable/payable
- execution/runtime
- document

current_position:
The candidate extraction layer is now defined for each unresolved family.

meaning:
The next step is no longer "what family should be searched"
but "which concrete table names from the uploaded schema inventory
belong in each family."

most important caution:
Pattern matches generate candidates only.
They do not prove ownership or final classification.

recommended next action order:
1. extract explicit receivable/payable names
2. extract explicit settlement names
3. extract explicit execution/retry/attempt names
4. extract explicit document/document-history names
5. only then widen to vague support terms such as match, header, line, run, job

conclusion:
The unresolved family review is now ready
to move from pattern definition into concrete table-name extraction.
