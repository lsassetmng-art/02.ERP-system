# ============================================================
# AR MODEL
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
document_id: ERP-ACC-144
owner: Boss
prepared_by: Zero
last_updated: 2026-03-10
scope: erp.business.accounting.ar
component: ar-model


# ABSTRACT

Defines accounts receivable in ERP.


# STRUCTURE

AR structure includes:

customer receivable
billing document
due date
collection status
settlement state


# IMPLEMENTATION

AR records are generated from approved billing
and sales-related transactions.


# CONSTRAINTS

Receivables must remain linked to source billing
and settlement events.
