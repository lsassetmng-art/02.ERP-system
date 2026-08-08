# ============================================================
# ERP PUBLIC HEADER MIRROR CONFIRMATION RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the rule for confirming whether public header tables are:
- mirror/read-model
- transitional duplicates
- or active write targets

# ============================================================
# 1. CONFIRMATION TARGETS
# ============================================================

confirmation_targets:
- public.order_header
- public.purchase_order_header
- public.billing_header
- public.return_header
- public.shipping_header

paired_domain_targets:
- sales.order_header
- purchase.purchase_order_header
- sales.billing_header
- sales.return_header
- sales.shipping_header

# ============================================================
# 2. CORE QUESTIONS
# ============================================================

core_questions:
- are inserts primarily executed against domain-side tables?
- are public-side tables updated by sync/replication/materialization?
- are public-side tables directly mutated by application writes?
- are public-side tables views or writable base tables in actual usage?
- do triggers or jobs populate public-side tables from domain-side tables?

# ============================================================
# 3. MIRROR SIGNALS
# ============================================================

mirror_signals:
- domain-side insert/update first
- public-side updated by sync/trigger/materialization
- public-side mainly used for broad read access
- public-side carries no unique operational write-only fields

# ============================================================
# 4. TRANSITIONAL SIGNALS
# ============================================================

transitional_signals:
- both sides still receive writes
- migration intent is visible
- one side appears legacy and one side appears target
- temporary coexistence without stable final authority

# ============================================================
# 5. ACTIVE WRITE SIGNALS
# ============================================================

active_write_signals:
- direct insert/update paths into public-side tables
- public-side owns primary business mutations
- public-side is not merely a reflected/read copy

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
public header tables should remain provisionally mirror/transitional
until actual write-path evidence confirms otherwise.
