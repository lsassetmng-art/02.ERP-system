# ============================================================
# FIXED ASSETS MODULE CANONICAL MODEL
# ============================================================

status: draft-exact-design
module: 33.fixed-assets

Entities:
- fa_asset_register
- fa_capitalization_event
- fa_depreciation_schedule
- fa_disposal_event
- fa_asset_close_control

Invariant:
- asset-accounting lifecycle remains traceable from capitalization through disposal
