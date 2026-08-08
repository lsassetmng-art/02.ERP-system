#!/data/data/com.termux/files/usr/bin/bash
set -u

BASE="$HOME/02.ERP-system"
OUT="$BASE/000.integration"
VERIFY="$OUT/999.verify"
RUN_TS="$(date '+%Y-%m-%d %H:%M:%S %z')"

mkdir -p "$OUT" "$VERIFY"

PASS_COUNT=0
WARN_COUNT=0
FAIL_COUNT=0

REPORT="$VERIFY/000_ERP_INTEGRATED_SPLIT_REGEN_VERIFY_REPORT.md"

log_pass() {
  PASS_COUNT=$((PASS_COUNT + 1))
  printf 'PASS: %s\n' "$1" >> "$REPORT"
}

log_warn() {
  WARN_COUNT=$((WARN_COUNT + 1))
  printf 'WARN: %s\n' "$1" >> "$REPORT"
}

log_fail() {
  FAIL_COUNT=$((FAIL_COUNT + 1))
  printf 'FAIL: %s\n' "$1" >> "$REPORT"
}

write_header() {
  local file="$1"
  local title="$2"
  cat > "$file" <<EOF
# ============================================================
# $title
# ============================================================

status: regenerated
owner: Boss
prepared_by: Zero
generated_at: $RUN_TS
system: ERP
source_root: $BASE
policy:
- additive-only
- split integrated regeneration
- module docs remain canonical source
- integrated docs are compiled references
- no DB apply
- no destructive operation
- CommonOS remains shared UI / presentation foundation only
- ERP business canon remains in ERP modules

# ============================================================
# SOURCE CONTENT
# ============================================================

EOF
}

append_doc() {
  local out_file="$1"
  local rel="$2"
  local src="$BASE/$rel"

  {
    printf '\n'
    printf '%s\n' '# ------------------------------------------------------------'
    printf '## SOURCE: %s\n' "$rel"
    printf '%s\n' '# ------------------------------------------------------------'
    printf '\n'
  } >> "$out_file"

  if [ -f "$src" ]; then
    cat "$src" >> "$out_file"
    printf '\n' >> "$out_file"
    log_pass "appended $rel"
  else
    printf 'MISSING_SOURCE: %s\n' "$rel" >> "$out_file"
    log_warn "missing source $rel"
  fi
}

check_file() {
  if [ -f "$1" ]; then
    log_pass "generated $1"
  else
    log_fail "missing generated $1"
  fi
}

{
  printf '%s\n' '# ============================================================'
  printf '%s\n' '# ERP INTEGRATED SPLIT REGEN VERIFY REPORT'
  printf '%s\n' '# ============================================================'
  printf 'generated_at: %s\n' "$RUN_TS"
  printf 'base: %s\n' "$BASE"
  printf 'out: %s\n' "$OUT"
  printf '%s\n' ''
} > "$REPORT"

# ============================================================
# 1. CROSS MODULE INTEGRATED
# ============================================================

CROSS="$OUT/010_ERP_CROSS_MODULE_BOUNDARY_INTEGRATED.md"
write_header "$CROSS" "ERP CROSS MODULE BOUNDARY INTEGRATED"

