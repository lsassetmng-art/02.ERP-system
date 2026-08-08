# ============================================================
# SOP CONSENSUS SCREEN API AND STATE IMPLEMENTATION DESIGN
# ============================================================

status: draft-exact-design
module: 07.sop-consensus

## 1. Screens
- SopConsensusVersionListScreen
- SopConsensusDetailScreen
- ScenarioComparisonScreen
- CapacityAlignmentScreen
- InventoryPolicyAlignmentScreen
- ExecutiveFreezeScreen
- IssueRegisterScreen
- ProductionPlanningSendScreen

## 2. Screen states
- loading
- loaded
- empty
- validation_error
- sync_pending
- scenario_review
- executive_review
- approved_freeze
- handoff_failed
- superseded

## 3. CommonOS use
- list / table / compare / form / dialog / search / filter / queue status
- dense ERP input variant may be used where needed

## 4. API integration points
- create consensus version
- update agreed values
- freeze version
- send to production planning
- list / detail / compare / search

## 5. Exact frontend modules
- presenter/version-list
- presenter/consensus-detail
- presenter/scenario-comparison
- presenter/capacity-alignment
- presenter/freeze-form
- mapper/consensus-summary
- mapper/consensus-detail
- bridge/sop-consensus-api
- sync/consensus-command-queue
