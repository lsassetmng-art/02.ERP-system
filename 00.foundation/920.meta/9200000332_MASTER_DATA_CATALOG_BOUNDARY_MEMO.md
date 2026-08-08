# ============================================================
# ERP MASTER DATA CATALOG BOUNDARY MEMO EXACT
# Track D
# ============================================================

status: active
owner: Boss
prepared_by: Zero
track: Track D
scope:
- 52.master-data
- all ERP source modules
- 03.crm
- 02.sfa
- 01.sales
- 10.purchase
- 11.procurement
- 12.inventory
- 13.warehouse
- 14.logistics
- 15.manufacturing
- 16.production-planning
- 17.quality
- 18.costing
- 19.asset-management
- 30.accounting
- 33.fixed-assets
- 34.cash-management
- 40.human-resources
- 41.labor-management
- 42.payroll
- 60.business-intelligence

purpose:
Fix concrete master catalog boundaries after Tracks A/B/C so all ERP source
modules reference shared master identity consistently without letting
52.master-data absorb domain extensions or transaction truth.

# ============================================================
# 1. CORE PRINCIPLE
# ============================================================

core_principle:
- 52.master-data owns shared identity/reference catalogs.
- Source modules own domain extensions, business transactions, executions,
  calculations, postings, approvals, and operational decisions.
- Master catalogs are identity/reference truth.
- Master catalogs are not transaction truth.
- Master version/effective-date/lineage must be preserved.
- Merge/split/deactivation must not silently rewrite historical source records.
- BI consumes master snapshots only.

# ============================================================
# 2. CATALOGS FIXED BY TRACK D
# ============================================================

catalogs:
- business_partner_customer_supplier_contact_catalog
- item_product_uom_catalog
- location_site_address_warehouse_reference_catalog
- company_legal_entity_organization_reference_catalog

# ============================================================
# 3. OWNERSHIP SUMMARY
# ============================================================

ownership_summary:
- 52 owns shared customer/supplier/business partner/contact identity.
- 52 owns shared item/product/UOM identity.
- 52 owns shared location/site/address identity.
- 52 owns company/legal entity/common organization references.
- CRM owns relationship/account/contact interaction extension.
- SFA owns lead/opportunity/pipeline truth.
- Sales owns quote/price/discount/promotion truth.
- Purchase/procurement own supplier commercial/sourcing truth.
- Inventory owns stock ledger and stocking policy extension.
- Warehouse owns bin/zone/task/operation extension.
- Logistics owns delivery/route/carrier execution extension.
- Manufacturing owns production execution truth.
- Quality owns inspection/disposition truth.
- Costing owns cost calculation truth.
- Accounting owns GL/subledger truth.
- HR owns worker/employment/assignment truth where HR-specific.
- Payroll owns payroll calculation truth.
- BI owns projection only.

# ============================================================
# 4. SOURCE EXTENSION RULE
# ============================================================

source_extension_rule:
- A source extension may reference a 52 master_record_id.
- A source extension may store module-specific attributes.
- A source extension must not redefine shared identity.
- A source extension must not become a duplicate master.
- If common identity is wrong, route correction to 52.
- If module-specific policy/state is wrong, correct in source module.

# ============================================================
# 5. VERSION / EFFECTIVE DATE RULE
# ============================================================

version_rule:
- Material master changes create a new version.
- Effective dates must be retained.
- Historical transactions must remain explainable using historical master
  version/effective-date basis.
- Deactivation blocks future use where policy requires but does not delete
  history.
- Merge/split preserves old identifiers and cross references.

# ============================================================
# 6. FORBIDDEN SHORTCUTS
# ============================================================

forbidden_shortcuts:
- CRM creating shared customer identity outside 52 workflow
- Purchase creating supplier identity outside 52 workflow
- Inventory creating item identity outside 52 workflow
- Warehouse creating common site/location identity outside 52 workflow
- Accounting creating legal entity identity outside 52 workflow
- Payroll creating worker identity inside 52 when HR owns worker truth
- 52 editing quote/order/invoice/PO/stock ledger/journal/payroll directly
- Master merge silently rewriting source transaction history
- Master deactivation deleting source records
- BI dimension merge treated as master merge
- Approval decision treated as master update without 52 apply step
- Audit finding treated as master correction without 52/source correction workflow

# ============================================================
# 7. DECISION TEST
# ============================================================

decision_tests:
- If it is shared identity/reference used across modules, 52.master-data owns it.
- If it is relationship/commercial/operational/accounting/payroll transaction,
  source module owns it.
- If it is module-specific setup/policy/state, source module owns extension.
- If it is approval decision, 50.approval owns it.
- If it is audit finding, 51.audit owns it.
- If it is dashboard or dimension projection, 60.business-intelligence owns it.

# ============================================================
# 8. COMPLETION STATE
# ============================================================

completion_state:
- Track D catalog boundary fixed.
- Shared master vs source extension separation fixed.
- Version/effective-date/lineage rule fixed.
- Master correction shortcuts forbidden.

# ============================================================
