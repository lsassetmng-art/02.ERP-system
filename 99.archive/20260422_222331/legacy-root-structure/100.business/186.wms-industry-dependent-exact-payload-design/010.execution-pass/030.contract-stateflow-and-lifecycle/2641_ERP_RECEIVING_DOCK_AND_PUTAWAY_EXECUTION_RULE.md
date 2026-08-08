# ============================================================
# ERP RECEIVING DOCK AND PUTAWAY EXECUTION RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2641
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.receiving_dock_and_putaway_execution.rule
component: receiving-dock-and-putaway-execution-rule


# RULE

Receiving dock and putaway execution progression must preserve:
- linked warehouse task reference
- linked purchase receipt visibility
- dock reference
- expected versus received quantity visibility
- bin allocation visibility
- discrepancy trace when applicable

