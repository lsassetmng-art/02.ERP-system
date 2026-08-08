# ============================================================
# ERP SFA OPTION WON LOST REOPEN AND AUDIT RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-743
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.won_lost_reopen_and_audit.rules
component: sfa-option-won-lost-reopen-and-audit-rules


# RULES

## won
Requires:
- won_at
- win result context
- final opportunity state

## lost
Requires:
- lost_at
- win_loss_reason_code

## reopen
Requires:
- controlled reopen permission
- reopen reason
- audit reflection
- next valid stage target


# PROHIBITIONS

- won -> active stage by ordinary edit
- lost -> active stage by ordinary patch
- missing reason on controlled reopen

