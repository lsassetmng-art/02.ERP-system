# ============================================================
# ERP SCOPE RECLASSIFICATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2226
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.scope_reclassification.rule
component: scope-reclassification-rule


# CLASSIFICATION CATEGORIES

- ▶ erp_core_module
- ▶ erp_paid_option_module
- ▶ erp_industry_dependent_module
- ▶ external_linked_business_app_boundary
- ▶ future_extension_candidate

# RULE

Core:
- broadly load-bearing for ERP operating truth

Paid option:
- valid ERP-side official module, but not required for every tenant

Industry dependent:
- important, but strongly tied to industry or operational complexity

External linked business app boundary:
- not internal ERP module
- ERP only defines intake / handoff / control boundary

Future extension candidate:
- reasonable ERP-side candidate, but classification may depend on later decisions

