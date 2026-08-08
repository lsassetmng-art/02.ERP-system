# ============================================================
# ERP REAL SCHEMA REVIEW RULE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the formal rule for reviewing real ERP schemas
against canonical ERP design.

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
Review real schemas by semantic ownership,
not by schema name alone.

# ============================================================
# 2. REVIEW QUESTIONS
# ============================================================

required_review_questions:
- what semantic truth is this schema likely storing?
- is this schema mostly platform, business, management, or analytics?
- is this schema mixed?
- which canonical modules are likely represented here?
- does the schema appear legacy, transitional, or canonical in meaning?
- do table names suggest duplicate truth with another schema?

# ============================================================
# 3. MIXED SCHEMA RULE
# ============================================================

mixed_schema_rule:
If a schema appears to span more than one canonical concern,
mark it as mixed instead of forcing premature purity.

examples:
- core
- system
- ops
- ai
- govern

# ============================================================
# 4. TRUST RULE
# ============================================================

trust_rule:
Schema inventory files are more authoritative for DB structure
than mixed dump artifacts.

mixed dump artifacts may help with:
- naming lineage
- repo layout context
- implementation clues

but not with:
- final table ownership truth by themselves

# ============================================================
# 5. OUTPUT RULE
# ============================================================

output_rule:
Every schema review should produce:
- schema_name
- likely canonical layer
- likely canonical modules
- confidence
- mixed flag if needed
- notes

# ============================================================
# 6. CONCLUSION
# ============================================================

conclusion:
Real schema review must remain semantic-first,
schema-name-second, and dump-context-third.
