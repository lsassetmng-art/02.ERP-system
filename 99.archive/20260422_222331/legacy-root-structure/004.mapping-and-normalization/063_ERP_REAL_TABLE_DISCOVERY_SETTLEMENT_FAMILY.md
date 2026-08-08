# ============================================================
# ERP REAL TABLE DISCOVERY SETTLEMENT FAMILY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the next discovery target and review posture
for real settlement-family tables.

# ============================================================
# 1. WHY THIS FAMILY IS NEXT
# ============================================================

why_next:
Settlement contracts already exist canonically,
but the real physical settlement-family tables
have not yet been confidently anchored.

relevant_contracts:
- 027_ERP_EXACT_PAYLOAD_ACCOUNTING_SETTLEMENT_CREATE.md
- 041_ERP_EXACT_QUERY_SETTLEMENTS_LIST.md
- 042_ERP_EXACT_QUERY_SETTLEMENT_DETAIL.md

# ============================================================
# 2. DISCOVERY TARGETS
# ============================================================

candidate_name_patterns:
- settlement
- settled
- apply
- applied
- receipt_to_ar
- payment_to_ap
- allocation
- clearing
- match
- offset

candidate_schema_focus:
- accounting
- finance
- public
- possibly core

# ============================================================
# 3. REVIEW QUESTIONS
# ============================================================

review_questions:
- which table stores settlement header truth?
- which table stores settlement line/application truth?
- are settlement effects represented directly or inferred through journal/AR/AP linkage?
- is there a settlement status field or only event/history representation?
- are there duplicate or specialized settlement tables?

# ============================================================
# 4. EXPECTED OUTPUT
# ============================================================

expected_output:
- likely settlement header table
- likely settlement line table
- canonical class judgment
- source_of_truth vs support split
- contract alignment update target

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Settlement-family discovery is the highest remaining accounting-side table discovery priority.
