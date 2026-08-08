# ============================================================
# ERP REAL TABLE MAPPING FINANCE SALES PURCHASE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first-pass real-table-to-canonical-module mapping
for finance, sales, and purchase-oriented schemas.

# ============================================================
# 1. FINANCE SCHEMA FIRST-PASS
# ============================================================

schema_name:
- finance

canonical_layer:
- 100.business

canonical_primary_module:
- 150.finance

likely_table_families:
- payment_transaction
- payment_schedule
- tax_rule
- tax_calculation
- currency
- exchange_rate
- bank_account_reference

first_pass_mapping_examples:

  payment_transaction*:
    canonical_module:
    - 150.finance
    canonical_table_class:
    - source_of_truth
    confidence:
    - high

  payment_schedule*:
    canonical_module:
    - 150.finance
    canonical_table_class:
    - support or source_of_truth depending table role
    confidence:
    - medium

  tax_rule*:
    canonical_module:
    - 150.finance
    canonical_table_class:
    - source_of_truth or support depending table role
    confidence:
    - medium

  tax_calculation*:
    canonical_module:
    - 150.finance
    canonical_table_class:
    - support or derived depending table role
    confidence:
    - medium

  currency*:
    canonical_module:
    - 150.finance or 060.data depending role
    canonical_table_class:
    - source_of_truth or registry
    confidence:
    - medium

  exchange_rate*:
    canonical_module:
    - 150.finance
    canonical_table_class:
    - source_of_truth
    confidence:
    - high

  bank_account_reference*:
    canonical_module:
    - 150.finance
    canonical_table_class:
    - source_of_truth or support depending role
    confidence:
    - medium

notes:
- finance is close to business/finance semantically
- currency tables may need review against shared platform/data concerns

# ============================================================
# 2. SALES SCHEMA FIRST-PASS
# ============================================================

schema_name:
- sales

canonical_layer:
- 100.business

canonical_primary_module:
- 110.sales

likely_table_families:
- sales_order
- shipment
- sales_invoice_source_link
- sales_transaction
- customer_order_relation

first_pass_mapping_examples:

  sales_order*:
    canonical_module:
    - 110.sales
    canonical_table_class:
    - source_of_truth
    confidence:
    - high

  shipment*:
    canonical_module:
    - 110.sales
    canonical_table_class:
    - source_of_truth
    confidence:
    - high

  sales_transaction*:
    canonical_module:
    - 110.sales
    canonical_table_class:
    - source_of_truth or support depending table role
    confidence:
    - medium

  sales_invoice_source_link*:
    canonical_module:
    - 110.sales
    canonical_table_class:
    - bridge
    confidence:
    - medium

notes:
- invoice accounting truth still belongs to accounting even if source links originate in sales
- sales schema should not absorb receivable ledger ownership

# ============================================================
# 3. PURCHASE SCHEMA FIRST-PASS
# ============================================================

schema_name:
- purchase

canonical_layer:
- 100.business

canonical_primary_module:
- 120.purchase

likely_table_families:
- purchase_request
- purchase_order
- goods_receipt
- supplier_invoice_source_link
- procurement_transaction

first_pass_mapping_examples:

  purchase_request*:
    canonical_module:
    - 120.purchase
    canonical_table_class:
    - source_of_truth
    confidence:
    - high

  purchase_order*:
    canonical_module:
    - 120.purchase
    canonical_table_class:
    - source_of_truth
    confidence:
    - high

  goods_receipt*:
    canonical_module:
    - 120.purchase
    canonical_table_class:
    - source_of_truth
    confidence:
    - high

  supplier_invoice_source_link*:
    canonical_module:
    - 120.purchase
    canonical_table_class:
    - bridge
    confidence:
    - medium

  procurement_transaction*:
    canonical_module:
    - 120.purchase
    canonical_table_class:
    - source_of_truth or support depending table role
    confidence:
    - medium

notes:
- supplier invoice accounting truth should still be reconciled against accounting/AP ownership
- purchase schema should not absorb payable ledger ownership

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
The next strongest first-pass mappings after accounting/approval/audit are:
- finance -> 100.business / 150.finance
- sales -> 100.business / 110.sales
- purchase -> 100.business / 120.purchase

These are strong candidates for table-level real mapping.
