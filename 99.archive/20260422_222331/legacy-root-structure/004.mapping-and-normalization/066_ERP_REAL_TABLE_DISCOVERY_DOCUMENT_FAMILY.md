# ============================================================
# ERP REAL TABLE DISCOVERY DOCUMENT FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the next discovery target and review posture
for general document-family real tables.

# ============================================================
# 1. WHY THIS FAMILY IS NEXT
# ============================================================

why_next:
Document list/detail/history contracts exist canonically,
but real document-facing table anchors are not yet consolidated.

relevant_contracts:
- 038_ERP_EXACT_QUERY_DOCUMENTS_LIST.md
- 039_ERP_EXACT_QUERY_DOCUMENT_DETAIL.md
- 040_ERP_EXACT_QUERY_DOCUMENT_HISTORY.md
- intake document-creating contracts

# ============================================================
# 2. DISCOVERY TARGETS
# ============================================================

candidate_name_patterns:
- document
- doc_
- header
- line
- sequence
- history
- state_history
- source_link
- request
- title
- lifecycle

candidate_schema_focus:
- core
- public
- sales
- purchase
- accounting
- approval
- audit for history only

# ============================================================
# 3. REVIEW QUESTIONS
# ============================================================

review_questions:
- is there a shared document envelope/header structure?
- or are documents fully domain-specific with no shared document table?
- where is lifecycle state stored?
- where is history stored?
- where are source links and sequences stored?
- how should generic document query contracts be physically resolved?

# ============================================================
# 4. EXPECTED OUTPUT
# ============================================================

expected_output:
- shared document table or explicit no-shared-document conclusion
- document history table candidates
- lifecycle state storage candidates
- domain-specific document split note
- contract alignment update target

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Document-family discovery is required to turn generic document contracts
into physically grounded real-table alignments.
