# ============================================================
# ERP CRM PAID OPTION NEXT DECISION MEMO
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-712
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_paid_option.next_decision_memo
component: crm-paid-option-next-decision-memo


# DECISION POSITION

After the CRM paid option bundled design pass,
the most natural next ERP design decision is:

- move to SFA paid option detailed design

Alternative later-return items for CRM may include:
- deeper dashboard metric formulas
- implementation mapping
- tenant-specific capability templates


# RECOMMENDATION

Do not keep extending CRM indefinitely before starting SFA.

CRM is now mature enough to serve as the upstream
customer context layer for SFA design.

