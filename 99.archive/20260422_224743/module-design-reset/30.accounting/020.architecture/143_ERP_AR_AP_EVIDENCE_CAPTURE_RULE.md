# ============================================================
# ERP AR AP EVIDENCE CAPTURE RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the rule for collecting evidence
about actual AR/AP base truth and preview derivation.

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Do not finalize AR/AP source_of_truth
from preview-view names alone.

Base ledger truth must be identified by actual evidence.

# ============================================================
# 2. VALID EVIDENCE TYPES
# ============================================================

valid_evidence_types:
- view definitions for v_ar_accrual_preview / v_ap_accrual_preview
- repository/service layer read/write SQL
- ledger/accrual/balance query code
- posting logic
- migration notes
- joins to billing / journal / allocation tables
- aging/open_amount/original_amount derivation logic

# ============================================================
# 3. PRIMARY QUESTIONS
# ============================================================

primary_questions:
- what base tables feed AR/AP preview views?
- is balance truth stored in explicit ledgers or derived from journals?
- where are due_date / open_amount / original_amount maintained?
- how do previews relate to billing and payment_allocation?
- are AR/AP tables write targets or derived read surfaces only?

# ============================================================
# 4. OUTPUT REQUIREMENT
# ============================================================

output_requirement:
Each evidence pass should produce:
- target table/view
- evidence source
- observed derivation or mutation
- inferred role
- confidence
- unresolved notes

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
AR/AP review must now move
from preview anchoring to base-truth confirmation.
