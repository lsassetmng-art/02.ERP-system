# ============================================================
# ERP MANUFACTURING OBJECT FAMILY SET
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-1497
owner: Boss
prepared_by: Zero
last_updated: 2026-04-16
scope: erp.manufacturing.object_family_set
component: manufacturing-object-family-set


# PRIMARY OBJECT FAMILIES

- production_order
- production_operation
- manufacturing_material_issue_request
- production_completion_receipt
- manufacturing_scrap_declaration

# RULE

Production order is not production operation.
Production operation is not material issue request.
Material issue request is not completion receipt.
Completion receipt is not scrap declaration.

