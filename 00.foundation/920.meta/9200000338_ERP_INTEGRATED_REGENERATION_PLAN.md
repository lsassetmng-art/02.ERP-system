# ============================================================
# ERP INTEGRATED REGENERATION PLAN
# Track E
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track E
scope:
- ERP integrated markdown regeneration
- verification before regeneration
- gap ledger before implementation-prep

purpose:
Define the safe plan for ERP integrated regeneration after Tracks A/B/C/D.

# ============================================================
# 1. REGENERATION POLICY
# ============================================================

regeneration_policy:
- additive-only
- no deletion
- no archive movement unless explicitly instructed
- no DB apply
- no source module canon relocation
- preserve existing foundation
- preserve module-level exact docs
- integrated output is compiled reference, not replacement for module docs
- CommonOS remains shared UI/presentation only
- ERP modules retain business canon

# ============================================================
# 2. RECOMMENDED INTEGRATED OUTPUTS
# ============================================================

recommended_outputs:
- ERP_INTEGRATED_CANONICAL_INDEX.md
- ERP_CROSS_MODULE_BOUNDARY_INTEGRATED.md
- ERP_TRACK_A_PRODUCTION_SIDE_INTEGRATED.md
- ERP_TRACK_B_FINANCE_SIDE_INTEGRATED.md
- ERP_TRACK_C_COMMERCIAL_SIDE_INTEGRATED.md
- ERP_TRACK_D_MASTER_DATA_CATALOG_INTEGRATED.md
- ERP_REMAINING_GAP_LEDGER.md
- ERP_IMPLEMENTATION_PREP_CANDIDATE_LEDGER.md

preferred_location:
- ~/02.ERP-system/000.integration

note:
- If file size becomes too large, split by track and keep root index.
- Do not merge into a single huge file if it becomes hard to upload or review.

# ============================================================
# 3. VERIFICATION BEFORE REGENERATION
# ============================================================

verify_before_regeneration:
- check module directories exist
- check key deepening docs exist
- check Track A/B/C/D completion notes exist
- grep key ownership terms
- grep forbidden shortcut terms
- check no CommonOS business canon absorption wording
- check no BI source truth absorption wording
- check no approval/audit direct mutation wording

# ============================================================
# 4. INTEGRATED REGENERATION SEQUENCE
# ============================================================

sequence:
- Step 1:
  - run read-only verification script
- Step 2:
  - inspect report
- Step 3:
  - generate integrated output folder
- Step 4:
  - concatenate by track, not blindly all files
- Step 5:
  - create root integrated index
- Step 6:
  - create gap ledger
- Step 7:
  - create implementation-prep candidate ledger
- Step 8:
  - verify integrated files exist and include required terms

# ============================================================
# 5. INTEGRATED FILE SPLIT RULE
# ============================================================

split_rule:
- Do not create one unbounded huge file by default.
- Prefer one root index plus track-level integrated files.
- If upload size is a concern, keep each file below practical upload limit.
- Maintain stable names and track order.
- Include generated_at, owner, prepared_by, source file list.

# ============================================================
# 6. COMPLETION STATE
# ============================================================

completion_state:
- regeneration plan fixed
- verification-first approach fixed
- integrated output strategy fixed

# ============================================================
