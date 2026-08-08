# ============================================================
# ERP RUNTIME AND HEADER CONFIRMATION CHECKLIST
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides a common checklist for confirming
runtime write-path and public-vs-domain header authority.

# ============================================================
# 1. RUNTIME CHECKLIST
# ============================================================

runtime_checklist:
- find insert target for execution request creation
- find update target for current execution status
- find retry mutation target
- find queue enqueue target
- find result append target
- find log append target
- find sync_queue duplication behavior

# ============================================================
# 2. HEADER CHECKLIST
# ============================================================

header_checklist:
- find insert target for new document header
- find update target for lifecycle/status changes
- check whether public-side table is directly written
- check whether public-side table is populated by trigger/job/view
- check whether domain-side table has operational-only fields
- check whether both sides are written concurrently

# ============================================================
# 3. EVIDENCE TYPES
# ============================================================

evidence_types:
- SQL definitions
- repository write paths
- trigger/function definitions
- migration history
- materialized view / view definitions
- job/sync scripts
- application repository/service layer code

# ============================================================
# 4. OUTPUT EXPECTED
# ============================================================

output_expected:
For each reviewed family:
- provisional authority confirmed or revised
- mirror/transitional label confirmed or revised
- support/history/source_of_truth split hardened
- unresolved items listed explicitly

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
This checklist is the bridge from structural suspicion
to operational confirmation.
