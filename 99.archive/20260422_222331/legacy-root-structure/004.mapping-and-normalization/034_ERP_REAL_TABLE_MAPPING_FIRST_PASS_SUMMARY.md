# ============================================================
# ERP REAL TABLE MAPPING FIRST PASS SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the current first-pass real-table mapping status.

# ============================================================
# 1. STRONG FIRST-PASS ANCHORS
# ============================================================

strong_first_pass_anchors:
- accounting -> 100.business / 140.accounting
- approval -> 200.management / 270.approval
- audit -> 000.platform / 090.audit
- finance -> 100.business / 150.finance
- sales -> 100.business / 110.sales
- purchase -> 100.business / 120.purchase

reason:
These schemas have relatively clear semantic alignment
to canonical ERP module ownership.

# ============================================================
# 2. STILL NEED TABLE-LEVEL REVIEW
# ============================================================

still_need_table_level_review:
- currency-related tables in finance vs shared data concerns
- supplier/customer invoice linkage vs accounting truth
- support tables inside accounting, finance, sales, purchase
- route/delegation support tables inside approval

# ============================================================
# 3. HIGHER-RISK MIXED SCHEMAS STILL DEFERRED
# ============================================================

deferred_mixed_schemas:
- core
- system
- ops
- ai
- govern
- governance
- master
- billing

reason:
These are more likely to contain mixed canonical concerns
and should be reviewed after the strong anchors.

# ============================================================
# 4. NEXT NATURAL STEP
# ============================================================

next_natural_step:
Move from schema-level first-pass mapping
to actual table-name-driven mapping based on:
- erp_schema_table_column_summary.txt
- erp_schema_table_column_full.txt

recommended_next_target_order:
1. accounting
2. approval
3. audit
4. finance
5. sales
6. purchase

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
The first-pass mapping now has stable anchor schemas.
The next step is to turn these anchors
into actual table-level canonical mappings.
