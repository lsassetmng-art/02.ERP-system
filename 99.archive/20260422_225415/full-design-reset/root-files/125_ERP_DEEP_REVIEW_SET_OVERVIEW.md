# ============================================================
# ERP DEEP REVIEW SET OVERVIEW
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Explains the role of the deep review set
inside the ERP canonical design and reconciliation work.

summary:
The deep review set exists after the common canonical design pack
and after the first exact contract pack.

Its role is to reconcile:
- canonical layer/module ownership
- exact contract definitions
- real schema structure
- real table placement
- duplicated/transitional families
- mirror/read-model vs write-authority behavior

main_use_cases:
- reviewing real schema fragmentation
- classifying mixed schemas
- classifying duplicated support families
- anchoring exact contracts to real tables
- reviewing public-vs-domain header duplication
- separating runtime truth from queue/history/log support
- separating settlement/AR/AP anchors from projections

important_note:
This set is intentionally more investigative than the common design set.
It contains:
- first-pass judgments
- revised judgments after actual column findings
- provisional authority decisions
- confirmation checklists
- unresolved-family discovery notes

relationship_to_other_sets:
- common design set = canonical rule layer
- exact contract set = endpoint/contract layer
- deep review set = real-schema reconciliation layer

conclusion:
The deep review set is the formal bridge
between ideal ERP canonical design
and messy real physical schema reality.
