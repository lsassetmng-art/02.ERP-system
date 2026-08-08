# ============================================================
# MAPPING AND NORMALIZATION OVERVIEW
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Explains the role of the mapping and normalization folder.

summary:
This folder contains the common ERP design documents for:
- module-to-table mapping
- request-to-document mapping
- canonical table classification
- dump-to-canonical normalization
- contract-to-table linkage

main_design_role:
This folder is the bridge between architecture principles
and actual schema / dump normalization work.

# ============================================================
# DEEP RECONCILIATION SCOPE
# ============================================================

DEEP RECONCILIATION SCOPE

Meaning:
The mapping-and-normalization set no longer stops at:
- module-to-table mapping
- canonical table classification
- dump-to-canonical mapping
- contract-to-owning-table linkage

It now also includes deep reconciliation work for:
- real schema inventory
- mixed schema review
- duplicate/transitional classification
- actual column-comparison results
- runtime-family classification
- document/header pair comparison
- settlement-family deep review
- AR/AP projection-side review
- contract-to-real-table revised alignment
- runtime/header confirmation checklists

Important outcome:
This folder is now the main ERP reconciliation corpus
for connecting canonical ownership to real physical storage and behavior.

