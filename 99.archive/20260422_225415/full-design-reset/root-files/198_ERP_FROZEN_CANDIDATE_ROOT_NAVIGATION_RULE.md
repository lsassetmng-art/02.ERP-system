# ============================================================
# ERP FROZEN CANDIDATE ROOT NAVIGATION RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines how the frozen-candidate checkpoint
should be navigated from the root level.

root_entry_files:
- 189_ERP_FROZEN_AUTHORITY_CANDIDATE_SHORTLIST.md
- 190_ERP_NON_FROZEN_AUTHORITY_REVIEW_QUEUE.md
- 191_ERP_AUTHORITY_UNRESOLVED_QUESTIONS.md
- 192_ERP_AUTHORITY_NEXT_VERIFICATION_QUEUE.md
- 193_ERP_AUTHORITY_REGISTRY_MATURITY_SUMMARY.md
- 194_ERP_FROZEN_CANDIDATE_NAVIGATION_NOTE.md
- 195_ERP_FROZEN_CANDIDATE_ROOT_PATCH.md

navigation_role:
These files are the current promotion checkpoint between:
- authority registry draft
and
- future frozen authority decisions

required_root_links:
- DESIGN_MASTER_INDEX.md -> frozen candidate checkpoint
- ERP_SYSTEM_MASTER_INDEX.md -> frozen candidate checkpoint
- 126_ERP_RECONCILIATION_ROADMAP.md -> frozen candidate checkpoint
- 127_ERP_RECONCILIATION_CURRENT_STATE.md -> frozen candidate checkpoint
- 176_ERP_AUTHORITY_REGISTRY_DRAFT_SUMMARY.md -> frozen candidate frontier
- 193_ERP_AUTHORITY_REGISTRY_MATURITY_SUMMARY.md -> promotion checkpoint

recommended_reading_order:
1. 193_ERP_AUTHORITY_REGISTRY_MATURITY_SUMMARY.md
2. 189_ERP_FROZEN_AUTHORITY_CANDIDATE_SHORTLIST.md
3. 190_ERP_NON_FROZEN_AUTHORITY_REVIEW_QUEUE.md
4. 191_ERP_AUTHORITY_UNRESOLVED_QUESTIONS.md
5. 192_ERP_AUTHORITY_NEXT_VERIFICATION_QUEUE.md
6. 194_ERP_FROZEN_CANDIDATE_NAVIGATION_NOTE.md

conclusion:
The frozen-candidate checkpoint must be root-navigable,
because it is now the current promotion gate
toward frozen authority.
