# ============================================================
# ERP ACCOUNTING BOUNDARY RULE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2087
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.accounting.boundary_rule
component: accounting-boundary-rule


# RULE

Journal truth is not sales order truth.
Payable position truth is not purchase order truth.
Close-cycle truth is not management reporting visibility truth.

