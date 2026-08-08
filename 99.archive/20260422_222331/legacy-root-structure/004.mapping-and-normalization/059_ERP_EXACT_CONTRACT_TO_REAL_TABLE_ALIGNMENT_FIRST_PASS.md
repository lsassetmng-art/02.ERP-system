# ============================================================
# ERP EXACT CONTRACT TO REAL TABLE ALIGNMENT
# REVISED FIRST PASS
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the first-pass alignment between ERP exact contracts
and currently observed real physical tables.

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Contract alignment must distinguish:
- semantic owner
- direct real-table touch points
- indirect/support real-table touch points

# ============================================================
# 2. IMPORTANT REVISED FACTS
# ============================================================

important_revised_facts:
- public.accounting_period is a strong current source_of_truth candidate
- public.journal_entries and public.journal_lines are strong current journal truth candidates
- accounting.journal_candidate and accounting.journal_draft are likely staging-side
- approval_request-like tables are split across multiple schemas and need subfamily treatment
- system_control is a duplicated support family

# ============================================================
# 3. FIRST-PASS CONTRACT ALIGNMENT PRINCIPLE
# ============================================================

first_pass_contract_alignment_principle:
Use the clearest current real tables first.
Do not force unresolved mixed families into false precision.

# ============================================================
# 4. COVERED CONTRACT AREAS
# ============================================================

covered_contract_areas:
- accounting action contracts
- approval action contracts
- major query contracts

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
This document set is the first bridge
from exact contract design to real physical table alignment.
