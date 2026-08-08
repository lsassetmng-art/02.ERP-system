# ============================================================
# ERP CONTRACT TO OWNING TABLE MATRIX
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines a canonical matrix linking ERP contracts to their owning source-of-truth tables.

goals:
- connect contracts to true table ownership
- support interface-to-schema review
- prevent hidden cross-module mutation or ownership confusion

# ============================================================
# 1. MATRIX FORMAT
# ============================================================

required_columns:
- contract_id
- endpoint_name
- contract_category
- semantic_owner_layer
- semantic_owner_module
- primary_source_tables
- secondary_support_tables
- direct_mutation_tables
- indirect_effect_tables
- notes

# ============================================================
# 2. EXAMPLE ROWS
# ============================================================

example_rows:

- contract_id: DOC-SUBMIT
  endpoint_name: document_submit
  contract_category: action
  semantic_owner_layer: 100.business
  semantic_owner_module: business document owner
  primary_source_tables: document_header
  secondary_support_tables: approval_request,audit_event
  direct_mutation_tables: document_header
  indirect_effect_tables: approval_request,event_header

- contract_id: APPROVAL-APPROVE
  endpoint_name: approval_request_approve
  contract_category: action
  semantic_owner_layer: 200.management
  semantic_owner_module: 270.approval
  primary_source_tables: approval_request,approval_action
  secondary_support_tables: audit_event
  direct_mutation_tables: approval_request,approval_action
  indirect_effect_tables: document_header

- contract_id: ACCOUNTING-AR-DETAIL
  endpoint_name: accounts_receivable_detail_query
  contract_category: query
  semantic_owner_layer: 100.business
  semantic_owner_module: 140.accounting
  primary_source_tables: accounts_receivable_ledger
  secondary_support_tables: settlement_line,invoice_header
  direct_mutation_tables: none
  indirect_effect_tables: none

# ============================================================
# 3. RULES
# ============================================================

rules:
- every mutating contract must identify direct mutation tables
- every query contract must identify authoritative read tables
- support tables must not be mistaken for source-of-truth tables
- indirect effects must be declared separately

# ============================================================
# 4. REVIEW CONSEQUENCES
# ============================================================

review_consequences:
This matrix should be used to review:
- exact API contracts
- schema ownership
- mutation authority
- dump normalization results

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
ERP contracts must be explicitly tied to owning source-of-truth tables.

This document becomes the formal basis for:
- contract/schema review
- mutation scope review
- ownership alignment
