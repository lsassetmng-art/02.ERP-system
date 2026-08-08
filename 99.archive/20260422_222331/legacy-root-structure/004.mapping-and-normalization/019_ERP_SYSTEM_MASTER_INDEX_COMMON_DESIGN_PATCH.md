# ============================================================
# ERP SYSTEM MASTER INDEX COMMON DESIGN PATCH
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the patch text to integrate the ERP common design set
into ERP_SYSTEM_MASTER_INDEX.md.

# ============================================================
# 1. PATCH INTENT
# ============================================================

patch_intent:
ERP_SYSTEM_MASTER_INDEX.md should expose the common design set
as a formal root-level shared design navigation block.

# ============================================================
# 2. RECOMMENDED ADDITION
# ============================================================

recommended_addition_title:
Common Design Set

recommended_addition_body:
The common design set is the ERP-wide shared canonical design layer
for cross-cutting architectural, contract, control, and normalization rules.

entry_files:
- 000_COMMON_DESIGN_INDEX.md
- 000_COMMON_DESIGN_OVERVIEW.md

subfolders:
- 001.core-principles
- 002.interface-and-contract
- 003.control-and-workflow
- 004.mapping-and-normalization

folder_meanings:
- 001.core-principles = architecture and semantic foundations
- 002.interface-and-contract = contract and API boundary standards
- 003.control-and-workflow = workflow, approval, governance, and mutation rules
- 004.mapping-and-normalization = table, dump, and contract/table alignment rules

# ============================================================
# 3. INSERTION POSITION
# ============================================================

recommended_insertion_position:
Place near the top-level root navigation section,
together with major root entry files and shared design navigation items.

# ============================================================
# 4. WHY THIS PATCH IS NEEDED
# ============================================================

why_needed:
ERP_SYSTEM_MASTER_INDEX.md should make the common design set discoverable
without requiring users to inspect the root folder manually.

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
This patch should be applied so that ERP_SYSTEM_MASTER_INDEX.md
formally includes the ERP shared common design structure.
