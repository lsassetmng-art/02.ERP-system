# ============================================================
# ERP HEADER PAIR ACTUAL RESULTS INTERPRETATION
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Interprets what the actual pairwise header column findings mean
for canonical ERP alignment.

# ============================================================
# 1. MAIN INTERPRETATION
# ============================================================

main_interpretation:
The public-vs-domain header pairs are no longer just suspicious.
Actual column evidence shows strong structural overlap,
often identical and sometimes with small domain-side extensions.

# ============================================================
# 2. MOST LIKELY MODELS
# ============================================================

most_likely_models:

model_a:
- public is authoritative shared truth
- domain schema copy is mirror or transitional extension

model_b:
- domain schema is operational truth
- public copy is shared read-model or duplicated exposure layer

model_c:
- partial migration split exists
- both sides remain live until consolidation

# ============================================================
# 3. WHAT THE EXTRA COLUMNS SUGGEST
# ============================================================

what_extra_columns_suggest:
- sales.billing_header.original_billing_id suggests domain-side extension or lineage support
- sales.return_header.shipping_id suggests return-flow operational extension

meaning:
The domain-side versions may be
the more operationally specific variants of the same logical header.

# ============================================================
# 4. WHAT IS NOW STRONGLY SUPPORTED
# ============================================================

what_is_now_strongly_supported:
- these are not unrelated tables that merely share names
- they are structurally near-duplicate pairs
- a duplicate / mirror / transitional interpretation is now much stronger than before

# ============================================================
# 5. CURRENT CANONICAL CONSEQUENCE
# ============================================================

current_canonical_consequence:
Canonical semantic ownership stays stable:
- order -> 110.sales
- purchase_order -> 120.purchase
- billing -> business billing/accounting-adjacent truth
- return -> sales/fulfillment-side truth
- shipping -> shipping/fulfillment-side truth

What remains unresolved is:
- physical authoritative placement
- mirror/read-model role
- transitional duplication intent

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
Actual pairwise evidence strongly upgrades the header-family review
from suspicion to concrete duplicate/mirror/transitional review status.
