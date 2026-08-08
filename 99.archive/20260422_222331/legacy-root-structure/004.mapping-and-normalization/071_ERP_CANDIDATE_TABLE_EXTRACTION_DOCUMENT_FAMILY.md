# ============================================================
# ERP CANDIDATE TABLE EXTRACTION DOCUMENT FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the candidate table extraction rule
for general document-family real tables.

target_family:
- document

search_name_patterns:
- document
- doc_
- header
- line
- sequence
- history
- state_history
- source_link
- request
- lifecycle
- title

priority_schema_focus:
- core
- public
- sales
- purchase
- accounting
- approval
- audit for history only

candidate_bucket_rules:
- explicit document names -> highest priority
- shared header/line names with broad scope -> high priority
- history/state_history/source_link -> medium priority
- request names -> medium priority and must be separated from final document truth
- sequence names -> support candidate by default

expected_candidate_outputs:
- shared document envelope candidates
- domain-specific document truth candidates
- document history candidates
- lifecycle support candidates
- sequence/support candidates

next_classification_goal:
For every extracted candidate:
- shared document vs domain document
- source_of_truth vs history vs support
- lifecycle truth vs request truth
