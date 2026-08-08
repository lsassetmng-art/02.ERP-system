# ============================================================
# ERP REVISION DECISION CASE AND LEARNING RELEASE BUNDLE EXACT SURFACE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-3010
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.revision_decision_case_and_learning_release_bundle.exact_surface
component: revision-decision-case-and-learning-release-bundle-exact-surface


# OBJECT 1

revision_decision_case

Canonical fields:
- revision_decision_case_id
- company_id
- linked_safe_automation_profile_revision_request_id
- linked_operator_knowledge_article_id
- linked_playbook_library_entry_id
- decision_scope_code
- decision_code
- decided_by_reference_code
- decided_at
- decision_summary_text
- decision_state_code
- created_at
- updated_at


# OBJECT 2

learning_release_bundle

Canonical fields:
- learning_release_bundle_id
- company_id
- release_scope_code
- linked_revision_decision_case_id
- linked_superseded_article_id
- linked_superseded_playbook_id
- linked_superseded_profile_id
- release_version_code
- released_at
- release_result_code
- release_summary_text
- release_state_code
- created_at
- updated_at

