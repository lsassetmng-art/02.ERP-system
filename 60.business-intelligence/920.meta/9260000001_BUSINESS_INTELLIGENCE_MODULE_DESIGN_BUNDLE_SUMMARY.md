# ============================================================
# BUSINESS INTELLIGENCE MODULE DESIGN BUNDLE SUMMARY
# ============================================================

status: generated
module: 60.business-intelligence
prepared_by: Zero

generated_docs:
- 010.constitution/0160000001_BUSINESS_INTELLIGENCE_MODULE_CONSTITUTION.md
- 020.architecture/0260000001_BUSINESS_INTELLIGENCE_MODULE_ARCHITECTURE.md
- 030.model/0360000001_BUSINESS_INTELLIGENCE_MODULE_CANONICAL_MODEL.md
- 050.flow/0560000001_SOURCE_TO_ANALYTICS_PROJECTION_FLOW.md
- 060.integration/0660000001_BUSINESS_INTELLIGENCE_INTEGRATION_AND_EXACT_PAYLOAD.md
- 070.operations/0760000001_BUSINESS_INTELLIGENCE_OPERATIONS_RUNBOOK.md
- 080.policy/0860000001_BUSINESS_INTELLIGENCE_POLICY_AND_BOUNDARY.md
- 100.security/1060000001_BUSINESS_INTELLIGENCE_SECURITY_AND_ACCESS_CONTROL.md
- 110.infrastructure/1160000001_BUSINESS_INTELLIGENCE_INFRASTRUCTURE_AND_STORAGE.md
- 120.implementation/1260000001_BUSINESS_INTELLIGENCE_SCREEN_API_AND_STATE_IMPLEMENTATION_DESIGN.md
- 130.development/1360000001_BUSINESS_INTELLIGENCE_DEVELOPMENT_PLAN_AND_ACCEPTANCE.md

module_boundary_summary:
- BI owns analytical projection truth only
- source modules remain owners of business canon
- drill-down links point back to source-owned surfaces

next_recommended_module:
- 51.audit deepening
