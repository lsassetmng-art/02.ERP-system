# ============================================================
# ERP UPLOAD-FRIENDLY SOURCE MANIFEST
# ============================================================

status: active
owner: Boss
prepared_by: Zero
generated_at: 2026-04-28 19:50:31 +0900
purpose:
Map upload-friendly compact files to detailed source docs.

compact_files:
- 000_ERP_UPLOAD_FRIENDLY_PACK_INDEX.md
- 010_ERP_CROSS_MODULE_COMPACT.md
- 100_ERP_TRACK_A_PRODUCTION_SIDE_COMPACT.md
- 200_ERP_TRACK_B_FINANCE_SIDE_COMPACT.md
- 300_ERP_TRACK_C_COMMERCIAL_SIDE_COMPACT.md
- 400_ERP_TRACK_D_MASTER_DATA_COMPACT.md
- 900_ERP_TRACK_E_GAP_AND_IMPLEMENTATION_PREP_COMPACT.md

detailed_integrated_sources:
- ../000_ERP_INTEGRATED_CANONICAL_INDEX.md
- ../010_ERP_CROSS_MODULE_BOUNDARY_INTEGRATED.md
- ../100_ERP_TRACK_A_PRODUCTION_SIDE_INTEGRATED.md
- ../200_ERP_TRACK_B_FINANCE_SIDE_INTEGRATED.md
- ../300_ERP_TRACK_C_COMMERCIAL_SIDE_INTEGRATED.md
- ../400_ERP_TRACK_D_MASTER_DATA_CATALOG_INTEGRATED.md
- ../900_ERP_TRACK_E_CURRENT_STATE_AND_GAP_INTEGRATED.md
- ../910_ERP_IMPLEMENTATION_PREP_CANDIDATE_LEDGER.md

canonical_source_root:
- ~/02.ERP-system

implementation_root:
- ~/04.ERP-development

notes:
- This upload-friendly pack is a compact navigation/reference layer.
- Do not treat compact pack as replacement for exact design docs.
- Use detailed module docs when exact payload/object definitions are needed.

# ============================================================
