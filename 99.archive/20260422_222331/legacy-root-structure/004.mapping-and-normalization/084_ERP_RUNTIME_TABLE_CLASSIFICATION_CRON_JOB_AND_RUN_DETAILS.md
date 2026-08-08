# ============================================================
# ERP RUNTIME TABLE CLASSIFICATION CRON JOB AND RUN DETAILS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides first-pass canonical classification
for cron.job and cron.job_run_details.

review_basis:
- erp_schema_table_column_full.txt

tables:
- cron.job
- cron.job_run_details

# ============================================================
# 1. CURRENT WORKING INTERPRETATION
# ============================================================

cron.job:
  working_interpretation:
  - scheduler-owned recurring or queued job definition/support
  likely_class:
  - support or source_of_truth for scheduler layer
  confidence:
  - medium

cron.job_run_details:
  working_interpretation:
  - per-run execution history/details
  likely_class:
  - history or support-history
  confidence:
  - high

# ============================================================
# 2. LIKELY CANONICAL POSITION
# ============================================================

likely_canonical_position:
- canonical_layer: 000.platform
- canonical_module: workflow / scheduler / runtime-support side

# ============================================================
# 3. FAMILY SPLIT
# ============================================================

family_split:
- cron.job -> job definition / scheduling support
- cron.job_run_details -> execution history/details

meaning:
These should not be flattened into one runtime truth table.
They likely represent:
- definition/support
plus
- history/detail

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
cron.job and cron.job_run_details are best treated
as scheduler support plus execution history,
not as the sole generic runtime truth family.
