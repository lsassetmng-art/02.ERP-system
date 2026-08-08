#!/data/data/com.termux/files/usr/bin/bash

set -u

BASE="$HOME/02.ERP-system"
OUT_DIR="$BASE/00.foundation/920.meta"
REPORT="$OUT_DIR/9200000340_ERP_TRACK_E_READONLY_VERIFY_REPORT.md"

mkdir -p "$OUT_DIR"

PASS_COUNT=0
FAIL_COUNT=0
WARN_COUNT=0

pass() {
  PASS_COUNT=$((PASS_COUNT + 1))
  printf 'PASS: %s\n' "$1" >> "$REPORT"
}

fail() {
  FAIL_COUNT=$((FAIL_COUNT + 1))
  printf 'FAIL: %s\n' "$1" >> "$REPORT"
}

warn() {
  WARN_COUNT=$((WARN_COUNT + 1))
  printf 'WARN: %s\n' "$1" >> "$REPORT"
}

check_file() {
  if [ -f "$1" ]; then
    pass "$1"
  else
    fail "$1"
  fi
}

check_dir() {
  if [ -d "$1" ]; then
    pass "$1"
  else
    fail "$1"
  fi
}

check_grep() {
  local pattern="$1"
  local path="$2"
  local label="$3"
  if grep -R -I -q "$pattern" "$path" 2>/dev/null; then
    pass "$label"
  else
    warn "$label"
  fi
}

{
  printf '%s\n' '# ============================================================'
  printf '%s\n' '# ERP TRACK E READONLY VERIFY REPORT'
  printf '%s\n' '# ============================================================'
  printf 'generated_at: %s\n' "$(date '+%Y-%m-%d %H:%M:%S %z')"
  printf 'base: %s\n' "$BASE"
  printf '%s\n' ''
  printf '%s\n' '## 1. Module directory check'
} > "$REPORT"

for d in \
  "00.foundation" \
  "01.sales" \
  "02.sfa" \
  "03.crm" \
  "04.order-management" \
  "05.billing" \
  "06.demand-forecasting" \
  "07.sop-consensus" \
  "10.purchase" \
  "11.procurement" \
  "12.inventory" \
  "13.warehouse" \
  "14.logistics" \
  "15.manufacturing" \
  "16.production-planning" \
  "17.quality" \
  "18.costing" \
  "19.asset-management" \
  "30.accounting" \
  "31.management-accounting" \
  "32.project-accounting" \
  "33.fixed-assets" \
  "34.cash-management" \
  "40.human-resources" \
  "41.labor-management" \
  "42.payroll" \
  "50.approval" \
  "51.audit" \
  "52.master-data" \
  "60.business-intelligence" \
  "90.transition-triage" \
  "99.archive"
do
  check_dir "$BASE/$d"
done

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## 2. Track completion document check' >> "$REPORT"

for f in \
  "$BASE/00.foundation/920.meta/9200000321_TRACK_A_COMPLETION_AND_NEXT_TRACK_B_START_NOTE.md" \
  "$BASE/00.foundation/920.meta/9200000326_TRACK_B_COMPLETION_AND_NEXT_TRACK_C_START_NOTE.md" \
  "$BASE/00.foundation/920.meta/9200000331_TRACK_C_COMPLETION_AND_NEXT_TRACK_D_START_NOTE.md" \
  "$BASE/00.foundation/920.meta/9200000335_TRACK_D_COMPLETION_AND_NEXT_TRACK_E_START_NOTE.md" \
  "$BASE/00.foundation/920.meta/9200000336_ERP_ALL_TRACK_DEEPENING_INDEX_REFRESH.md" \
  "$BASE/00.foundation/920.meta/9200000337_ERP_MODULE_COVERAGE_MATRIX_REFRESH.md" \
  "$BASE/00.foundation/920.meta/9200000338_ERP_INTEGRATED_REGENERATION_PLAN.md" \
  "$BASE/00.foundation/920.meta/9200000339_ERP_TRACK_E_REMAINING_GAP_LEDGER.md"
do
  check_file "$f"
done

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## 3. Representative deepening document check' >> "$REPORT"

