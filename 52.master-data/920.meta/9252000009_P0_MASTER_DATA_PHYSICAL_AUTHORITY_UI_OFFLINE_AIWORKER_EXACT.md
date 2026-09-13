# P0 MASTER DATA PHYSICAL AUTHORITY / UI / OFFLINE /
# MULTILINGUAL / BUSINESS AIWORKER INTERFACE EXACT DESIGN

status: active
owner: Boss
module: 52.master-data
phase: P0_MASTER
design_authority: canonical

## 1. Physical authority

physical_canonical_schema:
- master_data

rules:
- 52.master-data owns shared master identity, golden record, shared reference
  truth, publication, correction, lifecycle, merge, split, and lineage.
- master_data is the physical canonical schema for shared ERP master truth.
- master must not remain a competing canonical master schema.
- source modules own transaction truth and module-specific extensions.
- DB implementation must follow canonical design.

shared_erp_identity:
- master_data.master_record.master_record_id

identity_rules:
- master_record_id is the shared ERP master identity.
- legacy IDs must not replace master_record_id as shared identity.
- domain core objects bind to master_record_id.
- domain core bindings must prevent duplicate master_record_id assignments.
- transaction references must preserve both shared identity and domain-type
  integrity.

## 2. P0 physical mapping

- item:
  logical: item_core_master
  physical: master_data.item_core

- product:
  logical: product_core_master
  physical: master_data.product_core

- sku:
  logical: item_identifier
  physical: master_data.master_identifier
  rule: identifier_type = SKU
  note: SKU is not an independent shared master.

- unit_of_measure:
  logical: unit_of_measure_master
  physical: master_data.unit_of_measure

- unit_of_measure_conversion:
  logical: unit_of_measure_conversion
  physical: master_data.unit_of_measure_conversion
  status: physical_object_required

- warehouse:
  logical: warehouse_reference_master
  physical: master_data.warehouse_reference
  status: physical_object_required

- location:
  logical: location_core_master
  physical: master_data.location_core

- supplier:
  logical: supplier_core_master
  physical: master_data.supplier_core

- customer:
  logical: customer_core_master
  physical: master_data.customer_core

## 3. Warehouse boundary

rules:
- master_data owns shared warehouse/location reference identity.
- 13.warehouse owns warehouse operational layout and execution.
- shelf, bin, zone, task, pick, putaway, operational capacity, and operational
  state are 13.warehouse concerns unless explicitly promoted by canonical
  design.
- legacy master.shelf must not be copied into master_data merely because it is
  located under the legacy master schema.

## 4. Legacy physical structures

legacy_noncanonical_objects:
- master.item
- master.warehouse
- master.storage_location
- master.shelf
- core.uom
- core.uom_conversion
- sales.item
- sales.customer
- purchase.supplier_master

rules:
- these objects must not remain competing shared-master truth.
- verified zero-row objects need no business-data migration.
- all FK/view/API/routine dependencies must be redirected before retirement.
- valid source-module extension attributes may remain under the owning module.
- DROP CASCADE is prohibited as a migration shortcut.

## 5. P0 reason ownership

- stock_movement_reason:
  owner_module: 12.inventory
  classification: domain_specific_code_set

- inventory_adjustment_reason:
  owner_module: 12.inventory
  classification: domain_specific_code_set

- return_reason:
  owner_module: 04.order-management
  classification: domain_specific_code_set

rules:
- core.reason_code_master is not the canonical code set for these three
  business reasons.
- common code sets may belong to 52 only when genuinely cross-domain.
- domain-specific code sets remain owned by their source module.
- owner_module must be explicit.

## 6. Public schema

public_schema_policy:
- VIEW_ONLY

allowed:
- ordinary read-only SQL views

prohibited:
- canonical tables
- sequences
- functions
- procedures
- trigger functions
- writable-view trigger bridges
- materialized views
- canonical business truth

rules:
- public views are compatibility/read exposure only.
- mutations execute through owning schemas/interfaces.
- public views must not become alternate sources of truth.
- existing non-view public objects are migration/retirement targets.
- dependency removal must be explicit.
- DROP CASCADE is prohibited.

## 7. Multilingual

multilingual_policy:
- REQUIRED

rules:
- all user-facing UI must support multiple locales.
- labels, messages, menus, validation text, status text, help text, and other
  user-facing copy must use localization resources.
