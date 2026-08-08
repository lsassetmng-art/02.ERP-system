# ============================================================
# ERP EVIDENCE CAPTURE SET OVERVIEW
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Explains the role of the ERP evidence capture set.

summary:
The ERP evidence capture set exists after:
- common canonical design stabilization
- exact contract stabilization
- real schema and real table deep review

Its role is to harden provisional judgments using actual evidence from:
- repository/service layer writes
- SQL functions and triggers
- queue/outbox behavior
- sync/materialization paths
- view definitions
- operational scripts and job runners

main_use_cases:
- confirm runtime write authority
- confirm public-vs-domain header authority
- harden settlement and AR/AP source-of-truth boundaries
- separate approval_request-like subfamilies by actual behavior

relationship_to_other_sets:
- common design set = ideal canonical rule layer
- exact contract set = endpoint contract layer
- deep review set = structural reconciliation layer
- evidence capture set = operational confirmation layer

important_note:
This set does not replace deep review.
It is the next step that hardens or revises deep-review conclusions.

conclusion:
The evidence capture set is the formal bridge
from structural reconciliation
to operationally confirmed authority decisions.

# ============================================================
# AUTHORITY REGISTRY OUTPUT
# ============================================================

AUTHORITY REGISTRY OUTPUT

The current evidence-capture phase now produces
a working authority registry draft.

Current authority-registry output:
- 172_ERP_AUTHORITY_REGISTRY_DRAFT_OVERVIEW.md
- 173_ERP_AUTHORITY_REGISTRY_DRAFT_RUNTIME.md
- 174_ERP_AUTHORITY_REGISTRY_DRAFT_HEADERS.md
- 175_ERP_AUTHORITY_REGISTRY_DRAFT_SETTLEMENT_AR_AP_APPROVAL.md
- 176_ERP_AUTHORITY_REGISTRY_DRAFT_SUMMARY.md

Meaning:
Evidence capture is no longer only about collecting signals.
It now feeds a consolidated working authority map.

