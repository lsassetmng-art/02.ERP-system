# ============================================================
# ERP DESIGN CIVILIZATIONOS STRUCTURE AND DISTRIBUTION RULE
# ============================================================

status: canonical
owner: Boss
prepared_by: Zero

purpose:
Fix ERP design folders so that each numbered module and submodule
uses the same design-layer structure as CivilizationOS.

# 1. Design root

- ~/02.ERP-system/<nn.module>
- ~/02.ERP-system/<nn.module>/<nn.submodule>

# 2. Canonical design layers

- 010.constitution
- 020.architecture
- 030.model
- 050.flow
- 060.integration
- 070.operations
- 080.policy
- 100.security
- 110.infrastructure
- 120.implementation
- 130.development
- 900.meta
- 920.meta

# 3. Root rule

Only these should remain at each design unit root:
- INDEX.md
- OVERVIEW.md
- canonical numbered layer folders

# 4. Transition inbox rule

Legacy root-level files and incorrectly placed directories must be moved to:
- 900.meta/910.transition-inbox

Subfolders:
- legacy-root-dirs
- legacy-root-files

# 5. Important note

Implementation folders are not touched by this rule.
Implementation remains under:
- ~/04.ERP-development/<nn.module>
- ~/04.ERP-development/<nn.module>/<nn.submodule>
