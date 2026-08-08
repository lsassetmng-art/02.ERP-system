# ============================================================
# SFA MODULE DESIGN BUNDLE SUMMARY
# ============================================================

status: generated
module: 02.sfa
prepared_by: Zero

generated_docs:
- 010.constitution/0102000001_SFA_MODULE_CONSTITUTION.md
- 020.architecture/0202000001_SFA_MODULE_ARCHITECTURE.md
- 030.model/0302000001_SFA_MODULE_CANONICAL_MODEL.md
- 050.flow/0502000001_SFA_LEAD_TO_QUOTE_REQUEST_FLOW.md
- 060.integration/0602000001_SFA_INTEGRATION_AND_EXACT_PAYLOAD.md
- 070.operations/0702000001_SFA_OPERATIONS_RUNBOOK.md
- 080.policy/0802000001_SFA_POLICY_AND_BOUNDARY.md
- 100.security/1002000001_SFA_SECURITY_AND_ACCESS_CONTROL.md
- 110.infrastructure/1102000001_SFA_INFRASTRUCTURE_AND_STORAGE.md
- 120.implementation/1202000001_SFA_SCREEN_API_AND_STATE_IMPLEMENTATION_DESIGN.md
- 130.development/1302000001_SFA_DEVELOPMENT_PLAN_AND_ACCEPTANCE.md

module_boundary_summary:
- SFA owns lead, opportunity, activity, and pipeline canon
- Sales owns quote canon
- CRM owns relationship canon
- Order Management owns execution canon after accepted commercial handoff

next_recommended_module:
- 03.crm
