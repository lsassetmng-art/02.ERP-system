# ============================================================
# ERP SFA OPTION SALES ACTION STATE RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-742
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.sales_action.state_rules
component: sfa-option-sales-action-state-rules


# RECOMMENDED STATUS SET

- open
- due_soon
- overdue
- completed
- canceled
- blocked


# ALLOWED TRANSITIONS

- open -> due_soon
- open -> completed
- open -> canceled
- due_soon -> overdue
- due_soon -> completed
- overdue -> completed
- overdue -> canceled
- blocked -> open
- blocked -> canceled


# RULE

Action completion must preserve action_completed_at.
Overdue is a time-aware operational status, not just a UI label.

