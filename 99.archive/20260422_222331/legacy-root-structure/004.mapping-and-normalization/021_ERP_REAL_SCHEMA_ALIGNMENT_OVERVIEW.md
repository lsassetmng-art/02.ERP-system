# ============================================================
# ERP REAL SCHEMA ALIGNMENT OVERVIEW
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines how the canonical ERP design should be aligned
with the real ERP database schema structure.

# ============================================================
# 1. CORE RECOGNITION
# ============================================================

core_recognition:
The canonical ERP design and the real ERP database do not use
the same structuring axis.

canonical_design_axis:
- 000.platform
- 100.business
- 200.management
- 300.analytics

real_database_axis:
- physical database schemas such as:
  - accounting
  - approval
  - audit
  - finance
  - governance
  - sales
  - purchase
  - hr
  - integration
  - ops
  - system
  - analytics
  - and others

meaning:
The canonical design is a semantic ownership model.
The real database is a physical schema distribution model.

# ============================================================
# 2. ALIGNMENT RULE
# ============================================================

alignment_rule:
Do not force one-to-one folder-name = schema-name assumptions.

Instead:
- determine canonical ownership first
- then map real physical schemas into canonical layer/module ownership
- allow one canonical module to span multiple schemas
- allow one schema to contain tables belonging to multiple canonical concerns, subject to review

# ============================================================
# 3. IMPORTANT OBSERVATION
# ============================================================

important_observation:
The uploaded real schema summary shows a large number of schemas,
including:
- accounting
- approval
- audit
- auth
- core
- finance
- govern
- governance
- hr
- integration
- inventory
- ops
- purchase
- sales
- system
- analytics
and others.

This means the real ERP implementation is physically distributed
more finely than the canonical 4-layer design.

# ============================================================
# 4. PRACTICAL CONSEQUENCE
# ============================================================

practical_consequence:
Canonical review should answer:
- who owns the meaning?
Real schema review should answer:
- where is it physically stored?

These are related but not identical questions.

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Canonical ERP design must be aligned to real schemas
through mapping, not by naive name matching.

This document becomes the formal overview
for real-schema-to-canonical alignment work.
