# ============================================================
# ERP RUNTIME WRITE PATH EVIDENCE CAPTURE RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the rule for collecting evidence
about actual runtime-side write paths.

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Do not finalize runtime write authority
from table names or column names alone.

Write authority must be hardened by actual evidence.

# ============================================================
# 2. VALID EVIDENCE TYPES
# ============================================================

valid_evidence_types:
- repository/service layer insert or update SQL
- trigger/function definitions
- queue enqueue logic
- retry mutation logic
- job runner code
- sync/materialization code
- migration comments that clarify authority
- operational scripts that mutate runtime truth

# ============================================================
# 3. PRIMARY QUESTIONS
# ============================================================

primary_questions:
- which table receives the first authoritative write for execution intent?
- which table holds current execution status?
- which table is mutated on retry?
- which tables are queue/outbox only?
- which tables are result/history only?
- which tables are mirrors or duplicated support?

# ============================================================
# 4. OUTPUT REQUIREMENT
# ============================================================

output_requirement:
Each evidence capture pass should produce:
- target table
- evidence source
- observed mutation type
- inferred role
- confidence
- unresolved notes

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Runtime write-path decisions must now move
from structural inference to evidence-backed confirmation.
