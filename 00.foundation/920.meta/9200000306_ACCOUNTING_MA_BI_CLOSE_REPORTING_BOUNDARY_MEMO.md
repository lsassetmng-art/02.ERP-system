# ============================================================
# ERP ACCOUNTING / MANAGEMENT ACCOUNTING / BI
# CLOSE AND REPORTING BOUNDARY MEMO EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
scope:
- 30.accounting
- 31.management-accounting
- 60.business-intelligence

purpose:
Fix the boundary between statutory accounting close, managerial close,
and BI analytical reporting so that close truth, internal management view,
and dashboard projection do not drift.

# ============================================================
# 1. MODULE POSITIONS
# ============================================================

## 1.1 30.accounting
canonical_role:
- statutory / financial accounting truth

owns_truth:
- GL journal
- subledger posting integration
- trial balance
- accounting period close
- financial close package
- statutory financial statement basis
- accounting correction / adjustment journal
- audit trail for accounting close
- reopened accounting period state

does_not_own:
- internal management segment interpretation
- managerial allocation scenario
- BI dashboard projection
- visual reporting snapshot

## 1.2 31.management-accounting
canonical_role:
- internal management close and management reporting truth

owns_truth:
- managerial close package
- internal profitability package
- responsibility center report package
- budget vs actual package
- management allocation result
- variance analysis package
- internal decision-support package

does_not_own:
- GL journal truth
- statutory financial close truth
- source accounting correction authority
- BI dataset snapshot truth

## 1.3 60.business-intelligence
canonical_role:
- analytical projection and dashboard truth only

owns_truth:
- BI dataset snapshot
- dashboard projection
- executive summary projection
- KPI definition
- drill-down link
- refresh run / stale state

does_not_own:
- statutory close
- managerial close
- accounting correction
- management accounting approval
- GL / journal / trial balance source truth

# ============================================================
# 2. CLOSE / REPORTING FLOW
# ============================================================

canonical_flow:
- source modules
- -> 30.accounting statutory posting / close
- -> 31.management-accounting managerial close / internal reports
- -> 60.business-intelligence dataset snapshots / dashboards

parallel_flow:
- 30.accounting may also feed 60 directly for statutory dashboards
- 31.management-accounting may feed 60 for internal management dashboards

rules:
- 60 does not sit in the approval path for 30 close
- 60 does not sit in the approval path for 31 managerial close
- 31 may consume 30 close data, but does not rewrite GL truth
- 60 may visualize 30 and 31, but does not mutate either

# ============================================================
# 3. OWNERSHIP MATRIX
# ============================================================

| concept | owner_module | note |
|---|---|---|
| GL journal | 30.accounting | statutory accounting truth |
| trial balance | 30.accounting | financial close basis |
| accounting close package | 30.accounting | statutory close truth |
| adjustment journal | 30.accounting | accounting correction truth |
| managerial close package | 31.management-accounting | internal management close |
| responsibility center report | 31.management-accounting | internal management report |
| profitability package | 31.management-accounting | internal management view |
| allocation run result | 31.management-accounting | MA internal output |
| BI dataset snapshot | 60.business-intelligence | analytical point-in-time copy |
| dashboard projection | 60.business-intelligence | visual/reporting projection |
| executive summary projection | 60.business-intelligence | analytical summary only |

# ============================================================
# 4. CLOSE STATE RELATIONSHIP
# ============================================================

30_accounting_close_states:
- open
- pre_close
- close_review
- closed
- locked
- reopened
- superseded

31_managerial_close_states:
- preparing
- review_pending
- approved
- frozen
- reopened
- superseded

60_reporting_states:
- snapshot_ready
- dashboard_published
- stale
- refresh_pending
- retired

rules:
- 30 closed/locked does not automatically freeze 31 managerial close
- 31 frozen does not automatically lock 30 accounting period
- 60 published does not approve 30 or 31
- 30 reopen may require 31 refresh/reopen decision
- 31 reopen may require 60 refresh
- 60 refresh never reopens 30 or 31

# ============================================================
# 5. CORRECTION / REOPEN BOUNDARY
# ============================================================

accounting_correction_rule:
- statutory accounting corrections must be performed in 30.accounting
- correction must use accounting adjustment / correction workflow
- correction must not be performed from 31 or 60

managerial_reopen_rule:
- managerial close corrections must be performed in 31.management-accounting
- source accounting correction may trigger managerial close reopen
- managerial interpretation correction does not directly change GL

BI_refresh_rule:
- BI refresh creates new dataset snapshot
- BI refresh does not correct 30 or 31 source truth
- stale dashboard must show stale / source_changed_after_snapshot when applicable

# ============================================================
# 6. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- BI dashboard used as statutory close source
- BI executive summary used as accounting approval
- management accounting package directly editing GL journal
- accounting correction performed through BI drill-down
- managerial close freeze treated as statutory close lock
- statutory close lock treated as management reporting approval
- silent BI snapshot overwrite after close correction
- dashboard value copied back as source accounting truth

# ============================================================
# 7. DECISION TEST
# ============================================================

decision_tests:
- If it is statutory financial accounting truth, 30 owns it.
- If it is internal management close / profitability / budget-control view, 31 owns it.
- If it is visualized, aggregated, refreshed, or summarized analytically, 60 owns projection only.
- If it changes source accounting meaning, it must return to 30 workflow.
- If it changes internal management interpretation, it must return to 31 workflow.

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- accounting close boundary fixed
- managerial close boundary fixed
- BI reporting projection boundary fixed
- reopen / correction / refresh responsibilities separated

# ============================================================