for rel in \
  "00.foundation/920.meta/9200000314_ERP_CROSS_MODULE_BOUNDARY_INDEX.md" \
  "00.foundation/920.meta/9200000315_ERP_DEEPENING_CURRENT_STATE_LEDGER.md" \
  "00.foundation/920.meta/9200000316_ERP_NEXT_DEEPENING_ROADMAP.md" \
  "00.foundation/920.meta/9200000301_DEMAND_SOP_PRODUCTION_PLANNING_BI_BOUNDARY_INTEGRATION_MEMO.md" \
  "00.foundation/920.meta/9200000302_DEMAND_SOP_PRODUCTION_PLANNING_BI_HANDOFF_AND_STATUS_MATRIX.md" \
  "00.foundation/920.meta/9200000303_MANUFACTURING_TO_DEMAND_SOP_PLANNING_FEEDBACK_INTEGRATION_MEMO.md" \
  "00.foundation/920.meta/9200000304_BI_SOURCE_MODULE_SNAPSHOT_BOUNDARY_MEMO.md" \
  "00.foundation/920.meta/9200000305_MA_COSTING_PROJECT_ACCOUNTING_BOUNDARY_MEMO.md" \
  "00.foundation/920.meta/9200000306_ACCOUNTING_MA_BI_CLOSE_REPORTING_BOUNDARY_MEMO.md" \
  "00.foundation/920.meta/9200000307_INVENTORY_WAREHOUSE_LOGISTICS_BOUNDARY_MEMO.md" \
  "00.foundation/920.meta/9200000308_PURCHASE_PROCUREMENT_RECEIVING_BOUNDARY_MEMO.md" \
  "00.foundation/920.meta/9200000309_ORDER_TO_CASH_BOUNDARY_MEMO.md" \
  "00.foundation/920.meta/9200000310_HRM_HR_LABOR_PAYROLL_BOUNDARY_MEMO.md" \
  "00.foundation/920.meta/9200000311_APPROVAL_AUDIT_SOURCE_CONTROL_BOUNDARY_MEMO.md" \
  "00.foundation/920.meta/9200000312_APPROVAL_AUDIT_CONTROL_EVENT_TAXONOMY.md" \
  "00.foundation/920.meta/9200000313_MASTER_DATA_SOURCE_MODULE_BOUNDARY_MEMO.md"
do
  append_doc "$CROSS" "$rel"
done

# ============================================================
# 2. TRACK A INTEGRATED
# ============================================================

TRACK_A="$OUT/100_ERP_TRACK_A_PRODUCTION_SIDE_INTEGRATED.md"
write_header "$TRACK_A" "ERP TRACK A PRODUCTION SIDE INTEGRATED"

for rel in \
  "00.foundation/920.meta/9200000317_PRODUCTION_QUALITY_INVENTORY_COSTING_BOUNDARY_MEMO.md" \
  "17.quality/920.meta/9217000001_QUALITY_INSPECTION_NONCONFORMANCE_DISPOSITION_EXACT.md" \
  "15.manufacturing/920.meta/9215000001_MANUFACTURING_ACTUALS_FEEDBACK_BOUNDARY_EXACT.md" \
  "15.manufacturing/920.meta/9215000002_MANUFACTURING_WORK_ORDER_ACTUAL_SCRAP_REWORK_EXACT.md" \
  "16.production-planning/920.meta/9216000001_PRODUCTION_PLANNING_INTAKE_FROM_SOP_EXACT_PAYLOAD.md" \
  "16.production-planning/920.meta/9216000002_MPS_MRP_CRP_SCHEDULING_EXACT_DESIGN.md" \
  "18.costing/920.meta/9218000001_COSTING_TO_MANAGEMENT_ACCOUNTING_BOUNDARY_EXACT.md" \
  "18.costing/920.meta/9218000002_PRODUCTION_ACTUAL_COST_ROLLUP_VARIANCE_EXACT.md" \
  "00.foundation/920.meta/9200000318_PRODUCTION_DETAILED_HANDOFF_REINFORCEMENT_MEMO.md" \
  "15.manufacturing/920.meta/9215000003_PRODUCTION_TO_INVENTORY_DETAILED_HANDOFF_EXACT.md" \
  "18.costing/920.meta/9218000003_COSTING_TO_ACCOUNTING_PRODUCTION_POSTING_BASIS_EXACT.md" \
  "17.quality/920.meta/9217000002_QUALITY_TO_SUPPLIER_CLAIM_BOUNDARY_EXACT.md" \
  "10.purchase/920.meta/9210000002_SUPPLIER_CLAIM_PURCHASE_RETURN_INTAKE_EXACT.md" \
  "00.foundation/920.meta/9200000319_TRACK_A_PRODUCTION_SIDE_DEEPENING_INDEX.md" \
  "00.foundation/920.meta/9200000320_TRACK_A_PRODUCTION_SIDE_COVERAGE_LEDGER.md" \
  "00.foundation/920.meta/9200000321_TRACK_A_COMPLETION_AND_NEXT_TRACK_B_START_NOTE.md"
do
  append_doc "$TRACK_A" "$rel"
done

# ============================================================
# 3. TRACK B INTEGRATED
# ============================================================

