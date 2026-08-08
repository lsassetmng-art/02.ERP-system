# ============================================================
# ERP CURRENCY MODEL
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
document_id: ERP-FIN-156
owner: Boss
prepared_by: Zero
last_updated: 2026-03-10
scope: erp.business.finance.currency
component: currency-model


# ABSTRACT

Defines currency structures used in ERP.


# STRUCTURE

Currency structure includes:

currency_code
precision
base currency relation
active status


# IMPLEMENTATION

Currencies are referenced by accounting,
payments, pricing, and reporting.


# CONSTRAINTS

Currency identity must remain stable.
