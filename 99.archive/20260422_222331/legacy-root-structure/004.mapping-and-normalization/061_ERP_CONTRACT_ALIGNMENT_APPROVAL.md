# ============================================================
# ERP CONTRACT ALIGNMENT APPROVAL
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides first-pass exact-contract-to-real-table alignment
for approval-related contracts.

# ============================================================
# 1. APPROVE / REJECT / RETURN ACTIONS
# ============================================================

contracts:
- 024_ERP_EXACT_PAYLOAD_APPROVAL_APPROVE.md
- 025_ERP_EXACT_PAYLOAD_APPROVAL_REJECT.md
- 026_ERP_EXACT_PAYLOAD_APPROVAL_RETURN.md

semantic_owner:
- 200.management / 270.approval

likely_direct_real_tables:
- unresolved true approval truth subfamily tables

likely_indirect_or_support_real_tables:
- audit.approval_log
- audit.approval_reason_template
- workflow/system/notify support tables as applicable

alignment_notes:
- direct real-table target is not yet stable because approval_request family is mixed across schemas
- approval action history may partially appear in audit-like placement
- true approval truth must not be collapsed into notify/system variants

# ============================================================
# 2. APPROVAL PENDING QUERY
# ============================================================

contract:
- 031_ERP_EXACT_QUERY_APPROVAL_PENDING.md

semantic_owner:
- 200.management / 270.approval

likely_direct_real_tables:
- unresolved true approval truth subfamily tables

likely_indirect_or_support_real_tables:
- workflow support tables
- notify support tables

alignment_notes:
- pending approval list should ultimately read from true approval truth
- current physical schema findings require subfamily separation before final mapping

# ============================================================
# 3. APPROVAL DETAIL QUERY
# ============================================================

contract:
- 032_ERP_EXACT_QUERY_APPROVAL_DETAIL.md

semantic_owner:
- 200.management / 270.approval

likely_direct_real_tables:
- unresolved true approval truth subfamily tables

likely_indirect_or_support_real_tables:
- audit.approval_log
- route/lane support tables wherever physically stored

alignment_notes:
- exact detail alignment is blocked mainly by unresolved approval_request-like real family split

# ============================================================
# 4. CURRENT WORKING RULE
# ============================================================

current_working_rule:
Approval contracts are semantically stable,
but real-table alignment remains provisional
until approval_request-like tables are split into subfamilies.

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Approval contract alignment is not yet final at real-table level.
The next requirement is identifying the true approval-truth subfamily
among mixed approval_request-like tables.