TRACK_B="$OUT/200_ERP_TRACK_B_FINANCE_SIDE_INTEGRATED.md"
write_header "$TRACK_B" "ERP TRACK B FINANCE SIDE INTEGRATED"

for rel in \
  "00.foundation/920.meta/9200000322_FINANCE_ASSET_CASH_BOUNDARY_MEMO.md" \
  "30.accounting/920.meta/9230000001_ACCOUNTING_CLOSE_TO_MA_AND_BI_BOUNDARY_EXACT.md" \
  "30.accounting/920.meta/9230000002_ACCOUNTING_AP_AR_SUBLEDGER_POSTING_EXACT_DESIGN.md" \
  "34.cash-management/920.meta/9234000001_CASH_PAYMENT_BANK_RECONCILIATION_EXACT_DESIGN.md" \
  "33.fixed-assets/920.meta/9233000001_FIXED_ASSETS_CAPITALIZATION_DEPRECIATION_DISPOSAL_EXACT_DESIGN.md" \
  "19.asset-management/920.meta/9219000001_ASSET_MANAGEMENT_REGISTER_MAINTENANCE_UTILIZATION_EXACT_DESIGN.md" \
  "00.foundation/920.meta/9200000323_FINANCE_DETAILED_HANDOFF_REINFORCEMENT_MEMO.md" \
  "05.billing/920.meta/9205000002_BILLING_TO_ACCOUNTING_CASH_HANDOFF_EXACT.md" \
  "10.purchase/920.meta/9210000003_PURCHASE_AP_CASH_HANDOFF_EXACT.md" \
  "42.payroll/920.meta/9242000002_PAYROLL_ACCOUNTING_CASH_REINFORCEMENT_EXACT.md" \
  "18.costing/920.meta/9218000004_COSTING_ACCOUNTING_CASH_BOUNDARY_REINFORCEMENT_EXACT.md" \
  "33.fixed-assets/920.meta/9233000002_FIXED_ASSETS_ACCOUNTING_CASH_HANDOFF_EXACT.md" \
  "00.foundation/920.meta/9200000324_TRACK_B_FINANCE_SIDE_DEEPENING_INDEX.md" \
  "00.foundation/920.meta/9200000325_TRACK_B_FINANCE_SIDE_COVERAGE_LEDGER.md" \
  "00.foundation/920.meta/9200000326_TRACK_B_COMPLETION_AND_NEXT_TRACK_C_START_NOTE.md"
do
  append_doc "$TRACK_B" "$rel"
done

# ============================================================
# 4. TRACK C INTEGRATED
# ============================================================

TRACK_C="$OUT/300_ERP_TRACK_C_COMMERCIAL_SIDE_INTEGRATED.md"
write_header "$TRACK_C" "ERP TRACK C COMMERCIAL SIDE INTEGRATED"

for rel in \
  "00.foundation/920.meta/9200000327_COMMERCIAL_CRM_SFA_SALES_BOUNDARY_MEMO.md" \
  "03.crm/920.meta/9203000001_CRM_CUSTOMER_ACCOUNT_CONTACT_INTERACTION_EXACT_DESIGN.md" \
  "02.sfa/920.meta/9202000001_SFA_LEAD_OPPORTUNITY_ACTIVITY_PIPELINE_EXACT_DESIGN.md" \
  "01.sales/920.meta/9201000001_SALES_TO_ORDER_MANAGEMENT_BOUNDARY_EXACT.md" \
  "01.sales/920.meta/9201000002_SALES_PRICE_DISCOUNT_PROMOTION_QUOTE_EXACT_DESIGN.md" \
  "00.foundation/920.meta/9200000328_COMMERCIAL_DETAILED_HANDOFF_REINFORCEMENT_MEMO.md" \
  "03.crm/920.meta/9203000002_CRM_TO_SFA_FORECAST_BILLING_FEEDBACK_HANDOFF_EXACT.md" \
  "02.sfa/920.meta/9202000002_SFA_TO_SALES_DEMAND_ORDER_FEEDBACK_HANDOFF_EXACT.md" \
  "01.sales/920.meta/9201000003_SALES_TO_DEMAND_ORDER_BILLING_FEEDBACK_HANDOFF_EXACT.md" \
  "06.demand-forecasting/920.meta/9206000002_COMMERCIAL_SIGNAL_INTAKE_EXACT_DESIGN.md" \
  "04.order-management/920.meta/9204000002_COMMERCIAL_ORDER_INTAKE_AND_FEEDBACK_EXACT.md" \
  "05.billing/920.meta/9205000003_BILLING_COMMERCIAL_FEEDBACK_EXACT.md" \
  "00.foundation/920.meta/9200000329_TRACK_C_COMMERCIAL_SIDE_DEEPENING_INDEX.md" \
  "00.foundation/920.meta/9200000330_TRACK_C_COMMERCIAL_SIDE_COVERAGE_LEDGER.md" \
  "00.foundation/920.meta/9200000331_TRACK_C_COMPLETION_AND_NEXT_TRACK_D_START_NOTE.md"
