# ============================================================
# MASTER DATA / SOURCE MODULE REFERENCE MATRIX EXACT
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data
scope:
- all ERP source modules

purpose:
Provide exact source-module reference matrix for shared master usage, domain
extension ownership, correction routing, and forbidden ownership drift.

# ============================================================
# 1. MATRIX RULE
# ============================================================

matrix_rule:
- common_master_id identifies shared entity/reference
- domain_extension_id identifies module-owned extension
- transaction_id identifies module-owned business event
- correction must go to the owner of the changed meaning

# ============================================================
# 2. CUSTOMER / BUSINESS PARTNER
# ============================================================

shared_master:
- business_partner_core
- customer_core

owner:
- 52.master-data

domain_extensions:
- 03.crm owns customer relationship / interaction / lifecycle extension
- 01.sales owns quote / sales condition usage
- 04.order-management owns accepted order usage
- 05.billing owns billing customer invoice preference / billing usage
- 30.accounting owns accounting customer receivable posting setup where applicable

correction_routing:
- wrong customer identity / duplicate customer -> 52.master-data
- wrong customer relationship stage -> 03.crm
- wrong quote price condition -> 01.sales
- wrong order customer reference after acceptance -> 04.order-management correction workflow with 52 reference if identity issue
- wrong invoice customer billing data -> 05.billing or 52 depending identity vs billing extension
- wrong receivable posting -> 30.accounting

forbidden:
- sales order creating new customer identity without 52 workflow
- billing correcting customer golden record only inside invoice
- BI customer dimension merge replacing 52 duplicate resolution

# ============================================================
# 3. SUPPLIER / BUSINESS PARTNER
# ============================================================

shared_master:
- business_partner_core
- supplier_core

owner:
- 52.master-data

domain_extensions:
- 11.procurement owns supplier sourcing / evaluation / qualification extension
- 10.purchase owns supplier PO commercial terms usage
- 12.inventory consumes supplier reference for receipt lineage
- 30.accounting owns supplier/AP accounting usage where applicable

correction_routing:
- wrong supplier identity / duplicate supplier -> 52.master-data
- wrong supplier evaluation -> 11.procurement
- wrong PO supplier commercial terms -> 10.purchase
- wrong receipt source reference -> 12/13/10 depending actual issue
- wrong AP/accounting posting -> 30.accounting

forbidden:
- procurement supplier candidate becoming supplier core without 52 workflow
- purchase order correcting supplier identity in place without master correction when identity is wrong
- warehouse receiving creating supplier master from delivery label without 52 workflow

# ============================================================
# 4. ITEM / PRODUCT
# ============================================================

shared_master:
- item_core
- product_core

owner:
- 52.master-data

domain_extensions:
- 12.inventory owns stocking policy / inventory control extension
- 13.warehouse owns handling / warehouse operation extension
- 14.logistics owns shipping / handling / transport requirement usage
- 15.manufacturing owns production execution usage
- 16.production-planning owns planning policy / MRP usage where applicable
- 17.quality owns inspection specification / quality disposition rules
- 18.costing owns cost component / cost estimate basis
- 01.sales owns sales condition usage
- 10.purchase owns purchasing usage

correction_routing:
- wrong item identity / duplicate item -> 52.master-data
- wrong stocking policy -> 12.inventory
- wrong warehouse handling policy -> 13.warehouse
- wrong transport handling requirement -> 14.logistics
- wrong inspection specification -> 17.quality
- wrong cost component / standard cost -> 18.costing
- wrong BOM/routing/planning policy where module-owned -> 15/16 as designated

forbidden:
- inventory ledger creating item core directly
- warehouse task correcting item identity without 52 workflow
- costing standard cost record redefining item core
- quality inspection result replacing item master truth

# ============================================================
# 5. LOCATION / SITE / WAREHOUSE
# ============================================================

shared_master:
- location_core
- site_core
- address_core
- warehouse_reference_core where designated common

owner:
- 52.master-data unless warehouse operational master is explicitly owned by 13

domain_extensions:
- 13.warehouse owns bin / zone / warehouse task layout / physical operation extension
- 14.logistics owns route / delivery / carrier location usage
- 12.inventory owns inventory location balance usage
- 40.human-resources owns work location assignment usage
- 30.accounting owns location accounting mapping where applicable

correction_routing:
- wrong site/address identity -> 52.master-data
- wrong bin / zone / warehouse layout -> 13.warehouse
- wrong stock balance at location -> 12.inventory
- wrong delivery route/stop -> 14.logistics
- wrong employee work assignment location -> 40.human-resources

forbidden:
- warehouse bin correction changing common site identity
- logistics delivery address correction silently changing master address without 52 workflow
- inventory balance update creating new site identity

# ============================================================
# 6. ORGANIZATION / WORKER / HR
# ============================================================

shared_master:
- company/legal entity reference
- organization reference where common

owner:
- 52.master-data for common company/legal entity/reference
- 40.human-resources for worker master, employment, department assignment, position assignment

domain_extensions:
- 41.labor-management consumes HR worker profile for shift/attendance
- 42.payroll consumes HR payroll profile for payroll
- 31.management-accounting consumes responsibility center / org mapping where MA-owned
- 30.accounting consumes legal entity / accounting org mapping

correction_routing:
- wrong company/legal entity reference -> 52.master-data
- wrong worker identity/employment/assignment -> 40.human-resources
- wrong attendance -> 41.labor-management
- wrong payroll calculation -> 42.payroll
- wrong managerial segment mapping -> 31.management-accounting
- wrong accounting org mapping -> 30.accounting

forbidden:
- payroll changing worker master directly
- labor attendance activating worker employment status
- 52 changing worker attendance or payroll run
- BI HR dimension correction treated as HR master correction

# ============================================================
# 7. ACCOUNTING / TAX / CURRENCY / UOM
# ============================================================

shared_master:
- currency
- unit_of_measure
- tax_reference where common
- common fiscal calendar reference where common

owner:
- 52.master-data for common reference
- 30.accounting for ledger/chart/accounting close-specific setup
- 05.billing for billing tax application usage where applicable
- 18.costing for costing-specific UOM/cost usage where applicable

correction_routing:
- wrong currency/UOM code -> 52.master-data
- wrong exchange/accounting rate policy if accounting-owned -> 30.accounting
- wrong tax application on invoice -> 05.billing / 30.accounting depending source
- wrong accounting posting mapping -> 30.accounting
- wrong cost UOM conversion usage -> 18 or 52 depending common vs costing-specific

forbidden:
- invoice correcting common currency code
- accounting journal creating UOM master
- BI exchange conversion overriding accounting/currency reference

# ============================================================
# 8. MASTER CHANGE IMPACT ON SOURCE TRANSACTIONS
# ============================================================

rules:
- source transaction history is not silently rewritten by master changes
- source modules may store master version/effective-date references
- merge/split/deactivate must publish impact package
- source module must decide how open transactions are handled
- closed transactions preserve historical basis
- BI refreshes dimensions through snapshot process

open_transaction_handling_examples:
- continue with old master version
- require revalidation
- block new transactions
- allow only correction workflow
- remap extension reference after approval
- require source module exception review

# ============================================================
# 9. COMPLETION STATE
# ============================================================

completion_state:
- master/source reference matrix fixed
- customer/supplier/item/location/HR/accounting reference boundaries clarified
- correction routing fixed
- forbidden ownership drift clarified

# ============================================================
