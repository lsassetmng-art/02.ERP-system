# ============================================================
# ERP INTEGRATED CANONICAL INDEX
# split regenerated
# ============================================================

status: regenerated
owner: Boss
prepared_by: Zero
generated_at: 2026-04-28 18:54:22 +0900
system: ERP
source_root: /data/data/com.termux/files/home/02.ERP-system
output_root: /data/data/com.termux/files/home/02.ERP-system/000.integration

# ============================================================
# 1. GENERATED FILES
# ============================================================

generated_files:
- 010_ERP_CROSS_MODULE_BOUNDARY_INTEGRATED.md
- 100_ERP_TRACK_A_PRODUCTION_SIDE_INTEGRATED.md
- 200_ERP_TRACK_B_FINANCE_SIDE_INTEGRATED.md
- 300_ERP_TRACK_C_COMMERCIAL_SIDE_INTEGRATED.md
- 400_ERP_TRACK_D_MASTER_DATA_CATALOG_INTEGRATED.md
- 900_ERP_TRACK_E_CURRENT_STATE_AND_GAP_INTEGRATED.md
- 910_ERP_IMPLEMENTATION_PREP_CANDIDATE_LEDGER.md

# ============================================================
# 2. TRACK STATUS
# ============================================================

track_status:
- Track A production-side: complete at boundary/exact-design layer
- Track B finance-side: complete at boundary/exact-design layer
- Track C commercial-side: complete at boundary/exact-design layer
- Track D master-data catalog: complete at boundary/exact-design layer
- Track E integrated regeneration: split regenerated in this run

# ============================================================
# 3. CANONICAL RULES
# ============================================================

canonical_rules:
- Existing ERP design is not rebuilt from scratch.
- Current work is additive deepening.
- Module docs remain canonical source.
- Integrated docs are compiled references.
- ERP business canon remains in ERP modules.
- CommonOS is shared UI / presentation foundation only.
- BI is analytical projection only.
- Approval owns approval workflow truth only.
- Audit owns audit finding / remediation lifecycle truth only.
- Master Data owns shared identity/reference truth only.
- Source modules own transaction / execution / calculation / posting source truth.

# ============================================================
# 4. NEXT NATURAL ACTION
# ============================================================

next_natural_action:
- Run/review integrated split verification report.
- Then either:
  - regenerate an upload-friendly compact pack, or
  - create Track F detailed remaining catalogs, or
  - start implementation-prep freeze for selected candidate cluster.

# ============================================================
