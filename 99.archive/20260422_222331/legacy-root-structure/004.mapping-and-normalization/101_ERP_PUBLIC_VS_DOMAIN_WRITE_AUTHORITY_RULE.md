# ============================================================
# ERP PUBLIC VS DOMAIN WRITE AUTHORITY RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the current working rule
for write authority across public-vs-domain header pairs.

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
public schema presence does not automatically mean:
- non-authoritative
or
- authoritative

Write authority must be decided by:
- semantic ownership
- column structure
- operational specificity
- duplication/transitional evidence

# ============================================================
# 2. CURRENT WORKING PREFERENCE
# ============================================================

current_working_preference:
Where domain-side tables contain materially meaningful operational extension,
prefer:
- domain-side as write-authority candidate
- public-side as mirror/read-model candidate

Where both sides are effectively identical,
prefer:
- one explicit authority
- one explicit mirror/transitional label
rather than dual-authority ambiguity

# ============================================================
# 3. HEADER FAMILY APPLICATION
# ============================================================

header_family_application:

order_header pair:
- unresolved, but dual-authority should be avoided

purchase_order_header pair:
- unresolved, but dual-authority should be avoided

billing_header pair:
- sales.billing_header has original_billing_id
- domain-side extension signal exists

return_header pair:
- sales.return_header has shipping_id
- domain-side extension signal exists

shipping_header pair:
- currently near-identical
- requires explicit authority choice

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
Write authority for public-vs-domain header pairs
must be explicit and singular wherever possible.
