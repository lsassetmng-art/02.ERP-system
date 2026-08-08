# ============================================================
# ERP PROVISIONAL AUTHORITY DECISIONS HARDENED
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records which provisional authority decisions
have been materially hardened by the first evidence pass.

# ============================================================
# 1. HARDENED HEADER DECISIONS
# ============================================================

hardened_header_decisions:
- sales.order_header remains the strongest write-authority candidate
- purchase.purchase_order_header remains the strongest write-authority candidate
- sales.billing_header remains the strongest write-authority candidate
- sales.return_header remains the strongest write-authority candidate
- sales.shipping_header remains the strongest write-authority candidate
- public header counterparts are materially strengthened as mirror/projection/transitional candidates

# ============================================================
# 2. HARDENED RUNTIME DECISIONS
# ============================================================

hardened_runtime_decisions:
- system.exec_run_request is now the strongest current active runtime truth candidate
- ops.ops_job_queue is strengthened as queue support
- ops.ops_job_result is strengthened as result/history side
- core.sync_queue is strengthened as support/sync family
- integration.integration_job remains a strong but less hardened active-process candidate

# ============================================================
# 3. STILL PROVISIONAL
# ============================================================

still_provisional:
- exact runtime write-path topology
- exact retry target
- public header actual mirror mechanism
- public header active-write absence
- settlement and AR/AP base truth

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
The first evidence pass converts several provisional decisions
into materially hardened working decisions,
though not yet final operational proofs.
