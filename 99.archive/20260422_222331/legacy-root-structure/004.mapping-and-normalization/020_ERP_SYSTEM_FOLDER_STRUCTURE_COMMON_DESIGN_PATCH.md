# ============================================================
# ERP SYSTEM FOLDER STRUCTURE COMMON DESIGN PATCH
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the patch text to reflect the common design set
inside ERP_SYSTEM_FOLDER_STRUCTURE_CANONICAL.md.

# ============================================================
# 1. PATCH INTENT
# ============================================================

patch_intent:
ERP_SYSTEM_FOLDER_STRUCTURE_CANONICAL.md should explicitly describe
the root-level common design folders as canonical shared design folders.

# ============================================================
# 2. RECOMMENDED STRUCTURE ADDITION
# ============================================================

recommended_structure_addition:
At root level, the following shared design folders exist
as ERP-wide canonical common design folders:

- 001.core-principles
- 002.interface-and-contract
- 003.control-and-workflow
- 004.mapping-and-normalization

# ============================================================
# 3. RECOMMENDED EXPLANATION
# ============================================================

recommended_explanation:
These folders are not business domain folders.
They are shared ERP design folders used to hold
cross-cutting canonical rules and standards.

folder_roles:
- 001.core-principles:
  ERP-wide architecture, semantic, and ownership principles

- 002.interface-and-contract:
  exact contract, payload, response, and interface ownership standards

- 003.control-and-workflow:
  workflow, approval, governance, mutation, and control standards

- 004.mapping-and-normalization:
  table classification, contract/table mapping, and dump normalization standards

# ============================================================
# 4. WHY THIS PATCH IS NEEDED
# ============================================================

why_needed:
Without this patch, the root canonical structure document
may describe only the domain layer folders and omit
the shared design folders now used as ERP-wide canonical references.

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
This patch should be applied so that the canonical folder structure
accurately reflects the ERP common design set at root level.
