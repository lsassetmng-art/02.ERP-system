# ============================================================
# ERP DOCUMENT TABLE CLASSIFICATION APPROVAL REQUEST LIKE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides first-pass classification
for approval_request-like tables encountered during document-family review.

review_basis:
- erp_schema_table_column_full.txt

tables:
- ai.approval_request
- audit.approval_request
- govern.approval_request
- governance.approval_request
- notify.approval_request
- system.approval_request
- workflow.approval_request
- public.approval_request_with_url

# ============================================================
# 1. WORKING SPLIT
# ============================================================

working_split:

true_approval_truth_candidates:
- unresolved subset among approval_request-like tables

governance_control_request_candidates:
- govern.approval_request
- governance.approval_request

notify_support_candidates:
- notify.approval_request
- public.approval_request_with_url

system_workflow_support_candidates:
- system.approval_request
- workflow.approval_request

ai_support_candidates:
- ai.approval_request

audit_or_mixed_placement_candidates:
- audit.approval_request

# ============================================================
# 2. PRIMARY JUDGMENT
# ============================================================

primary_judgment:
approval_request-like tables should remain outside simple document source_of_truth classification.

They belong to:
- approval/control/request-support families
not
- general document header truth

# ============================================================
# 3. CONCLUSION
# ============================================================

conclusion:
approval_request-like families must continue to be handled
through subfamily split review rather than document header classification.
