# ============================================================
# ERP MPI ADOPTION AND MIGRATION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1066
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mpi.adoption_and_migration_rule
component: mpi-adoption-and-migration-rule


# RULE

Adoption should progress:
- module truth first
- linkage second
- reporting third
- cross-module override only after governance maturity

Migration must preserve:
- source module ownership
- historical audit trail
- prior status meaning
- explicit linkage creation timestamps

