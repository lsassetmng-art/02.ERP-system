# ============================================================
# ERP COLUMN COMPARISON JOURNAL CORE VS ACCOUNTING
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the formal comparison target and review questions
for journal-family tables split across core and accounting.

comparison_targets:
- core.journal_entries
- core.journal_lines
- accounting.journal_candidate
- accounting.journal_draft
- accounting.paper_send_fee_journal

primary_questions:
- which tables contain authoritative posting truth
- which tables contain pre-authoritative proposal/draft truth
- whether specialized journal tables are final or helper structures

required_column_review_points:
- posted_at / finalized_at / validated_at presence
- status columns
- draft/candidate flags
- source document linkage
- accounting period linkage
- debit/credit final amount fields
- authoring vs posting actor fields
- immutable/finality indicators
- row relationship between header and lines

comparison_judgment_rules:
- final posting/finality columns -> source_of_truth candidate
- candidate/draft columns -> staging/transitional candidate
- source link only -> bridge candidate
- specialized subtype with full final columns -> specialized source_of_truth candidate
- specialized subtype without final columns -> support/helper candidate

working_expected_outcome:
- core.journal_entries / core.journal_lines likely authoritative
- accounting.journal_candidate / accounting.journal_draft likely preparatory
- paper_send_fee_journal unresolved until columns reviewed

conclusion:
The journal family must be classified by finality and posting semantics,
not by schema name alone.
