# ============================================================
# ERP MIRROR AND TRANSITIONAL HEADER POLICY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines how mirror/read-model and transitional labels
should be used for duplicated header families.

# ============================================================
# 1. MIRROR RULE
# ============================================================

mirror_rule:
Use mirror/read-model when:
- a table exists primarily for broad shared read access
- structure overlaps strongly with another authoritative table
- write authority belongs elsewhere
- lag/sync or replication behavior is acceptable by design

# ============================================================
# 2. TRANSITIONAL RULE
# ============================================================

transitional_rule:
Use transitional when:
- two similar tables coexist during migration
- one is intended to replace the other
- full cutover has not yet completed
- both still appear live in the current structure

# ============================================================
# 3. DO NOT HIDE DUALITY
# ============================================================

do_not_hide_duality:
Do not leave duplicated header pairs unlabeled.
Each reviewed pair should end up as one of:
- authoritative + mirror
- authoritative + transitional
- unresolved pending stronger evidence

# ============================================================
# 4. CURRENT WORKING APPLICATION
# ============================================================

current_working_application:
- order_header pair -> unresolved but likely authority/mirror or authority/transitional
- purchase_order_header pair -> unresolved but likely authority/mirror or authority/transitional
- billing_header pair -> stronger domain-extension signal
- return_header pair -> stronger domain-extension signal
- shipping_header pair -> likely authority/mirror or authority/transitional

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Mirror and transitional labels are mandatory tools
for governing duplicated header families responsibly.