- user-facing language strings must not be hard-coded in implementation.
- locale selection and fallback must be deterministic.
- ja-JP and en-US are valid examples, not an exclusive locale list.
- IDs, codes, relationships, and master identity remain language-neutral.
- localized display data must never create duplicate master identity.
- locale resources required by offline screens must be cacheable.

## 8. HTML UI / CommonOS

primary_screen_canon:
- HTML

rules:
- ERP shared UI follows CommonOS.
- HTML is the primary business-screen canon.
- smartphone, tablet, and PC must not maintain separate business canons.
- native host/WebView shells may exist but do not replace HTML screen canon.
- domain truth remains owned by ERP domain modules.

## 9. Offline

offline_policy:
- offline_first
- local_queue
- online_sync

offline_read:
- synchronized master snapshots may be read offline.
- cache must retain master identity, version/effective basis, company scope,
  and synchronization metadata.

offline_write:
- offline/local state is not authoritative master truth.
- create/change/deactivate/merge/split actions initiated offline are queued
  intents/change requests.
- authoritative validation and mutation occur server-side after sync.
- duplicate, effective-date, authorization, ownership, approval, and conflict
  checks remain mandatory.

ui_state:
- sync state visible
- pending state visible
- retry/failure state visible
- conflict state visible
- queued intent must not be shown as already-authoritative server truth

## 10. Business schema / AIWorker interface

business_aiworker_interface:
- REQUIRED

ownership:
- master_data owns shared ERP master truth.
- business schema / Business AIWorker owns its BusinessOS operational truth.
- AIWorker does not own ERP shared master identity.
- master_data does not own AIWorker assignment, capability, rank, slot,
  reservation, or company worker-operation truth.

read_interface:
- authorized Business AIWorker consumers may consume published master
  references.
- master_record_id, company scope, version/effective basis, lifecycle status,
  and lineage must be preserved.
- consumer cache/projection is not canonical truth.

write_interface:
- AIWorker must not directly mutate master_data canonical tables.
- an authorized AIWorker may propose create/correction/deactivation requests.
- proposals enter the Master Data governance/change path.
- AI-generated proposal is not an applied master change.

publication_interface:
- master publication may target business/AIWorker consumers.
- acknowledgement/rejection must preserve company scope and lineage.
- extension conflicts are corrected by the extension owner.
- master errors are corrected by 52.master-data.

physical_interface:
- existing business-schema / AIWorker DB objects must be discovered and mapped
  before implementation mutation.
- replacement physical names must not be invented without mapping.
- direct cross-schema writes are prohibited unless explicitly defined by a
  later canonical contract.

## 11. Security / audit

rules:
- company/tenant scope is mandatory.
- cross-company leakage is prohibited.
- server-side authorization is authoritative.
- offline cache must remain within authorized company/user scope.
- create/change/deactivate/merge/split/publication keeps complete audit and
  lineage.
- AI-assisted proposals remain distinguishable from approved/applied changes.

## 12. Implementation order

1. canonical authority update
2. DB physical mapping verification
3. create missing master_data physical objects
4. enforce domain-core master_record_id integrity
5. redirect dependent foreign keys
6. preserve valid source-module extensions
7. convert public exposure to view-only policy
8. retire legacy empty master objects explicitly
9. retire master schema only when dependency count reaches zero
10. implement HTML/multilingual/offline behavior in 04
11. align Business AIWorker interface to mapped business-schema objects
12. UI-centered/offline/sync acceptance

## 13. Forbidden shortcuts

- dual canonical truth in master and master_data
- DB-first redesign followed by canonical backfill
- independent SKU master without canonical change
- moving shelf/bin/zone into master_data by name similarity
- treating core.reason_code_master as the three P0 domain business reasons
- writable compatibility logic in public
- functions or trigger functions in public
- direct AIWorker mutation of master_data
- treating queued offline state as authoritative
- hard-coded user-facing language strings
- DROP CASCADE for legacy cleanup

## 14. Final decision

- physical shared-master authority: master_data
- shared ERP identity: master_record_id
- public schema: ordinary read-only views only
- primary screen canon: CommonOS-aligned HTML
- multilingual: required
- offline-first/local-queue/online-sync: required
- Business AIWorker integration: required through explicit controlled boundary
