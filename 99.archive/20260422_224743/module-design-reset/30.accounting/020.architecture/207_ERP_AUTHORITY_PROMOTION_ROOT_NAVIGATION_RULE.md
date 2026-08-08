# ============================================================
# ERP AUTHORITY PROMOTION ROOT NAVIGATION RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines how the authority promotion set
should be navigated from the root level.

root_entry_files:
- 199_ERP_AUTHORITY_PROMOTION_CURRENT_STATE.md
- 200_ERP_AUTHORITY_PROMOTION_ROADMAP.md
- 201_ERP_AUTHORITY_PROMOTION_NEXT_ACTIONS.md
- 202_ERP_AUTHORITY_PROMOTION_DECISION_LOG.md
- 203_ERP_AUTHORITY_PROMOTION_NAVIGATION_NOTE.md
- 204_ERP_AUTHORITY_PROMOTION_ROOT_PATCH.md

navigation_role:
These files are the current phase entry between:
- frozen-candidate checkpoint
and
- future frozen authority registry

required_root_links:
- DESIGN_MASTER_INDEX.md -> authority promotion set
- ERP_SYSTEM_MASTER_INDEX.md -> authority promotion set
- 126_ERP_RECONCILIATION_ROADMAP.md -> authority promotion phase entry
- 127_ERP_RECONCILIATION_CURRENT_STATE.md -> authority promotion phase entry
- 199_ERP_AUTHORITY_PROMOTION_CURRENT_STATE.md -> promotion current state entry
- 200_ERP_AUTHORITY_PROMOTION_ROADMAP.md -> promotion roadmap entry

recommended_reading_order:
1. 199_ERP_AUTHORITY_PROMOTION_CURRENT_STATE.md
2. 200_ERP_AUTHORITY_PROMOTION_ROADMAP.md
3. 201_ERP_AUTHORITY_PROMOTION_NEXT_ACTIONS.md
4. 202_ERP_AUTHORITY_PROMOTION_DECISION_LOG.md
5. 203_ERP_AUTHORITY_PROMOTION_NAVIGATION_NOTE.md

conclusion:
The authority promotion set must be root-navigable,
because it is now the active phase entry
after frozen-candidate checkpointing.
