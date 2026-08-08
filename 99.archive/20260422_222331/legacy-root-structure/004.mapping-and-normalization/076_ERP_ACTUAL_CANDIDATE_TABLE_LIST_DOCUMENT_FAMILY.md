# ============================================================
# ERP ACTUAL CANDIDATE TABLE LIST DOCUMENT FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the current actual review candidate list
for document-family table discovery.

review_position:
This is a candidate extraction result document,
not a final ownership decision document.

candidate_family_patterns:
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

current_actual_candidate_buckets:

  highest_priority_explicit_document_names:
  - *document*
  - doc_*

  shared_structure_names:
  - *header*
  - *line*
  - *sequence*
  - *source_link*

  history_and_state_names:
  - *history*
  - *state_history*
  - *lifecycle*

  cautionary_request_names:
  - *request*

working_notes:
- request names must be separated from final document truth
- header/line names are useful only with clear domain or shared-document context
- sequence names are usually support, not source_of_truth
- history/state_history names should not be confused with current-state truth

next_required_action:
Locate actual matching table names from schema inventory
and classify them into:
- shared document candidates
- domain-specific document truth
- document history
- lifecycle support
- sequence/source-link support
