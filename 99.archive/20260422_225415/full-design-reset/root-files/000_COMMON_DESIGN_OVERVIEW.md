# ============================================================
# COMMON DESIGN OVERVIEW
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Explains the role and scope of the ERP common design document set.

# ============================================================
# 1. WHAT THIS DESIGN SET IS
# ============================================================

definition:
This common design set is the ERP-wide canonical design layer
that sits above individual domain folders and below the full ERP design bible.

It defines shared rules, shared semantics, shared ownership principles,
and shared contract discipline that apply across the whole ERP system.

# ============================================================
# 2. WHY THIS DESIGN SET EXISTS
# ============================================================

why_needed:
- root ERP folders alone are not enough to explain cross-cutting design rules
- exact contracts need shared naming and ownership discipline
- tables need ownership principles before physical schema normalization
- workflow, approval, governance, and accounting controls need common rules
- dump review needs canonical mapping standards

without_this_set:
- different domains may invent conflicting meanings
- status/request/action/event naming may diverge
- table ownership may become inconsistent
- contract boundaries may become ambiguous

# ============================================================
# 3. SCOPE OF THIS DESIGN SET
# ============================================================

scope:
This set covers ERP-wide common design, including:
- architecture layers
- responsibility boundaries
- ownership principles
- semantic models
- interface and contract standards
- workflow and control rules
- mapping and normalization standards

out_of_scope:
- detailed domain-specific business models already defined inside domain folders
- app-specific UI-only details
- low-level implementation source code

# ============================================================
# 4. INTERNAL STRUCTURE
# ============================================================

internal_structure:

  001.core-principles:
    role:
    - architectural and semantic base of ERP

  002.interface-and-contract:
    role:
    - exact boundary and contract discipline

  003.control-and-workflow:
    role:
    - workflow, approval, governance, mutation, and control rules

  004.mapping-and-normalization:
    role:
    - bridge from design principles to actual tables, dumps, and schema review

# ============================================================
# 5. HOW TO USE THIS DESIGN SET
# ============================================================

usage_order:
- first read core-principles
- then read interface-and-contract for boundary discipline
- then read control-and-workflow for actual ERP flow and control logic
- then read mapping-and-normalization for schema/table alignment work

recommended_use_cases:
- defining new ERP exact contracts
- reviewing table placement
- designing approval/governance flows
- reviewing dumps and canonical ownership
- standardizing payloads and response fields

# ============================================================
# 6. RELATION TO OTHER ROOT DOCUMENTS
# ============================================================

relation_to_other_root_docs:
- ERP_DESIGN_BIBLE_FULL.md remains the broad integrated design source
- ERP_SYSTEM_MASTER_INDEX.md remains the whole-system root navigation
- DESIGN_MASTER_INDEX.md remains the broader design navigation layer
- this common design set acts as the structured ERP-wide canonical design pack

# ============================================================
# 7. DESIGN ROLE IN THE ROADMAP
# ============================================================

roadmap_role:
This design set plays the role of:
- principle standardization
- contract discipline standardization
- control/workflow standardization
- mapping/normalization preparation

next_natural_steps_after_this_set:
- connect these documents into root master indexes
- align exact payloads with real contracts
- map dump tables to canonical ownership
- compare canonical design with real implementation

# ============================================================
# 8. CONCLUSION
# ============================================================

conclusion:
The ERP common design set is the formal shared design foundation
used to keep the whole ERP architecture, contracts, control logic,
and table normalization consistent across all modules.

It should be treated as the main common-rule reference
for all future ERP design refinement.

# ============================================================
# ERP RECONCILIATION LAYER
# ============================================================

ERP RECONCILIATION LAYER

Meaning:
The common ERP design set now includes not only:
- canonical principles
- exact interface/contracts
- workflow/control rules
- mapping/normalization base rules

but also a formal reconciliation bridge to:
- real schemas
- real tables
- duplicate/transitional families
- mirror/read-model review
- runtime write-path confirmation
- public-vs-domain authority review

Root entry:
- 124_ERP_DEEP_REVIEW_SET_INDEX.md
- 125_ERP_DEEP_REVIEW_SET_OVERVIEW.md
- 126_ERP_RECONCILIATION_ROADMAP.md
- 127_ERP_RECONCILIATION_CURRENT_STATE.md
- 128_ERP_RECONCILIATION_NEXT_ACTIONS.md
- 129_ERP_RECONCILIATION_DECISION_LOG_SUMMARY.md

Role:
This reconciliation layer is the practical bridge between
ideal canonical ERP design
and the real physical implementation currently observed in schemas and tables.

