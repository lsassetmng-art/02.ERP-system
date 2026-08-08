# ============================================================
# SALES TRANSACTION MODEL
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
document_id: ERP-SAL-112
owner: Boss
prepared_by: Zero
last_updated: 2026-03-10
scope: erp.business.sales.transaction
component: sales-transaction-model


# ABSTRACT

Defines sales transactions in ERP.


# STRUCTURE

Sales transaction flow:

quotation
↓
order
↓
shipment
↓
billing
↓
collection


# IMPLEMENTATION

Sales transactions generate downstream logistics,
billing, and accounting effects.


# CONSTRAINTS

Sales execution must remain linked to approved
customer and document context.
