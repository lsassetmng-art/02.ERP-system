# ============================================================
# ERP HEADER WRITE EVIDENCE CAPTURE RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the rule for collecting evidence
about actual write behavior for public-vs-domain header pairs.

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Do not finalize header write authority
from structural similarity alone.

Write authority must be hardened by actual evidence.

# ============================================================
# 2. VALID EVIDENCE TYPES
# ============================================================

valid_evidence_types:
- repository/service layer insert SQL
- repository/service layer update SQL
- trigger/function definitions
- sync/materialization jobs
- migration notes
- batch/sync scripts
- application command handlers
- view/materialized view definitions if relevant

# ============================================================
# 3. PRIMARY QUESTIONS
# ============================================================

primary_questions:
- which table receives the first insert for new header creation?
- which table receives lifecycle/status updates?
- is public-side directly written?
- is public-side populated from domain-side?
- are both sides written concurrently?
- does one side behave as read-model or sync target only?

# ============================================================
# 4. OUTPUT REQUIREMENT
# ============================================================

output_requirement:
Each evidence capture pass should produce:
- target pair
- evidence source
- observed mutation type
- inferred authority role
- confidence
- unresolved notes

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Header authority decisions must now move
from structural comparison to evidence-backed confirmation.
