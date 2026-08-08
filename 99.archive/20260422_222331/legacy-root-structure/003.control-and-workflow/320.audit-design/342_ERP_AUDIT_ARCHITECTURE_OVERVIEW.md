# ============================================================
# ERP AUDIT ARCHITECTURE OVERVIEW
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass overall architecture
for the ERP audit domain.

audit_architecture_layers:
- approval audit truth layer
- generic audit event layer
- execution-linked audit layer
- status and anomaly audit layer
- export and external delivery boundary
- cross-cutting audit infrastructure boundary

main_design_rule:
Audit is not a single-table log bucket.
It is a layered domain with different authority roles.

main_boundary_rule:
Audit domain truth must be separated from:
- operational business truth
- notification truth
- delivery/export queues
- cross-cutting capture infrastructure

conclusion:
Audit architecture should be expanded as a layered design domain
with explicit boundaries and subdomains.
