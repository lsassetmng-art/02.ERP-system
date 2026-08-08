# ============================================================
# ERP SETTLEMENT EVIDENCE CAPTURE RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the rule for collecting evidence
about actual settlement-family truth and write behavior.

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Do not finalize settlement-family truth
from naming similarity alone.

Settlement truth must be hardened by actual evidence.

# ============================================================
# 2. VALID EVIDENCE TYPES
# ============================================================

valid_evidence_types:
- repository/service layer insert/update SQL
- function/trigger definitions
- view definitions
- migration notes
- accounting posting flow code
- payment application logic
- AR/AP linkage queries
- reconciliation scripts

# ============================================================
# 3. PRIMARY QUESTIONS
# ============================================================

primary_questions:
- is finance.payment_allocation the direct application truth?
- does a separate settlement header table exist?
- is public.v_finance_payment_allocation only a projection?
- what source and target objects are linked?
- does payment_allocation mutate balance truth directly or via downstream posting?

# ============================================================
# 4. OUTPUT REQUIREMENT
# ============================================================

output_requirement:
Each evidence pass should produce:
- target table/view
- evidence source
- observed operation or derivation
- inferred role
- confidence
- unresolved notes

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Settlement-family review must now move
from candidate anchoring to evidence-backed hardening.
