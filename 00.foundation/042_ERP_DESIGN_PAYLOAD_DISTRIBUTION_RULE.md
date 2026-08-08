# ============================================================
# ERP DESIGN PAYLOAD DISTRIBUTION RULE
# ============================================================

status: canonical
owner: Boss
prepared_by: Zero

purpose:
Distribute existing ERP design payload files from transition and legacy locations
into numbered canonical module/submodule design layers.

# 1. Scope
- design only
- implementation untouched

# 2. Canonical targets
- ~/02.ERP-system/<nn.module>/<layer>
- ~/02.ERP-system/<nn.module>/<nn.submodule>/<layer>

# 3. Source roots
- ~/02.ERP-system/90.transition-triage
- legacy unnumbered ERP roots directly under ~/02.ERP-system

# 4. Distribution rule
- copy into canonical target additively
- never overwrite existing target files
- after successful copy, move source file into:
  - ~/02.ERP-system/90.transition-triage/30.distribution-archive/<stamp>

# 5. Unknown classification
- module unknown:
  - ~/02.ERP-system/90.transition-triage/20.unclassified-global/module-unknown
- layer unknown:
  - <target unit>/900.meta/912.transition-unclassified/files
- conflict:
  - <target unit>/900.meta/912.transition-unclassified/conflict-files
