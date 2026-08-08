# ============================================================
# ERP MRP PAID OPTION POSITIONING
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-921
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.mrp_paid_option.positioning
component: mrp-paid-option-positioning


# POSITIONING

MRP is the material planning paid option that manages:
- demand interpretation
- bill of materials structure
- net requirement calculation
- planned supply proposals
- purchase recommendations
- production recommendation basis
- material shortage visibility

Its design center is:
- requirement planning
- time-phased material need
- BOM-driven explosion
- supply proposal generation
- lead-time-aware planning
- planning exception handling


# NON POSITIONING

MRP is not:
- warehouse execution truth
- shipment orchestration layer
- supplier relationship network shell
- machine-floor execution system
- accounting or billing module

