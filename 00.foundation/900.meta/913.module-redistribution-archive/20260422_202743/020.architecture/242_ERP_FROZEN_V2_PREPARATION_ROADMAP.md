# ============================================================
# ERP FROZEN V2 PREPARATION ROADMAP
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the roadmap for preparing frozen authority registry v2.

roadmap_phases:

  phase_1:
    name:
    - runtime truth competition closure
    targets:
    - system.exec_run_request
    - integration.integration_job

  phase_2:
    name:
    - settlement and AR/AP base-truth closure
    targets:
    - finance.payment_allocation
    - public.v_finance_payment_allocation
    - public.v_ar_accrual_preview
    - public.v_ap_accrual_preview

  phase_3:
    name:
    - approval truth competition closure
    targets:
    - workflow.approval_request
    - system.approval_request

  phase_4:
    name:
    - v2 candidate promotion review

  phase_5:
    name:
    - frozen authority registry v2 assembly

conclusion:
Frozen v2 should focus on unresolved authority competitions,
not on rebuilding the already frozen v1 core.

# ============================================================
# V2 PHASE ENTRY
# ============================================================

V2 PHASE ENTRY

Related next-cycle files:
- 241_ERP_FROZEN_V1_DEFERRED_NEXT_CYCLE_NOTE.md
- 243_ERP_DEFERRED_AUTHORITY_REVIEW_ORDER.md
- 244_ERP_DEFERRED_AUTHORITY_EVIDENCE_BACKLOG.md
- 245_ERP_FROZEN_V2_ENTRY_CONDITIONS.md
- 246_ERP_POST_V1_PROMOTION_SUMMARY.md
- 247_ERP_FROZEN_V2_NAVIGATION_NOTE.md

Meaning:
This document is the roadmap entry for frozen authority registry v2 preparation.

