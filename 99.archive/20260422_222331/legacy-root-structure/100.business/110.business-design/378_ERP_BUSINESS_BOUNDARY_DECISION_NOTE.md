# ============================================================
# ERP BUSINESS BOUNDARY DECISION NOTE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the first-pass business boundary decisions.

boundary_decisions:
- business truth must stay distinct from audit truth
- business truth must stay distinct from runtime control truth
- business handoff links must stay distinct from primary truth ownership
- reconciliation objects must stay distinct from upstream document anchors
- state layers must stay distinct from document-chain layers

main_result:
Business architecture now has explicit domain boundaries,
not only object lists.

conclusion:
Boundary clarity is now strong enough
to support deeper business design work without mixing roles.
