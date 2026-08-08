# ============================================================
# ERP MRP PAID OPTION CANONICAL SCOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-924
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_paid_option.canonical_scope
component: mrp-paid-option-canonical-scope


# IN SCOPE

- demand program
- BOM definition
- material requirement run
- net requirement interpretation
- planned order
- purchase recommendation
- lead-time profile usage
- allocation and planning exception visibility
- planning and shortage reporting


# OUT OF SCOPE FOR THIS PASS

- floor execution sequencing
- warehouse slotting and picking
- supplier collaboration portal
- transportation orchestration
- accounting valuation logic

