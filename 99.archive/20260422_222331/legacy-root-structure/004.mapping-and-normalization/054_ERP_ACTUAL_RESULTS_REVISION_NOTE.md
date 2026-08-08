# ============================================================
# ERP ACTUAL RESULTS REVISION NOTE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Records the key revisions required after actual column-based findings.

# ============================================================
# 1. REVISION 1
# ============================================================

revision:
system_control family

old working suspicion:
- duplicate/support candidate

new confidence:
- confirmed strong duplicate/support family pattern

# ============================================================
# 2. REVISION 2
# ============================================================

revision:
approval_request family

old working suspicion:
- possible duplicate/transitional approval truth

new confidence:
- not a simple duplicate family
- structurally mixed concept family across multiple schemas

# ============================================================
# 3. REVISION 3
# ============================================================

revision:
accounting_period family

old working suspicion:
- core.accounting_period likely general truth

new visible evidence:
- public.accounting_period appears as current concrete general period truth in uploaded columns

# ============================================================
# 4. REVISION 4
# ============================================================

revision:
journal family

old working suspicion:
- core journal truth likely authoritative

new visible evidence:
- public.journal_entries and public.journal_lines are the clearest currently visible authoritative journal truth candidates
- accounting journal_candidate/journal_draft look staging-side

# ============================================================
# 5. CONSEQUENCE
# ============================================================

consequence:
Future real-table mapping should now prioritize:
- public schema accounting truth review
- approval_request subfamily separation
- duplicated support family review for system_control
- staged vs authoritative journal split

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
Actual column-based findings are now stronger than earlier schema-name inferences,
so subsequent mapping documents must follow the revised interpretation.
