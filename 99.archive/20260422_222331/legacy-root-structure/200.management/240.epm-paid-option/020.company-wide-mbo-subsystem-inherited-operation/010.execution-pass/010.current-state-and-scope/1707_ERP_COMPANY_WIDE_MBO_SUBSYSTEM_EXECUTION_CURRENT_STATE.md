# ============================================================
# ERP COMPANY WIDE MBO SUBSYSTEM EXECUTION CURRENT STATE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1707
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.company_wide_mbo_subsystem.execution.current_state
component: company-wide-mbo-subsystem-execution-current-state


# ABSTRACT

Defines the current state for the first execution pass
of the company_wide_mbo subsystem inherited-operation line.

The architecture corpus already clarified that:
- EPM is the parent paid option
- company_wide_mbo is a subsystem under EPM
- company_wide_mbo is not a separate paid option
- personal_mbo remains outside ERP as an independent app-side line

This pass begins actual subsystem closure work.


# CURRENT POSITION

company_wide_mbo subsystem work is still incomplete.

This pass begins to fix:
- subsystem truth ownership
- subsystem object exactness
- subsystem handoff with EPM, management, LaborManager, and personal_mbo boundary
- subsystem contract and stateflow semantics
- subsystem permission, screen, and reporting semantics

