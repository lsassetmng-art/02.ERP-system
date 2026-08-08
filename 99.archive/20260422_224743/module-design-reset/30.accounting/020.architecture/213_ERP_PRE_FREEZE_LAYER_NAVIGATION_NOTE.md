# ============================================================
# ERP PRE FREEZE LAYER NAVIGATION NOTE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Explains how the pre-freeze layer
should be navigated inside the ERP authority promotion flow.

pre_freeze_entry_files:
- 208_ERP_FROZEN_AUTHORITY_REGISTRY_CANDIDATE_OVERVIEW.md
- 209_ERP_FROZEN_AUTHORITY_REGISTRY_CANDIDATE_RUNTIME_SUPPORT_AND_HISTORY.md
- 210_ERP_FROZEN_AUTHORITY_REGISTRY_CANDIDATE_HEADERS_AND_PROJECTIONS.md
- 211_ERP_FROZEN_AUTHORITY_REGISTRY_CANDIDATE_ACCOUNTING_CORE.md
- 212_ERP_FROZEN_AUTHORITY_REGISTRY_CANDIDATE_SUMMARY.md

role:
The pre-freeze layer is the narrowed candidate checkpoint between:
- frozen-candidate frontier
and
- future frozen authority registry

reading_position:
Read after:
- promotion current state
- promotion roadmap
- frozen-candidate checkpoint

Read before:
- frozen authority registry
- final registry freeze
- freeze-ready contract alignment

conclusion:
The pre-freeze layer is the current narrowed candidate layer
closest to actual frozen authority promotion.
