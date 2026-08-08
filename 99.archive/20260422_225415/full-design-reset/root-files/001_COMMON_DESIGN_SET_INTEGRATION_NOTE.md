# ============================================================
# COMMON DESIGN SET INTEGRATION NOTE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

# ============================================================
# 0. PURPOSE
# ============================================================

purpose:
Defines how the ERP common design set is integrated
into the root ERP navigation structure.

goals:
- formally position the common design set inside root navigation
- clarify relation to existing root index files
- prevent the common design set from becoming an orphan structure
- define how future common design documents should be connected

# ============================================================
# 1. WHAT THE COMMON DESIGN SET IS
# ============================================================

common_design_set_definition:
The common design set is the ERP-wide canonical shared design pack
located under these folders:

- 001.core-principles
- 002.interface-and-contract
- 003.control-and-workflow
- 004.mapping-and-normalization

root_entry_documents:
- 000_COMMON_DESIGN_INDEX.md
- 000_COMMON_DESIGN_OVERVIEW.md

role:
This set defines common ERP rules that apply across all layers and modules.

# ============================================================
# 2. ROOT NAVIGATION POSITION
# ============================================================

root_navigation_position:
The common design set must be treated as a root-level shared design layer.

it_is_not:
- a single business domain
- a single platform module
- a temporary scratch area
- an app-specific folder

it_is:
- a cross-cutting canonical design pack
- a shared rule layer
- a structured ERP-wide design reference

# ============================================================
# 3. RELATION TO ROOT FILES
# ============================================================

relation_to_root_files:

  ERP_DESIGN_BIBLE_FULL.md:
    role:
    - integrated broad ERP design source
    relation:
    - common design set acts as a structured canonical sub-layer
    note:
    - detailed common rules may be maintained here first and later reflected upward if needed

  ERP_SYSTEM_MASTER_INDEX.md:
    role:
    - root ERP navigation index
    relation:
    - should include explicit entry to the common design set

  DESIGN_MASTER_INDEX.md:
    role:
    - broader design navigation document
    relation:
    - should reference the common design set as the ERP-wide shared rule pack

  ERP_SYSTEM_FOLDER_STRUCTURE_CANONICAL.md:
    role:
    - canonical folder structure explanation
    relation:
    - common design set should be acknowledged as root-level shared design folders

# ============================================================
# 4. REQUIRED NAVIGATION LINKS
# ============================================================

required_navigation_links:
- ERP_SYSTEM_MASTER_INDEX.md -> 000_COMMON_DESIGN_INDEX.md
- ERP_SYSTEM_MASTER_INDEX.md -> 000_COMMON_DESIGN_OVERVIEW.md
- DESIGN_MASTER_INDEX.md -> 000_COMMON_DESIGN_INDEX.md
- DESIGN_MASTER_INDEX.md -> 000_COMMON_DESIGN_OVERVIEW.md

recommended_navigation_links:
- root-level note to 001.core-principles
- root-level note to 002.interface-and-contract
- root-level note to 003.control-and-workflow
- root-level note to 004.mapping-and-normalization

# ============================================================
# 5. DESIGN INTENT
# ============================================================

design_intent:
The common design set exists so that ERP-wide standards are not scattered
across unrelated domain folders.

without_this_integration:
- common rules become hard to discover
- layer/module/table standards become disconnected from root navigation
- later design contributors may miss the canonical shared rules

with_this_integration:
- root navigation clearly shows shared ERP design rules
- exact contracts and schema normalization can point to one canonical rule set
- future additions have a stable home

# ============================================================
# 6. FUTURE DOCUMENT PLACEMENT RULE
# ============================================================

future_document_placement_rule:
New ERP-wide shared design documents should be added
to the common design set folders, not randomly to root.

placement_principle:
- architecture/semantics -> 001.core-principles
- interface/contract rules -> 002.interface-and-contract
- workflow/control/approval/governance rules -> 003.control-and-workflow
- schema/dump/mapping normalization -> 004.mapping-and-normalization

root_only_exceptions:
- root entry documents
- integration notes
- root master navigation documents

# ============================================================
# 7. REVIEW CONSEQUENCE
# ============================================================

review_consequence:
Any future review of ERP root navigation should verify:
- common design set is discoverable from root
- common design set remains categorized
- new common-rule documents are not scattered inconsistently

# ============================================================
# 8. CONCLUSION
# ============================================================

conclusion:
The ERP common design set must be treated as a root-level shared canonical design pack
and explicitly connected to root master navigation documents.

This note becomes the formal basis for:
- root navigation integration
- future common design placement
- ERP shared rule discoverability
