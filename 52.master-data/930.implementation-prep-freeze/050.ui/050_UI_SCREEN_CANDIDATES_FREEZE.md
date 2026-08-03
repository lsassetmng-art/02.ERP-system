# ============================================================
# 52.master-data UI SCREEN CANDIDATES FREEZE
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data
phase: implementation-prep-freeze
commonos_usage: true
db_apply_status: STOPPED

# ============================================================
# 1. UI PRINCIPLES
# ============================================================

ui_principles:
- Use CommonOS shared UI foundation where possible.
- ERP dense variant may be used for data-heavy screens.
- UI is not source of truth.
- UI calls API / application layer.
- UI must show lineage/version/effective dates.
- UI must distinguish draft/current/historical versions.
- UI must show publication/acknowledgement state.
- UI must not perform destructive delete.

# ============================================================
# 2. TOP-LEVEL SCREEN CANDIDATES
# ============================================================

top_level_screens:
- Master Data Dashboard
- Business Partner / Customer / Supplier Master
- Item / Product / UOM Master
- Location / Site / Warehouse Reference
- Company / Legal Entity / Organization Reference
- Publication Packages
- Consumer Acknowledgements
- Impact Reviews
- Data Quality / Duplicate Candidates
- Master Change History

# ============================================================
# 3. BUSINESS PARTNER SCREEN CANDIDATES
# ============================================================

business_partner_screens:
- Business Partner List
- Business Partner Detail
- Business Partner Draft Create
- Customer Role Detail
- Supplier Role Detail
- Contact Person Detail
- Identifier Management
- Address / Contact Point References
- Merge / Split Lineage View

# ============================================================
# 4. ITEM / PRODUCT SCREEN CANDIDATES
# ============================================================

item_product_screens:
- Item List
- Item Detail
- Item Draft Create
- Product List
- Product Detail
- Item/Product Relationship View
- UOM List
- UOM Conversion Detail
- Item Identifier Management

# ============================================================
# 5. LOCATION / ORGANIZATION SCREEN CANDIDATES
# ============================================================

location_org_screens:
- Address List / Detail
- Location List / Detail
- Site List / Detail
- Plant Reference List / Detail
- Warehouse Reference List / Detail
- Company Reference List / Detail
- Legal Entity List / Detail
- Organization Unit Tree
- Department / Cost Center / Profit Center Detail

# ============================================================
# 6. PUBLICATION SCREEN CANDIDATES
# ============================================================

publication_screens:
- Publication Package List
- Publication Package Detail
- Publication Line Detail
- Target Module Acknowledgement Status
- Consumer Rejection / Warning Detail
- Impact Review List
- Impact Review Detail

# ============================================================
# 7. COMMONOS COMPONENT CANDIDATES
# ============================================================

commonos_component_candidates:
- shell.erp_dense
- list.erp_dense
- detail.erp_dense
- form.erp_dense
- search.erp_dense
- status_badge.master_status
- version_timeline
- effective_date_panel
- lineage_panel
- publication_status_panel
- acknowledgement_matrix
- impact_review_table
- validation_error_panel

# ============================================================
# 8. UI STATE CANDIDATES
# ============================================================

ui_state_candidates:
- loading
- empty
- validation_error
- duplicate_warning
- draft_saved
- activation_pending
- active
- inactive
- superseded
- publication_pending
- publication_acknowledged
- impact_review_required
- read_only_historical

# ============================================================
# 9. NON-V1 UI
# ============================================================

non_v1_ui:
- external import wizard
- AI duplicate resolution assistant
- bank secret setup
- high-volume master batch correction
- advanced graph relationship explorer
- external connector monitor

# ============================================================
# 10. COMPLETION STATE
# ============================================================

completion_state:
- UI screen candidates frozen.
- CommonOS component usage identified.
- UI implementation remains future work.

# ============================================================
