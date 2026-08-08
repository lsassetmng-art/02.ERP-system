# ============================================================
# AP MODEL
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
document_id: ERP-ACC-145
owner: Boss
prepared_by: Zero
last_updated: 2026-03-10
scope: erp.business.accounting.ap
component: ap-model


# ABSTRACT

Defines accounts payable in ERP.


# STRUCTURE

AP structure includes:

supplier payable
invoice obligation
payment due date
payment execution state
settlement state


# IMPLEMENTATION

AP records are generated from approved purchase
and expense transactions.


# CONSTRAINTS

Payables must remain linked to approved source
documents and payment actions.
