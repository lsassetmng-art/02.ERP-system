# ============================================================
# ERP HEADER AUTHORITATIVE PLACEMENT POLICY
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the policy for deciding authoritative placement
among duplicated or mirror-like header table pairs.

# ============================================================
# 1. CORE RULE
# ============================================================

core_rule:
When two header tables have strongly overlapping structures,
the review must decide:
- authoritative write target
- mirror/read-model target
- or transitional coexistence

It must not leave both as silently equal source_of_truth.

# ============================================================
# 2. DECISION PRIORITIES
# ============================================================

decision_priorities:
1. semantic ownership must remain canonical
2. write authority must be singular where possible
3. mirror/read-model layers must be explicit
4. transitional duplication must be labeled as transitional
5. read convenience must not be mistaken for write authority

# ============================================================
# 3. DEFAULT POLICY
# ============================================================

default_policy:
If two tables are structurally near-identical:
- prefer one authoritative source_of_truth
- classify the other as mirror/read-model or transitional
- do not keep both silently authoritative without explicit reason

# ============================================================
# 4. EXCEPTION RULE
# ============================================================

exception_rule:
If domain-side table contains operationally essential extra columns
that materially change ownership meaning,
then domain-side authority may be preferred
and public/shared copy may become mirror/read-model.

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
Header-family pair review must end in an explicit placement decision,
not unresolved dual-authority ambiguity.
