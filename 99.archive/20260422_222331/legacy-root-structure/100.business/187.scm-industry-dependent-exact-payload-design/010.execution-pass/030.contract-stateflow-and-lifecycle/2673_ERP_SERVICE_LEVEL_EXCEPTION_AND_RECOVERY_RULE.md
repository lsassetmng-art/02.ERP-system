# ============================================================
# ERP SERVICE LEVEL EXCEPTION AND RECOVERY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2673
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.service_level_exception_and_recovery.rule
component: service-level-exception-and-recovery-rule


# RULE

Service-level exception and recovery progression must preserve:
- linked coordination or transfer references
- exception type and severity
- impacted service-level visibility
- mitigation and resolution-state visibility
- dismissed or resolved trace when applicable

