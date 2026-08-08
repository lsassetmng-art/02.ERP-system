# ============================================================
# DEMAND FORECASTING SOP AND PRODUCTION PLANNING BOUNDARY
# ============================================================

status: generated
owner: Boss
prepared_by: Zero

canonical_split:
  06.demand-forecasting:
    purpose:
      - market demand forecast
      - sales forecast
      - store forecast
      - channel forecast
      - promotion impact
      - new product demand view

  07.sop-consensus:
    purpose:
      - consensus demand
      - consensus supply
      - inventory policy alignment
      - capacity consensus
      - executive freeze / approved plan

  16.production-planning:
    purpose:
      - production planning
      - MRP
      - CRP
      - scheduling
      - manufacturing release recommendation

flow:
- 06.demand-forecasting
- 07.sop-consensus
- 16.production-planning
- 15.manufacturing

rules:
- sales/store forecast truth must not be overwritten by production planning truth
- S&OP consensus is a separate agreed-plan truth
- production planning consumes consensus and creates executable planning truth
