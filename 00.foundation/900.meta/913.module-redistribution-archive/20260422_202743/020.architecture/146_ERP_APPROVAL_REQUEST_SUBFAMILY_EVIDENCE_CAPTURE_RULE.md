# ============================================================
# ERP APPROVAL REQUEST SUBFAMILY EVIDENCE CAPTURE RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the rule for collecting evidence
about approval_request-like subfamilies.

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Do not flatten all approval_request-like tables
into one family from naming alone.

Each table must be classified by actual semantics and write behavior.

# ============================================================
# 2. VALID EVIDENCE TYPES
# ============================================================

valid_evidence_types:
- repository/service layer insert/update SQL
- workflow/approval handler code
- governance request handling code
- notify dispatch and callback code
- AI support workflow code
- trigger/function definitions
- migration notes
- view definitions

# ============================================================
# 3. PRIMARY QUESTIONS
# ============================================================

primary_questions:
- which table receives the first authoritative write for true approval truth?
- which tables hold governance/control requests instead?
- which tables are notify-side support/read surfaces?
- which tables are workflow/system orchestration support?
- which tables are AI recommendation/support requests?
- is public.approval_request_with_url a view/projection only?

# ============================================================
# 4. REQUIRED OUTPUT
# ============================================================

required_output:
Each evidence pass should produce:
- target table or view
- observed mutation or derivation
- inferred subfamily
- inferred role
- confidence
- unresolved notes

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
approval_request-like review must now move
from structural mixed-family suspicion
to evidence-backed subfamily classification.