do
  append_doc "$TRACK_C" "$rel"
done

# ============================================================
# 5. TRACK D INTEGRATED
# ============================================================

TRACK_D="$OUT/400_ERP_TRACK_D_MASTER_DATA_CATALOG_INTEGRATED.md"
write_header "$TRACK_D" "ERP TRACK D MASTER DATA CATALOG INTEGRATED"

for rel in \
  "00.foundation/920.meta/9200000332_MASTER_DATA_CATALOG_BOUNDARY_MEMO.md" \
  "52.master-data/920.meta/9252000001_MASTER_DATA_OWNERSHIP_REFERENCE_CORRECTION_EXACT.md" \
  "52.master-data/920.meta/9252000002_MASTER_DATA_SOURCE_MODULE_REFERENCE_MATRIX_EXACT.md" \
  "52.master-data/920.meta/9252000003_MASTER_DATA_EVENT_TAXONOMY_AND_GOVERNANCE_EXACT.md" \
  "52.master-data/920.meta/9252000004_BUSINESS_PARTNER_CUSTOMER_SUPPLIER_CONTACT_MASTER_CATALOG_EXACT.md" \
  "52.master-data/920.meta/9252000005_ITEM_PRODUCT_UOM_MASTER_CATALOG_EXACT.md" \
  "52.master-data/920.meta/9252000006_LOCATION_SITE_ADDRESS_WAREHOUSE_REFERENCE_CATALOG_EXACT.md" \
  "52.master-data/920.meta/9252000007_COMPANY_LEGAL_ENTITY_ORGANIZATION_REFERENCE_CATALOG_EXACT.md" \
  "52.master-data/920.meta/9252000008_MASTER_CATALOG_PUBLICATION_AND_SOURCE_EXTENSION_MATRIX_EXACT.md" \
  "00.foundation/920.meta/9200000333_TRACK_D_MASTER_DATA_CATALOG_DEEPENING_INDEX.md" \
  "00.foundation/920.meta/9200000334_TRACK_D_MASTER_DATA_CATALOG_COVERAGE_LEDGER.md" \
  "00.foundation/920.meta/9200000335_TRACK_D_COMPLETION_AND_NEXT_TRACK_E_START_NOTE.md"
do
  append_doc "$TRACK_D" "$rel"
done

# ============================================================
# 6. TRACK E / GAP INTEGRATED
# ============================================================

TRACK_E="$OUT/900_ERP_TRACK_E_CURRENT_STATE_AND_GAP_INTEGRATED.md"
write_header "$TRACK_E" "ERP TRACK E CURRENT STATE AND GAP INTEGRATED"

for rel in \
  "00.foundation/920.meta/9200000336_ERP_ALL_TRACK_DEEPENING_INDEX_REFRESH.md" \
  "00.foundation/920.meta/9200000337_ERP_MODULE_COVERAGE_MATRIX_REFRESH.md" \
  "00.foundation/920.meta/9200000338_ERP_INTEGRATED_REGENERATION_PLAN.md" \
  "00.foundation/920.meta/9200000339_ERP_TRACK_E_REMAINING_GAP_LEDGER.md" \
  "00.foundation/920.meta/9200000340_ERP_TRACK_E_READONLY_VERIFY_REPORT.md"
do
  append_doc "$TRACK_E" "$rel"
done

# ============================================================
# 7. IMPLEMENTATION PREP CANDIDATE LEDGER
# ============================================================

