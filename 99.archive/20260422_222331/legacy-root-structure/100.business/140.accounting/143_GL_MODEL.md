# ============================================================
# GL MODEL
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
document_id: ERP-ACC-143
owner: Boss
prepared_by: Zero
last_updated: 2026-03-10
scope: erp.business.accounting.gl
component: gl-model


# ABSTRACT

Defines the general ledger model of ERP.


# STRUCTURE

GL structure includes:

account
journal entry
posting line
period
balance


# IMPLEMENTATION

The general ledger accumulates posted journal
entries and provides authoritative accounting
balance state.


# CONSTRAINTS

GL balances must be traceable to journal lines.

Direct uncontrolled balance mutation is
prohibited.
