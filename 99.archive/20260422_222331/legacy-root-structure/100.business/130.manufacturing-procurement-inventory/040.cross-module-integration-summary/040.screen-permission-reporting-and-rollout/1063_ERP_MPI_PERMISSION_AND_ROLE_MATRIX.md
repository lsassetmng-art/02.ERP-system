# ============================================================
# ERP MPI PERMISSION AND ROLE MATRIX
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1063
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mpi.permission_and_role_matrix
component: mpi-permission-and-role-matrix


# RECOMMENDED ROLES

- mpi_family_admin
- material_planning_lead
- warehouse_execution_lead
- network_coordination_lead
- cross_module_exception_reviewer
- readonly_mpi_analyst


# RECOMMENDED CAPABILITY FAMILIES

- mpi_family_read
- mpi_handoff_chain_read
- mpi_feedback_chain_read
- mpi_exception_chain_review
- mpi_cross_module_override
- mpi_export
- mpi_audit_read


# RULE

Family-level read does not imply module-level write.
Exception review does not imply cross-module override.
Read does not imply export.

