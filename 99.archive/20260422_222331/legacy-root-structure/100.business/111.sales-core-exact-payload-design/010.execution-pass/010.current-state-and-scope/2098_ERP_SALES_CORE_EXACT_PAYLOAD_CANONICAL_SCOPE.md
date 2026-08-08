# ============================================================
# ERP SALES CORE EXACT PAYLOAD CANONICAL SCOPE
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-2098
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.sales_core_exact_payload.canonical_scope
component: sales-core-exact-payload-canonical-scope


# IN SCOPE

- sales_quote
- sales_order
- sales_fulfillment_instruction
- sales_invoice_request
- sales_correction_case
- management approval visibility
- inventory / accounting handoff visibility

# OUT OF SCOPE FOR THIS PASS

- CRM paid option redesign
- inventory stock internals
- accounting posting internals
- UI implementation source code

