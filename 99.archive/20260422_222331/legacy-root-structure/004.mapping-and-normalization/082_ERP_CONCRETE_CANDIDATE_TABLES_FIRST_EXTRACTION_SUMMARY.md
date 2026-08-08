# ============================================================
# ERP CONCRETE CANDIDATE TABLES FIRST EXTRACTION SUMMARY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Summarizes the first concrete table-name extraction results
for unresolved real table families.

# ============================================================
# 1. STRONGEST EXTRACTION RESULT
# ============================================================

strongest_extraction_result:
execution/runtime-family

reason:
Many concrete candidates were observed,
including:
- system.exec_run_request
- cron.job
- cron.job_run_details
- integration.integration_job
- ops.ops_job_queue
- ops.ops_job_result
- ops.job_execution_log

# ============================================================
# 2. MODERATE EXTRACTION RESULT
# ============================================================

moderate_extraction_result:
document-family

reason:
Many domain-specific header and support/history candidates were observed,
but the family is structurally mixed and not yet unified.

# ============================================================
# 3. WEAK EXTRACTION RESULTS
# ============================================================

weak_extraction_results:
- settlement-family
- receivable/payable-family

reason:
Current explicit hits are sparse and/or view-oriented:
- finance.payment_allocation
- public.v_finance_payment_allocation
- public.v_ar_accrual_preview
- public.v_ap_accrual_preview

# ============================================================
# 4. CONSEQUENCE
# ============================================================

consequence:
The next most productive deep-dive targets are:
1. execution/runtime-family
2. document-family
3. settlement-family
4. receivable/payable-family

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Concrete extraction now shows where the schema inventory is already rich
and where further discovery remains difficult.
