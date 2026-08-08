# ============================================================
# ERP SHIFTMANAGER_SWAP_AND_PUBLICATION_RULES
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-818
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.shiftmanager_option.swap_and_publication.rules
component: shiftmanager-swap-and-publication-rules


# SWAP STATUS SET

- requested
- manager_review
- approved
- rejected
- executed
- canceled


# PUBLICATION STATUS SET

- pending
- published
- superseded
- canceled


# RULE

Approved swap is not executed swap.
Published roster may later be superseded by a new publication batch,
but prior publication trace must remain visible.