IMPL="$OUT/910_ERP_IMPLEMENTATION_PREP_CANDIDATE_LEDGER.md"
cat > "$IMPL" <<EOF
# ============================================================
# ERP IMPLEMENTATION PREP CANDIDATE LEDGER
# ============================================================

status: active
owner: Boss
prepared_by: Zero
generated_at: $RUN_TS
system: ERP
purpose:
Identify candidate module clusters for future implementation-prep after
Tracks A/B/C/D and Track E verification/regeneration.

# ============================================================
# 1. IMPLEMENTATION PREP POLICY
# ============================================================

policy:
- no DB apply in this regeneration step
- no API implementation in this regeneration step
- no UI implementation in this regeneration step
- implementation artifacts must later go under ~/04.ERP-development/<module>/...
- design docs remain under ~/02.ERP-system/<module>/...
- CommonOS can be used for shared UI / ERP dense variant
- ERP business canon remains in ERP modules
- queue presentation can be CommonOS
- queue meaning remains module-side

# ============================================================
# 2. CANDIDATE CLUSTERS
# ============================================================

## Candidate A: Production-side core
modules:
- 16.production-planning
- 15.manufacturing
- 17.quality
- 12.inventory
- 18.costing

why:
- Track A exact design is strong.
- Production / quality / inventory / costing handoffs are fixed.
- Good candidate for API payload freeze and DB schema prep.

needs_before_implementation:
- BOM / routing ownership detail
- WIP inventory/costing detail if v1 includes WIP
- lot/serial genealogy scope decision
- selected v1 flow definition

## Candidate B: Finance-side core
modules:
- 30.accounting
- 34.cash-management
- 33.fixed-assets
- 19.asset-management

why:
- Track B exact design is strong.
- GL / AP / AR / cash / bank / fixed asset boundaries are fixed.

needs_before_implementation:
- chart of accounts catalog
- bank account/payment route catalog
- tax catalog
- accounting period/close checklist
- payment approval variant decision

## Candidate C: Commercial-side core
modules:
- 03.crm
- 02.sfa
- 01.sales
- 04.order-management
- 05.billing
- 06.demand-forecasting

why:
- Track C exact design is strong.
- CRM/SFA/Sales/Order/Billing/Demand signal boundaries are fixed.

needs_before_implementation:
- customer master payloads
- price list/promotion catalog
- order change/return scope
- billing dispute/refund scope
- commercial KPI scope

## Candidate D: Master-data foundation
modules:
- 52.master-data
- source module extension consumers

why:
- Track D master catalog design is strong.
- Master publication and source extension matrix are fixed.
- Good foundation candidate before transaction modules.

needs_before_implementation:
- API exact payloads for publication/acknowledgement
- RLS/authorization
- customer/item/location/company minimum v1 catalog decision
- data quality rule catalog

# ============================================================
# 3. RECOMMENDED FIRST IMPLEMENTATION-PREP
# ============================================================

recommended_first:
- Candidate D: Master-data foundation

reason:
- Transaction modules across Tracks A/B/C/B reference master catalogs.
- Stable master identity reduces later rework.
- Implementation-prep can start with read-only catalog, create/update workflow,
  publication, acknowledgement, and source extension reference patterns.

alternate_first:
- Candidate C if user-facing commercial flow is preferred.
- Candidate A if production/SCM core is preferred.
- Candidate B if finance core is preferred.

# ============================================================
# 4. COMPLETION STATE
# ============================================================

completion_state:
- implementation-prep candidate ledger generated
- no implementation performed
- no DB apply performed

# ============================================================
EOF
log_pass "generated implementation prep candidate ledger"

# ============================================================
# 8. ROOT INDEX
# ============================================================

ROOT="$OUT/000_ERP_INTEGRATED_CANONICAL_INDEX.md"
cat > "$ROOT" <<EOF
# ============================================================
# ERP INTEGRATED CANONICAL INDEX
# split regenerated
# ============================================================

status: regenerated
owner: Boss
prepared_by: Zero
generated_at: $RUN_TS
system: ERP
source_root: $BASE
output_root: $OUT

# ============================================================
# 1. GENERATED FILES
# ============================================================

