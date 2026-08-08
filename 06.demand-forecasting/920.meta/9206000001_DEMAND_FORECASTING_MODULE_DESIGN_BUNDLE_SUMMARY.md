# ============================================================
# DEMAND FORECASTING MODULE DESIGN BUNDLE SUMMARY
# ============================================================

status: generated
module: 06.demand-forecasting
prepared_by: Zero

generated_docs:
- 010.constitution/0106000001_DEMAND_FORECASTING_MODULE_CONSTITUTION.md
- 020.architecture/0206000001_DEMAND_FORECASTING_MODULE_ARCHITECTURE.md
- 030.model/0306000001_DEMAND_FORECASTING_MODULE_CANONICAL_MODEL.md
- 050.flow/0506000001_DEMAND_FORECAST_TO_SOP_INPUT_FLOW.md
- 060.integration/0606000001_DEMAND_FORECASTING_INTEGRATION_AND_EXACT_PAYLOAD.md
- 070.operations/0706000001_DEMAND_FORECASTING_OPERATIONS_RUNBOOK.md
- 080.policy/0806000001_DEMAND_FORECASTING_POLICY_AND_BOUNDARY.md
- 100.security/1006000001_DEMAND_FORECASTING_SECURITY_AND_ACCESS_CONTROL.md
- 110.infrastructure/1106000001_DEMAND_FORECASTING_INFRASTRUCTURE_AND_STORAGE.md
- 120.implementation/1206000001_DEMAND_FORECASTING_SCREEN_API_AND_STATE_IMPLEMENTATION_DESIGN.md
- 130.development/1306000001_DEMAND_FORECASTING_DEVELOPMENT_PLAN_AND_ACCEPTANCE.md

module_boundary_summary:
- 06 owns market demand forecast truth
- 07 owns consensus plan truth
- 16 owns executable production planning truth

next_recommended_module:
- 07.sop-consensus
