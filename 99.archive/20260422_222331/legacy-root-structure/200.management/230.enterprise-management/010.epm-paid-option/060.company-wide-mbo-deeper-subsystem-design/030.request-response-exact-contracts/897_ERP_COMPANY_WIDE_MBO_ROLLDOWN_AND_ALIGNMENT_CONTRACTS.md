# ============================================================
# ERP COMPANY WIDE MBO ROLLDOWN AND ALIGNMENT CONTRACTS
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-897
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.company_wide_mbo.rolldown_and_alignment_contracts
component: company-wide-mbo-rolldown-and-alignment-contracts


# ROLLDOWN REQUEST BODY

- source_objective_id
- target_objective_id
- rolldown_level_code
- rolldown_basis_code
- assigned_owner_user_id
- effective_from
- effective_to


# ALIGNMENT WRITE REQUEST BODY

- parent_objective_id
- child_objective_id
- alignment_status_code
- alignment_strength_code
- alignment_note


# RULE

Rolldown creation and alignment assessment must remain distinct.

