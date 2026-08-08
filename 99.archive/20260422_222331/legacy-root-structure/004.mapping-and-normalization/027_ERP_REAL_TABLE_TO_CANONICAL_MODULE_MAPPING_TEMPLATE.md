# ============================================================
# ERP REAL TABLE TO CANONICAL MODULE MAPPING TEMPLATE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the template for mapping real ERP tables
to canonical ERP modules.

# ============================================================
# 1. REQUIRED FIELDS
# ============================================================

required_fields:
- schema_name
- table_name
- canonical_layer
- canonical_module
- canonical_table_class
- ownership_confidence
- mixedness_flag
- migration_label
- rationale
- notes

canonical_table_class_examples:
- source_of_truth
- support
- bridge
- registry
- derived
- cache
- audit
- history
- projection
- staging
- transitional

ownership_confidence_values:
- high
- medium
- low
- unknown

mixedness_flag_values:
- pure
- mixed
- unclear

migration_label_examples:
- canonical
- transitional
- duplicate_candidate
- deprecated_candidate
- cache_only
- bridge_only
- unknown

# ============================================================
# 2. TEMPLATE ROW EXAMPLE
# ============================================================

template_row_example:
- schema_name: accounting
- table_name: accounts_receivable_ledger
- canonical_layer: 100.business
- canonical_module: 140.accounting
- canonical_table_class: source_of_truth
- ownership_confidence: high
- mixedness_flag: pure
- migration_label: canonical
- rationale: authoritative receivable balance truth
- notes: none

# ============================================================
# 3. CONCLUSION
# ============================================================

conclusion:
This template is the formal base
for real-table-to-canonical-module mapping work.
