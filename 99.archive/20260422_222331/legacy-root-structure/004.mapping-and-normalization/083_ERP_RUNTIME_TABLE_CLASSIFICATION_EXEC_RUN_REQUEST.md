# ============================================================
# ERP RUNTIME TABLE CLASSIFICATION EXEC RUN REQUEST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides first-pass canonical classification
for system.exec_run_request.

review_basis:
- erp_schema_table_column_full.txt

table_name:
- system.exec_run_request

# ============================================================
# 1. CURRENT WORKING INTERPRETATION
# ============================================================

current_working_interpretation:
The name strongly suggests a runtime execution request record
rather than pure history or generic config.

likely_semantic_owner:
- 000.platform
- runtime / workflow-support side

# ============================================================
# 2. LIKELY CLASSIFICATION
# ============================================================

likely_classification:
- canonical_layer: 000.platform
- canonical_module: workflow/runtime-support side
- canonical_table_class: source_of_truth or support-source hybrid
- confidence: medium

reason:
The table name suggests an active execution request object,
which is closer to current execution truth than to audit-only history.

# ============================================================
# 3. MAIN REVIEW QUESTIONS
# ============================================================

main_review_questions:
- does it store current execution status?
- does it store requested execution intent only?
- does it store scheduling metadata?
- does it reference downstream attempts/results elsewhere?

# ============================================================
# 4. WORKING JUDGMENT
# ============================================================

working_judgment:
Treat system.exec_run_request as one of the strongest current candidates
for platform-side execution request truth,
pending column confirmation.

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
system.exec_run_request should be prioritized
as a likely current execution/request truth candidate.
