# ============================================================
# ERP ANALYTICS ARCHITECTURE OVERVIEW
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass overall architecture
for the ERP analytics domain.

analytics_architecture_layers:
- analytics native core layer
- public analytical view layer
- boundary read-surface layer
- operational analytical view layer
- metric-adjacent domain analytics layer

main_design_rule:
Analytics is not a miscellaneous bucket of views.
It is a layered derived-information architecture.

main_boundary_rule:
Analytics truth must be separated from:
- business transaction truth
- audit truth
- management control truth
- runtime execution truth
- delivery/support truth

conclusion:
Analytics architecture should be expanded
as a layered design domain with explicit derived-information boundaries.