generated_files:
- 010_ERP_CROSS_MODULE_BOUNDARY_INTEGRATED.md
- 100_ERP_TRACK_A_PRODUCTION_SIDE_INTEGRATED.md
- 200_ERP_TRACK_B_FINANCE_SIDE_INTEGRATED.md
- 300_ERP_TRACK_C_COMMERCIAL_SIDE_INTEGRATED.md
- 400_ERP_TRACK_D_MASTER_DATA_CATALOG_INTEGRATED.md
- 900_ERP_TRACK_E_CURRENT_STATE_AND_GAP_INTEGRATED.md
- 910_ERP_IMPLEMENTATION_PREP_CANDIDATE_LEDGER.md

# ============================================================
# 2. TRACK STATUS
# ============================================================

track_status:
- Track A production-side: complete at boundary/exact-design layer
- Track B finance-side: complete at boundary/exact-design layer
- Track C commercial-side: complete at boundary/exact-design layer
- Track D master-data catalog: complete at boundary/exact-design layer
- Track E integrated regeneration: split regenerated in this run

# ============================================================
# 3. CANONICAL RULES
# ============================================================

canonical_rules:
- Existing ERP design is not rebuilt from scratch.
- Current work is additive deepening.
- Module docs remain canonical source.
- Integrated docs are compiled references.
- ERP business canon remains in ERP modules.
- CommonOS is shared UI / presentation foundation only.
- BI is analytical projection only.
- Approval owns approval workflow truth only.
- Audit owns audit finding / remediation lifecycle truth only.
- Master Data owns shared identity/reference truth only.
- Source modules own transaction / execution / calculation / posting source truth.

# ============================================================
# 4. NEXT NATURAL ACTION
# ============================================================

next_natural_action:
- Run/review integrated split verification report.
- Then either:
  - regenerate an upload-friendly compact pack, or
  - create Track F detailed remaining catalogs, or
  - start implementation-prep freeze for selected candidate cluster.

# ============================================================
EOF
log_pass "generated root integrated canonical index"

# ============================================================
# 9. VERIFY GENERATED FILES
# ============================================================

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## Generated file check' >> "$REPORT"

for f in \
  "$ROOT" \
  "$CROSS" \
  "$TRACK_A" \
  "$TRACK_B" \
  "$TRACK_C" \
  "$TRACK_D" \
  "$TRACK_E" \
  "$IMPL"
do
  check_file "$f"
done

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## File size check' >> "$REPORT"

for f in \
  "$ROOT" \
  "$CROSS" \
  "$TRACK_A" \
  "$TRACK_B" \
  "$TRACK_C" \
  "$TRACK_D" \
  "$TRACK_E" \
  "$IMPL"
do
  if [ -f "$f" ]; then
    bytes="$(wc -c < "$f" | tr -d ' ')"
    printf 'SIZE: %s bytes %s\n' "$bytes" "$f" >> "$REPORT"
  fi
done

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## Summary' >> "$REPORT"
printf 'PASS_COUNT=%s\n' "$PASS_COUNT" >> "$REPORT"
printf 'WARN_COUNT=%s\n' "$WARN_COUNT" >> "$REPORT"
printf 'FAIL_COUNT=%s\n' "$FAIL_COUNT" >> "$REPORT"

if [ "$FAIL_COUNT" -eq 0 ]; then
  printf '%s\n' 'FINAL_RESULT=PASS' >> "$REPORT"
else
  printf '%s\n' 'FINAL_RESULT=REVIEW_REQUIRED' >> "$REPORT"
fi

printf '%s\n' '============================================================'
printf '%s\n' 'ERP INTEGRATED SPLIT REGEN DONE'
printf '%s\n' '============================================================'
printf 'OUT=%s\n' "$OUT"
printf 'ROOT=%s\n' "$ROOT"
printf 'REPORT=%s\n' "$REPORT"
printf 'PASS_COUNT=%s\n' "$PASS_COUNT"
printf 'WARN_COUNT=%s\n' "$WARN_COUNT"
printf 'FAIL_COUNT=%s\n' "$FAIL_COUNT"
if [ "$FAIL_COUNT" -eq 0 ]; then
  printf '%s\n' 'FINAL_RESULT=PASS'
else
  printf '%s\n' 'FINAL_RESULT=REVIEW_REQUIRED'
fi
printf '%s\n' '============================================================'
