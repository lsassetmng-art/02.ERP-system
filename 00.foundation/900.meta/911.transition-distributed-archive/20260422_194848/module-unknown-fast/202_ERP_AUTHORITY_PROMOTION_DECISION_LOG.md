# ============================================================
# ERP AUTHORITY PROMOTION DECISION LOG
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the current promotion-stage decisions.

# ============================================================
# 1. DECISIONS ALREADY STRONG
# ============================================================

decisions_already_strong:
- public header family is view/projection-side
- sales/purchase header family is stronger write-authority side
- queue/result/history runtime support families are strongly classified
- accounting period and journal anchors are strong

# ============================================================
# 2. DECISIONS NOT YET FROZEN
# ============================================================

decisions_not_yet_frozen:
- exec_run_request vs integration_job final runtime authority
- payment_allocation vs unseen settlement header/base truth
- AR/AP preview vs base-ledger truth
- workflow.approval_request vs system.approval_request final authority

# ============================================================
# 3. CURRENT PROMOTION RULE
# ============================================================

current_promotion_rule:
Promote only when:
- maturity criteria are met
- strongest competing candidates are weakened
- unresolved risk is limited
- registry implications are stable

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
The promotion log now has a clear split
between strong current decisions
and the remaining unresolved promotion targets.
