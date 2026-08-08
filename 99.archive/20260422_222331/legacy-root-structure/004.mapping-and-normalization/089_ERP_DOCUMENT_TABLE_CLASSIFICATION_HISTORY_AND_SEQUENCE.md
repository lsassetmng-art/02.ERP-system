# ============================================================
# ERP DOCUMENT TABLE CLASSIFICATION HISTORY AND SEQUENCE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides first-pass canonical classification
for document history, sequence, and support-side families.

review_basis:
- erp_schema_table_column_full.txt

tables:
- core.document_sequence
- public.document_sequence
- core.status_history
- public.status_history
- audit.entity_status_history
- governance.document_archive
- ops.document_file
- ops.document_send_history
- ops.document_send_queue
- ops.document_type_master

# ============================================================
# 1. LIKELY CLASSIFICATION
# ============================================================

core.document_sequence:
  canonical_layer:
  - 000.platform or shared document support
  canonical_table_class:
  - support
  confidence:
  - medium

public.document_sequence:
  canonical_layer:
  - 000.platform or shared document support
  canonical_table_class:
  - support or duplicate support
  confidence:
  - medium

core.status_history:
  canonical_layer:
  - mixed support/history
  canonical_table_class:
  - history
  confidence:
  - medium

public.status_history:
  canonical_layer:
  - mixed support/history
  canonical_table_class:
  - history
  confidence:
  - medium

audit.entity_status_history:
  canonical_layer:
  - 000.platform / 090.audit
  canonical_table_class:
  - history or audit
  confidence:
  - medium_to_high

governance.document_archive:
  canonical_layer:
  - 200.management or support/archive side
  canonical_table_class:
  - support or history/archive
  confidence:
  - low_to_medium

ops.document_file:
  canonical_layer:
  - 000.platform support
  canonical_table_class:
  - support
  confidence:
  - medium

ops.document_send_history:
  canonical_layer:
  - 000.platform support
  canonical_table_class:
  - history
  confidence:
  - high

ops.document_send_queue:
  canonical_layer:
  - 000.platform support
  canonical_table_class:
  - support
  confidence:
  - high

ops.document_type_master:
  canonical_layer:
  - shared support / registry side
  canonical_table_class:
  - registry
  confidence:
  - medium

# ============================================================
# 2. PRIMARY JUDGMENT
# ============================================================

primary_judgment:
These tables are mostly:
- history
- support
- registry
and should not be mistaken for primary document source_of_truth.

# ============================================================
# 3. CONCLUSION
# ============================================================

conclusion:
Document history/sequence/file/send structures are now reasonably classifiable
as non-primary document truth families.
