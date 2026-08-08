# ============================================================
# ERP SFA OPTION OPPORTUNITY STAGE TRANSITION RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-741
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.sfa_option.opportunity_stage.transition_rules
component: sfa-option-opportunity-stage-transition-rules


# RECOMMENDED STAGE SET

- identified
- qualified
- proposal
- negotiation
- commit
- won
- lost


# ALLOWED FORWARD TRANSITIONS

- identified -> qualified
- qualified -> proposal
- proposal -> negotiation
- negotiation -> commit
- commit -> won
- commit -> lost
- negotiation -> lost
- proposal -> lost
- qualified -> lost


# CONTROLLED REOPEN / STEP-BACK

Allowed only with reason and audit reflection:
- lost -> proposal
- lost -> negotiation
- won -> negotiation


# RULE

won and lost are terminal commercial outcomes unless
controlled reopen path is used.

