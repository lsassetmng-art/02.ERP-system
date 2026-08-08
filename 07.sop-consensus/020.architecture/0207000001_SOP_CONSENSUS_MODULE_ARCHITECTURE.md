# ============================================================
# SOP CONSENSUS MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 07.sop-consensus

## 1. Logical components
1. Consensus Version Service
2. Demand Consensus Service
3. Supply Consensus Service
4. Inventory Policy Alignment Service
5. Capacity Alignment Service
6. Executive Freeze Decision Service
7. Scenario Comparison Projection Service
8. Production Planning Bridge Service

## 2. Main aggregates
- sop_consensus_version
- sop_consensus_demand
- sop_consensus_supply
- sop_inventory_policy
- sop_capacity_consensus
- sop_decision_record
- sop_issue_register
- sop_production_planning_handoff

## 3. Inbound dependencies
From 06.demand-forecasting:
- frozen forecast candidate payload
- forecast assumptions summary

From supply / planning / inventory references:
- current inventory posture reference
- supply constraint reference
- capacity reference
- lead-time / procurement constraint reference
These remain source references outside 07 canon.

From 52.master-data:
- item reference
- store / region / channel reference
- calendar reference
- org / decision participant reference

From 00.foundation / CommonOS:
- list/detail/form/compare/search presentation base
- sync presentation base

## 4. Outbound surfaces
To 16.production-planning:
- approved consensus plan payload
- executive freeze plan
- issue notes requiring planning attention

To 60.business-intelligence:
- scenario / consensus analytical projection source

## 5. User surfaces
- Consensus Version List
- Consensus Detail
- Scenario Comparison Screen
- Capacity Alignment Screen
- Inventory Policy Alignment Screen
- Executive Freeze Screen
- Unresolved Issue Register
- Production Planning Send Screen

## 6. Architecture rule
- command side updates consensus truth
- query side serves compare/search/list/detail projections
- inbound operational references are not absorbed as source canon
- production-planning handoff is payload/event based
- approved freeze versions must remain auditable and reproducible

## 7. CommonOS boundary
UI shell, table, compare view, form, dialog, queue UI use Foundation.
Consensus logic, freeze truth, decision history, and handoff canon remain inside 07.sop-consensus.
