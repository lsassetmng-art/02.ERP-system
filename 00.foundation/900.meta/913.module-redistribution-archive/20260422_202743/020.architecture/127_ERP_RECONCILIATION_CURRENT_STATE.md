# ============================================================
# ERP RECONCILIATION CURRENT STATE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Explains the current position of ERP reconciliation work.

# ============================================================
# 1. WHAT IS STABLE
# ============================================================

what_is_stable:
- canonical common design structure exists
- exact contract standards exist
- JSON example set exists
- deep review set exists
- mapping/normalization index has been expanded
- revised first-pass contract alignment exists

# ============================================================
# 2. WHAT HAS BEEN LEARNED
# ============================================================

what_has_been_learned:
- schema names alone are insufficient
- real physical schema is fragmented and mixed
- public schema contains some likely authoritative accounting truth
- approval_request-like family is mixed, not simple duplicate
- system_control is a duplicated support/config family
- public-vs-domain headers are strongly duplicate/mirror/transitional candidates
- finance.payment_allocation is the strongest current settlement-side candidate
- AR/AP currently has stronger preview anchors than base-ledger anchors

# ============================================================
# 3. WHERE THE RISK IS
# ============================================================

where_the_risk_is:
- unresolved dual-write or hidden write-path behavior
- unresolved mirror/read-model vs base-table distinction
- unresolved source-of-truth location for some accounting families
- unresolved exact real-table target for approval truth

# ============================================================
# 4. CURRENT POSITION
# ============================================================

current_position:
The work is beyond architectural theory
and already inside evidence-based reconciliation.

This is now a mixed state of:
- stable canonical design
- provisional real mapping
- evidence-backed but still incomplete operational alignment

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Current state is strong enough to support deeper operational confirmation,
but not yet final enough to claim full canonical-real closure.

# ============================================================
# EVIDENCE CAPTURE LAYER
# ============================================================

EVIDENCE CAPTURE LAYER

Current position:
The reconciliation work has now entered
an evidence-capture phase.

This means:
- runtime authority is no longer treated as structural guesswork only
- header authority is no longer treated as structural guesswork only
- settlement / AR/AP review is moving beyond candidate anchoring
- approval_request-like families are moving beyond mixed-family suspicion

Root entry:
- 150_ERP_EVIDENCE_CAPTURE_SET_INDEX.md
- 151_ERP_EVIDENCE_CAPTURE_SET_OVERVIEW.md

Meaning:
The project now has a formal operational-confirmation layer,
not just a structural reconciliation layer.


# ============================================================
# AUTHORITY REGISTRY CURRENT CHECKPOINT
# ============================================================

AUTHORITY REGISTRY CURRENT CHECKPOINT

Current position:
The project now has a working authority registry draft.

This means:
- strengthened source-of-truth candidates are consolidated
- projection/view families are explicitly listed
- support/history families are explicitly listed
- unresolved authority questions are concentrated into one registry view

Checkpoint files:
- 172_ERP_AUTHORITY_REGISTRY_DRAFT_OVERVIEW.md
- 173_ERP_AUTHORITY_REGISTRY_DRAFT_RUNTIME.md
- 174_ERP_AUTHORITY_REGISTRY_DRAFT_HEADERS.md
- 175_ERP_AUTHORITY_REGISTRY_DRAFT_SETTLEMENT_AR_AP_APPROVAL.md
- 176_ERP_AUTHORITY_REGISTRY_DRAFT_SUMMARY.md


# ============================================================
# FROZEN CANDIDATE CURRENT CHECKPOINT
# ============================================================

FROZEN CANDIDATE CURRENT CHECKPOINT

Current position:
The project now has a frozen-candidate frontier.

This means:
- some authority entries are strong enough for frozen_candidate review
- some remain hardened and must stay in targeted verification
- unresolved authority questions are now concentrated into a promotion queue

Checkpoint files:
- 189_ERP_FROZEN_AUTHORITY_CANDIDATE_SHORTLIST.md
- 190_ERP_NON_FROZEN_AUTHORITY_REVIEW_QUEUE.md
- 191_ERP_AUTHORITY_UNRESOLVED_QUESTIONS.md
- 192_ERP_AUTHORITY_NEXT_VERIFICATION_QUEUE.md
- 193_ERP_AUTHORITY_REGISTRY_MATURITY_SUMMARY.md


# ============================================================
# AUTHORITY PROMOTION CURRENT PHASE
# ============================================================

AUTHORITY PROMOTION CURRENT PHASE

Current position:
The project now has an explicit authority promotion phase.

This means:
- frozen-candidate frontier is defined
- promotion blockers are concentrated
- next promotion actions are explicit
- promotion-stage decisions are documented

Phase entry files:
- 199_ERP_AUTHORITY_PROMOTION_CURRENT_STATE.md
- 200_ERP_AUTHORITY_PROMOTION_ROADMAP.md
- 201_ERP_AUTHORITY_PROMOTION_NEXT_ACTIONS.md
- 202_ERP_AUTHORITY_PROMOTION_DECISION_LOG.md

