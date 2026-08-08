# ============================================================
# ERP MA / COSTING / PROJECT ACCOUNTING BOUNDARY MEMO EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- 18.costing
- 31.management-accounting
- 32.project-accounting
- 60.business-intelligence
- 30.accounting

purpose:
Fix the upper boundary between costing, management accounting, project accounting,
financial accounting, and BI so that cost truth, project financial truth,
management accounting analysis, and reporting projection do not drift.

# ============================================================
# 1. MODULE POSITIONS
# ============================================================

## 1.1 18.costing
canonical_role:
- cost calculation / cost component / cost estimate / actual cost basis truth

owns_truth:
- standard cost
- planned cost
- actual cost basis
- cost component structure
- product cost estimate
- manufacturing cost rollup
- cost variance basis
- cost allocation source basis where costing-specific
- cost object calculation detail

does_not_own:
- enterprise management accounting policy as center
- project revenue / project WIP / project billing truth
- statutory financial statement truth
- BI dashboard projection truth

## 1.2 31.management-accounting
canonical_role:
- management accounting center

owns_truth:
- internal profitability view
- budget vs actual management view
- management segment / responsibility center analysis
- contribution margin view
- management allocation rule where used for internal analysis
- internal performance package
- management accounting scenario
- internal KPI pack for management decision support
- managerial closing package

does_not_own:
- source cost calculation detail owned by 18
- project accounting transaction truth owned by 32
- statutory GL truth owned by 30
- BI dataset snapshot truth owned by 60
- source inventory / manufacturing / sales transaction truth

## 1.3 32.project-accounting
canonical_role:
- project financial truth

owns_truth:
- project budget
- project cost accumulation
- project revenue recognition basis where project-specific
- project WIP / capitalization / expense classification basis
- project billing link
- project profitability source package
- project closing / project settlement package

does_not_own:
- generic product costing truth
- enterprise management accounting center policy
- general ledger truth
- BI analytical projection truth

## 1.4 30.accounting
reference_role:
- statutory / financial accounting truth

owns_truth:
- GL journal
- trial balance
- financial close
- statutory financial statements
- accounting posting truth

relationship:
- 31 may consume accounting actuals for management view
- 31 does not rewrite 30 statutory posting truth

## 1.5 60.business-intelligence
reference_role:
- analytical projection truth only

relationship:
- 60 may visualize 18 / 31 / 32 / 30 snapshots
- 60 does not own MA policy, cost calculation, or project financial truth

# ============================================================
# 2. TOP-LEVEL FLOW
# ============================================================

cost_to_ma_flow:
- operational source modules
- -> 18.costing
- -> 31.management-accounting

project_to_ma_flow:
- project operational / billing / cost source modules
- -> 32.project-accounting
- -> 31.management-accounting

accounting_to_ma_flow:
- source modules / subledgers
- -> 30.accounting
- -> 31.management-accounting

ma_to_bi_flow:
- 31.management-accounting
- -> 60.business-intelligence analytical snapshots

rules:
- 31 may compose internal views using 18 / 32 / 30 inputs
- 31 may not back-edit 18 / 32 / 30 source truth
- 60 may not back-edit 31 management accounting truth

# ============================================================
# 3. OWNERSHIP MATRIX
# ============================================================

| concept | owner_module | note |
|---|---|---|
| product cost estimate | 18.costing | cost calculation truth |
| cost component structure | 18.costing | rollup basis |
| cost variance basis | 18.costing | source cost variance truth |
| project budget | 32.project-accounting | project financial truth |
| project WIP / capitalization basis | 32.project-accounting | project-specific accounting package |
| project profitability source package | 32.project-accounting | input to 31 views |
| GL journal / statutory close | 30.accounting | financial accounting truth |
| management segment profitability | 31.management-accounting | internal management view |
| responsibility center budget control | 31.management-accounting | MA center truth |
| managerial allocation scenario | 31.management-accounting | internal analysis / policy |
| dashboard projection | 60.business-intelligence | analytical projection truth |

# ============================================================
# 4. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- 31 directly overwriting 18 cost calculation detail
- 31 directly overwriting 32 project accounting transaction truth
- 31 directly overwriting 30 GL journal truth
- 60 dashboard number treated as MA source truth
- BI what-if scenario becoming management accounting policy without 31 workflow
- project accounting used as generic product costing owner
- costing module used as project accounting owner
- statutory accounting correction performed through management accounting view

# ============================================================
# 5. DECISION TEST
# ============================================================

decision_tests:
- If the object answers "what is the calculated cost basis?" -> 18.costing
- If the object answers "what is the project financial state?" -> 32.project-accounting
- If the object answers "what is the statutory accounting truth?" -> 30.accounting
- If the object answers "how should management analyze performance/profitability/budget?" -> 31.management-accounting
- If the object answers "how should the data be visualized or summarized?" -> 60.business-intelligence

# ============================================================
# 6. COMPLETION STATE
# ============================================================

completion_state:
- MA / costing / project accounting boundary fixed
- MA center position fixed
- source truth vs internal management view separated
- BI projection boundary preserved

# ============================================================