for f in \
  "$BASE/17.quality/920.meta/9217000001_QUALITY_INSPECTION_NONCONFORMANCE_DISPOSITION_EXACT.md" \
  "$BASE/15.manufacturing/920.meta/9215000002_MANUFACTURING_WORK_ORDER_ACTUAL_SCRAP_REWORK_EXACT.md" \
  "$BASE/16.production-planning/920.meta/9216000002_MPS_MRP_CRP_SCHEDULING_EXACT_DESIGN.md" \
  "$BASE/18.costing/920.meta/9218000002_PRODUCTION_ACTUAL_COST_ROLLUP_VARIANCE_EXACT.md" \
  "$BASE/30.accounting/920.meta/9230000002_ACCOUNTING_AP_AR_SUBLEDGER_POSTING_EXACT_DESIGN.md" \
  "$BASE/34.cash-management/920.meta/9234000001_CASH_PAYMENT_BANK_RECONCILIATION_EXACT_DESIGN.md" \
  "$BASE/33.fixed-assets/920.meta/9233000001_FIXED_ASSETS_CAPITALIZATION_DEPRECIATION_DISPOSAL_EXACT_DESIGN.md" \
  "$BASE/19.asset-management/920.meta/9219000001_ASSET_MANAGEMENT_REGISTER_MAINTENANCE_UTILIZATION_EXACT_DESIGN.md" \
  "$BASE/03.crm/920.meta/9203000001_CRM_CUSTOMER_ACCOUNT_CONTACT_INTERACTION_EXACT_DESIGN.md" \
  "$BASE/02.sfa/920.meta/9202000001_SFA_LEAD_OPPORTUNITY_ACTIVITY_PIPELINE_EXACT_DESIGN.md" \
  "$BASE/01.sales/920.meta/9201000002_SALES_PRICE_DISCOUNT_PROMOTION_QUOTE_EXACT_DESIGN.md" \
  "$BASE/52.master-data/920.meta/9252000004_BUSINESS_PARTNER_CUSTOMER_SUPPLIER_CONTACT_MASTER_CATALOG_EXACT.md" \
  "$BASE/52.master-data/920.meta/9252000005_ITEM_PRODUCT_UOM_MASTER_CATALOG_EXACT.md" \
  "$BASE/52.master-data/920.meta/9252000006_LOCATION_SITE_ADDRESS_WAREHOUSE_REFERENCE_CATALOG_EXACT.md" \
  "$BASE/52.master-data/920.meta/9252000007_COMPANY_LEGAL_ENTITY_ORGANIZATION_REFERENCE_CATALOG_EXACT.md"
do
  check_file "$f"
done

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## 4. Boundary term grep check' >> "$REPORT"

check_grep "CommonOS remains shared UI" "$BASE/00.foundation/920.meta" "CommonOS boundary term"
check_grep "analytical projection" "$BASE" "BI analytical projection term"
check_grep "posting basis is not GL journal" "$BASE" "posting basis vs GL journal term"
check_grep "payment basis is not bank execution" "$BASE" "payment basis vs bank execution term"
check_grep "forecast input only" "$BASE" "forecast signal input-only term"
check_grep "source modules own domain extensions" "$BASE" "master-data source extension term"
check_grep "quality disposition" "$BASE" "quality disposition term"
check_grep "MPS" "$BASE" "MPS term"
check_grep "MRP" "$BASE" "MRP term"
check_grep "bank reconciliation" "$BASE" "bank reconciliation term"
check_grep "opportunity" "$BASE" "SFA opportunity term"
check_grep "business partner" "$BASE" "business partner master term"

printf '%s\n' '' >> "$REPORT"
printf '%s\n' '## 5. Summary' >> "$REPORT"
printf 'PASS_COUNT=%s\n' "$PASS_COUNT" >> "$REPORT"
printf 'WARN_COUNT=%s\n' "$WARN_COUNT" >> "$REPORT"
printf 'FAIL_COUNT=%s\n' "$FAIL_COUNT" >> "$REPORT"

if [ "$FAIL_COUNT" -eq 0 ]; then
  printf '%s\n' 'FINAL_RESULT=PASS' >> "$REPORT"
else
  printf '%s\n' 'FINAL_RESULT=REVIEW_REQUIRED' >> "$REPORT"
fi

printf '%s\n' '============================================================'
printf '%s\n' 'ERP TRACK E READONLY VERIFY DONE'
printf '%s\n' '============================================================'
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
