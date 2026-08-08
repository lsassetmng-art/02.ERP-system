# ============================================================
# ERP V2 ARAP NAME GAP RESULTS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the current exact-name gap
for AR/AP preview candidates.

review_basis:
- .tmp/erp-v2-real-source-check/602_exact_object_existence_real_sources.txt
- .tmp/erp-v2-real-source-check/603_semantic_keyword_existence_real_sources.txt

main_findings:
- public.v_ar_accrual_preview was not confirmed by exact-name existence
- public.v_ap_accrual_preview was not confirmed by exact-name existence
- accrual-related semantic hits exist, but exact object confirmation remains absent

current_judgment:
AR/AP is now a name-rediscovery problem,
not yet a frozen authority decision problem.

next_required_step:
- perform semantic rediscovery for AR/AP preview and feeder objects
- do not force the previous exact names as stable truth

conclusion:
AR/AP remains open,
but the right next move is semantic rediscovery rather than premature freezing.
