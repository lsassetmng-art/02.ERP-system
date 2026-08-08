# ============================================================
# ERP CRM OPTION DERIVED SURFACE VS SOURCE TRUTH BOUNDARY
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-692
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.derived_surface_vs_source_truth.boundary
component: crm-option-derived-surface-vs-source-truth-boundary


# RULE

Dashboard and analytics surfaces are derived surfaces.

Primary CRM source truth remains in:
- crm_customer_account
- crm_customer_contact
- crm_interaction_log
- crm_inquiry_case
- crm_customer_segment_assignment
- crm_customer_lifecycle_state
- crm_relationship_owner_assignment


# CONSEQUENCE

A dashboard may show:
- counts
- distributions
- averages
- trends
- workload summaries

But it must not overwrite:
- exact status truth
- exact lifecycle truth
- exact time truth
- exact ownership truth


# DRILL-DOWN RULE

Every materially important dashboard measure should
have a drill-down path to exact object-level inspection
when permissions allow.

