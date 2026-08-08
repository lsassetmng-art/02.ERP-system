# ============================================================
# ERP SALES WHOLE DESIGN EXECUTION CANONICAL SCOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1343
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_whole_design_execution.canonical_scope
component: sales-whole-design-execution-canonical-scope


# IN SCOPE

- sales quote
- sales order and sales order line
- sales fulfillment instruction
- sales billing instruction
- sales return request
- sales cancellation / reversal semantics
- sales to inventory handoff
- sales to accounting handoff
- sales completion judgment

# OUT OF SCOPE FOR THIS PASS

- CRM lead activity design
- SFA opportunity execution design
- WMS warehouse execution design
- accounting journal detail design

