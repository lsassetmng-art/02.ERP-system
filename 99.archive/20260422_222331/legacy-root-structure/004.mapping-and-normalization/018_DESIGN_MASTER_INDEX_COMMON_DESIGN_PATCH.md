# ============================================================
# DESIGN MASTER INDEX COMMON DESIGN PATCH
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides the patch text to integrate the ERP common design set
into DESIGN_MASTER_INDEX.md.

# ============================================================
# 1. PATCH INTENT
# ============================================================

patch_intent:
DESIGN_MASTER_INDEX.md should explicitly recognize
the ERP common design set as the shared canonical rule pack
for ERP-wide architecture, interface, control, and normalization design.

# ============================================================
# 2. RECOMMENDED ADDITION
# ============================================================

recommended_addition_title:
ERP Common Design Set

recommended_addition_body:
The ERP common design set is the shared canonical design pack
for ERP-wide rules and cross-cutting standards.

root_entry_files:
- 000_COMMON_DESIGN_INDEX.md
- 000_COMMON_DESIGN_OVERVIEW.md

folders:
- 001.core-principles
- 002.interface-and-contract
- 003.control-and-workflow
- 004.mapping-and-normalization

role:
Use this set when reviewing or defining:
- ERP-wide architecture rules
- exact contract naming and response standards
- workflow / approval / governance standards
- table ownership and dump normalization rules

# ============================================================
# 3. INSERTION POSITION
# ============================================================

recommended_insertion_position:
Insert near other root-level ERP-wide navigation entries,
before deep domain-specific navigation if possible.

# ============================================================
# 4. WHY THIS PATCH IS NEEDED
# ============================================================

why_needed:
Without this patch, the common design set remains structurally present
but weakly discoverable from the existing design master navigation.

# ============================================================
# 5. CONCLUSION
# ============================================================

conclusion:
This patch should be applied so that DESIGN_MASTER_INDEX.md
becomes a true entry point to the ERP shared canonical design pack.
