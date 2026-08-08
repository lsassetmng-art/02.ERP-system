# ============================================================
# ERP RECONCILIATION ROADMAP
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the roadmap for reconciling canonical ERP design,
exact contracts, and real physical schema/table reality.

# ============================================================
# 1. PHASE MAP
# ============================================================

phase_map:

  phase_1:
    name:
    - canonical common design stabilization
    status:
    - largely established
    outputs:
    - core principles
    - interface/contract standards
    - workflow/control standards
    - mapping/normalization base set

  phase_2:
    name:
    - exact contract stabilization
    status:
    - largely established
    outputs:
    - intake contracts
    - approval/accounting/runtime contracts
    - query contracts
    - JSON examples

  phase_3:
    name:
    - real schema and real table reconciliation
    status:
    - in progress
    outputs:
    - schema inventory
    - mixed schema review
    - duplicate/transitional review
    - revised real-table mapping
    - revised contract alignment

  phase_4:
    name:
    - operational confirmation
    status:
    - next major step
    outputs:
    - runtime write-path confirmation
    - public-vs-domain mirror confirmation
    - authority hardening
    - deeper source-of-truth confirmation

# ============================================================
# 2. CURRENT STRONG AREAS
# ============================================================

current_strong_areas:
- canonical ERP principles
- exact contract structure
- periods and journal first-pass real-table anchors
- document header duplicate/mirror/transitional suspicion
- runtime-family candidate structure
- settlement-family application-side candidate
- AR/AP preview-side anchors

# ============================================================
# 3. CURRENT WEAK AREAS
# ============================================================

current_weak_areas:
- settlement header truth
- AR/AP base ledger truth
- true approval-request subfamily direct real-table target
- actual write-path confirmation for runtime
- actual mirror/transitional confirmation for public header tables

# ============================================================
# 4. ROADMAP DIRECTION
# ============================================================

roadmap_direction:
- strengthen unresolved real-table families
- confirm operational write paths
- harden provisional authority decisions
- revise contract alignment again after stronger evidence
- eventually produce stable canonical-to-real authority registry

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
The roadmap is no longer about defining canonical ERP from scratch.
It is now about hardening the bridge
between canonical design and real operational implementation.

# ============================================================
# PHASE 5 EVIDENCE-BASED AUTHORITY HARDENING
# ============================================================

PHASE 5:
  name:
  - evidence-based authority hardening
  status:
  - started
  outputs:
  - runtime write-path evidence capture
  - header write-path evidence capture
  - settlement and AR/AP evidence capture
  - approval_request subfamily evidence capture
  - stronger authority confirmation inputs

phase_5_root_entry:
- 150_ERP_EVIDENCE_CAPTURE_SET_INDEX.md
- 151_ERP_EVIDENCE_CAPTURE_SET_OVERVIEW.md

meaning:
Phase 5 is where provisional structural judgments
start being hardened by actual operational evidence.


# ============================================================
# AUTHORITY REGISTRY CHECKPOINT
# ============================================================

AUTHORITY REGISTRY CHECKPOINT

Current checkpoint files:
- 172_ERP_AUTHORITY_REGISTRY_DRAFT_OVERVIEW.md
- 173_ERP_AUTHORITY_REGISTRY_DRAFT_RUNTIME.md
- 174_ERP_AUTHORITY_REGISTRY_DRAFT_HEADERS.md
- 175_ERP_AUTHORITY_REGISTRY_DRAFT_SETTLEMENT_AR_AP_APPROVAL.md
- 176_ERP_AUTHORITY_REGISTRY_DRAFT_SUMMARY.md

Meaning:
The reconciliation roadmap now includes
a working authority-registry checkpoint
between evidence capture and final frozen authority decisions.


# ============================================================
# FROZEN CANDIDATE CHECKPOINT
# ============================================================

FROZEN CANDIDATE CHECKPOINT

Checkpoint files:
- 189_ERP_FROZEN_AUTHORITY_CANDIDATE_SHORTLIST.md
- 190_ERP_NON_FROZEN_AUTHORITY_REVIEW_QUEUE.md
- 191_ERP_AUTHORITY_UNRESOLVED_QUESTIONS.md
- 192_ERP_AUTHORITY_NEXT_VERIFICATION_QUEUE.md
- 193_ERP_AUTHORITY_REGISTRY_MATURITY_SUMMARY.md
- 194_ERP_FROZEN_CANDIDATE_NAVIGATION_NOTE.md

Meaning:
The roadmap now includes a promotion checkpoint
between hardened authority interpretation
and future frozen authority decisions.


# ============================================================
# AUTHORITY PROMOTION PHASE ENTRY
# ============================================================

AUTHORITY PROMOTION PHASE ENTRY

Phase entry files:
- 199_ERP_AUTHORITY_PROMOTION_CURRENT_STATE.md
- 200_ERP_AUTHORITY_PROMOTION_ROADMAP.md
- 201_ERP_AUTHORITY_PROMOTION_NEXT_ACTIONS.md
- 202_ERP_AUTHORITY_PROMOTION_DECISION_LOG.md
- 203_ERP_AUTHORITY_PROMOTION_NAVIGATION_NOTE.md

Meaning:
The reconciliation roadmap now has an explicit promotion-phase entry
after the frozen-candidate checkpoint
and before any future frozen authority registry.

