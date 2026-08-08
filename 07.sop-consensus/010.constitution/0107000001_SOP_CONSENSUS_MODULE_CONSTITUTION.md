# ============================================================
# SOP CONSENSUS MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 07.sop-consensus
owner: Boss
prepared_by: Zero

## 1. Purpose
The S&OP Consensus module governs the agreed demand/supply/capacity/inventory plan truth
between market-side demand forecasting and executable production planning.
It is the canonical module for consensus demand, consensus supply, inventory policy alignment,
capacity alignment, executive freeze decision, and S&OP decision history.

## 2. Canonical scope
The module owns:
- consensus demand canon
- consensus supply canon
- inventory policy agreement canon
- capacity consensus canon
- executive-approved freeze plan canon
- S&OP meeting / decision history canon
- scenario comparison result canon
- exception / unresolved issue canon

## 3. Non-scope
The module does not own:
- raw market demand forecast truth -> 06.demand-forecasting
- executable production planning truth -> 16.production-planning
- manufacturing execution truth -> 15.manufacturing
- inventory balance truth -> 12.inventory
- BI dashboard truth -> 60.business-intelligence
- accounting truth -> 30.accounting

## 4. Core business intent
The module must allow the organization to:
- review market demand candidates
- compare supply, capacity, and inventory scenarios
- agree a consensus plan across departments
- freeze an approved plan for downstream execution planning
- preserve decision history and unresolved issue trace

## 5. Canonical lifecycle
Candidate Input
-> Scenario Review
-> Consensus Draft
-> Executive Review
-> Approved Freeze
-> Sent To Production Planning
-> Superseded / Archived

## 6. Boundary rule
06 owns market demand truth.
07 owns agreed consensus truth.
16 owns executable production planning truth.

## 7. CommonOS usage
S&OP Consensus uses shared UI for:
- consensus version list
- scenario compare
- issue tracking list
- freeze decision form
- search / filter
- offline queue presentation
The business canon remains inside 07.sop-consensus.
