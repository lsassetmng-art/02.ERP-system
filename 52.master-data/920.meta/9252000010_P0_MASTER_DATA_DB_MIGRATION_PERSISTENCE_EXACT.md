# P0 MASTER DATA DB MIGRATION PERSISTENCE EXACT

status: canonical_exact
owner: Boss
module: 52.master-data
scope: P0 master data DB migration persistence
design_authority: CANONICAL
implementation_change_policy: CANONICAL_DESIGN_UPDATE_REQUIRED
db_change_policy: EXPLICIT_GO_REQUIRED

---

## 1. Purpose

This exact defines how the already accepted P0 master-data database state
shall be persisted into implementation source.

This file does not apply DDL.

This file does not reopen the accepted P0 physical authority decision.

This file does not redefine business ownership.

The purpose is to make the accepted database transition reproducible,
reviewable, adoption-safe, and source-controlled without treating the live
database itself as design authority.

Canonical design remains the authority.

---

## 2. Authority chain

The following order applies:

1. current canonical design under 02.ERP-system
2. P0 physical authority exact
3. this migration persistence exact
4. implementation persistence under 04.ERP-development
5. live database

The primary P0 physical authority exact is:

- 52.master-data/920.meta/
  9252000009_P0_MASTER_DATA_PHYSICAL_AUTHORITY_UI_OFFLINE_AIWORKER_EXACT.md

The accepted canonical Git baseline for this exact is:

- commit:
  1ac3cf435743826d09acf573f2c650ebd165b111

The live database does not override canonical design.

A difference found in the live database must be classified and resolved.
It must not silently redefine this exact.

---

## 3. Historical DDL proposal status

The following implementation-prep material remains historical reference:

- 52.master-data/930.implementation-prep-freeze/030.db/
  032_DB_DDL_PROPOSAL_DRAFT.sql

Its status is:

- reference_only: YES
- executable_authority: NO
- direct_apply: PROHIBITED

The historical proposal predates the final P0 physical-authority cutover.

It must not be copied unchanged into executable implementation.

Safety concepts from the historical freeze remain valid where they do not
conflict with newer canonical exacts, including:

- DB review before apply
- explicit apply gate
- precondition review
- rollback planning
- DATABASE_URL use
- one controlled psql execution
- no uncontrolled destructive execution

Where the historical draft conflicts with newer canonical exacts,
the newer canonical exact controls.

---

## 4. Implementation persistence root

The P0 persistence bundle shall be rooted at:

- /data/data/com.termux/files/home/04.ERP-development/
  52.master-data/db

The canonical relative implementation root is:

- 04.ERP-development/52.master-data/db

No Flyway, Liquibase, Supabase migration runner, dbmate, or other migration
framework shall be introduced for P0 unless separately canonicalized.

P0 execution uses PostgreSQL psql through:

- DATABASE_URL

Execution shall use one controlled psql invocation for each DB execution
unit.

No credentials or DATABASE_URL contents may be committed or written to logs.

---

## 5. Required P0 persistence bundle

The initial implementation persistence bundle shall contain:

- 04.ERP-development/52.master-data/db/README.md

- 04.ERP-development/52.master-data/db/p0/
  001_P0_MASTER_DATA_FORWARD.sql

- 04.ERP-development/52.master-data/db/p0/
  002_P0_MASTER_DATA_ADOPTION_VERIFY.sql

- 04.ERP-development/52.master-data/db/p0/
  apply-p0-master-data.sh

These artifacts form one P0 persistence bundle.

The bundle is implementation evidence and execution material.

It does not become design authority.

---

## 6. Bundle responsibilities

### 6.1 README.md

README.md shall define:

- canonical source references
- required execution environment
- DATABASE_URL requirement
- exact P0 pre-state/post-state model
- apply procedure
- adoption procedure
- verification procedure
- failure behavior
- no-auto-retry rule
- rollback boundary
- log behavior
- explicit GO requirement

### 6.2 001_P0_MASTER_DATA_FORWARD.sql

The forward SQL shall persist the accepted P0 transition from the known
pre-P0 ERP database baseline to the accepted P0 post-state.

It shall:

- use an explicit transaction
- use ON_ERROR_STOP semantics through its psql execution
- validate preconditions before destructive changes
- fail on unexpected partial state
- use no DROP CASCADE
- preserve required dependent views and properties
- preserve approved security barriers
- preserve object ownership semantics
- preserve shared master identity semantics
- verify critical invariants before COMMIT

The forward SQL is not to be executed against the currently accepted live
database merely to prove that the file exists.

### 6.3 002_P0_MASTER_DATA_ADOPTION_VERIFY.sql

The adoption verification SQL shall be READ ONLY.

It shall verify that an already-upgraded database matches the accepted P0
post-state.

It shall perform no repair.

It shall perform no INSERT, UPDATE, DELETE, DDL, GRANT, REVOKE, or mutation.

It shall be valid both:

- for current-live-state adoption
- for post-forward verification

### 6.4 apply-p0-master-data.sh

The apply wrapper shall not be a generic migration framework.

It is a P0-specific controlled execution wrapper.

It shall classify the target DB into exactly one of:

- PRE_P0_EXACT
- P0_POST_STATE
- UNKNOWN_OR_PARTIAL

Behavior shall be:

- PRE_P0_EXACT:
  explicit DB apply GO required;
  execute forward migration once;
  execute adoption verification;
  PASS only if verification passes.

- P0_POST_STATE:
  do not execute forward DDL;
  execute READ ONLY adoption verification;
  report ADOPTED_ALREADY_APPLIED only if verification passes.

- UNKNOWN_OR_PARTIAL:
  fail closed;
  execute no repair;
  require separate investigation and GO.

Automatic retry is prohibited.

---

## 7. Current live database adoption rule

The current accepted live database is already P0 post-state.

Therefore the first implementation persistence registration for the current
environment shall use:

- adoption verification
- not forward DDL replay

The persistence implementation must never destructively replay the P0
cutover against the current live DB merely because the migration artifact
was created later than the live mutation.

For the current accepted environment:

current_environment_initial_mode:
  P0_POST_STATE_ADOPTION

forward_replay_on_current_live_db:
  PROHIBITED

adoption_verification:
  REQUIRED

---

## 8. Re-run semantics

Idempotency does not mean silently doing nothing.

Re-run behavior shall be state-aware.

If the DB is already in accepted P0 post-state:

- verify the complete accepted post-state
- report PASS only when verification succeeds
- perform no mutation

If the DB is in the exact approved pre-state:

- forward execution may occur only with explicit DB GO

If the DB is neither exact pre-state nor accepted post-state:

- fail
- do not guess
- do not repair automatically
- do not use CASCADE
- do not partially continue

---

## 9. Transaction and rollback boundary

The forward migration shall use one transaction for each atomic change unit.

Before COMMIT:

- any failure causes transaction rollback
- no partial acceptance is allowed

After COMMIT:

- automatic reverse migration is prohibited
- legacy authority shall not be automatically resurrected
- no automatic DOWN migration shall be generated for P0

A post-commit defect requires:

1. READ ONLY investigation
2. canonical decision if design changes
3. explicit repair GO
4. forward repair changeset

Rollback means transaction rollback before commit unless an explicit,
separately reviewed compensating change is authorized.

---

## 10. P0 accepted shared authority

The persistence bundle shall reproduce and verify the following authority.

product:
  physical_authority: master_data.product_core

item:
  physical_authority: master_data.item_core
  shared_erp_identity: master_record_id

sku:
  physical_authority: master_data.master_identifier
  identifier_type: SKU
  independent_master: NO

uom:
  physical_authority: master_data.unit_of_measure

unit_conversion:
  physical_authority: master_data.unit_of_measure_conversion

warehouse:
  physical_authority: master_data.warehouse_reference
  operational_layout_owner: 13.warehouse

location:
  physical_authority: master_data.location_core

supplier:
  physical_authority: master_data.supplier_core

customer:
  physical_authority: master_data.customer_core

Shared ERP master identity remains:

- master_data.master_record.master_record_id

Source-module extensions do not become shared identity authority.

---

## 11. P0 reason ownership

The persistence bundle shall preserve the following business reason
ownership.

stock_movement_reason:
  owner_module: 12.inventory
  physical_object: inventory.stock_movement_reason
  classification: domain_specific_code_set

inventory_adjustment_reason:
  owner_module: 12.inventory
  physical_object: inventory.inventory_adjustment_reason
  classification: domain_specific_code_set

return_reason:
  owner_module: 04.order-management
  physical_object: sales.return_reason
  classification: domain_specific_code_set

The location of a persistence artifact does not transfer logical ownership
of these objects to 52.master-data.

core.reason_code_master remains:

- generic mutation/audit reason code authority
- separate from the three P0 business reason code sets

---

## 12. Public schema persistence rule

The accepted public schema contract is:

PUBLIC_SCHEMA_POLICY:
  VIEW_ONLY

Allowed:

- ordinary read-only SQL VIEW

Prohibited in public:

- TABLE
- PARTITIONED TABLE
- MATERIALIZED VIEW
- SEQUENCE
- FOREIGN TABLE
- FUNCTION
- PROCEDURE
- trigger function
- user trigger
- writable compatibility bridge
- explicit DML grant on public views

The P0 accepted public post-state includes:

public_views:
  131

public_non_view_relations:
  0

public_routines:
  0

public_user_triggers:
  0

public_view_dml_grants:
  0

These counts are an accepted P0 baseline.

Future legitimate canonical changes may change the number of views,
but must not silently weaken VIEW_ONLY.

---

## 13. Integration interface persistence

The former public interface functions were relocated to:

- integration schema

The accepted P0 relocation count is:

- 29 functions

The migration shall preserve function identity/dependencies where the
accepted transition used ALTER FUNCTION ... SET SCHEMA.

The migration shall preserve:

- integration.my_company_id()

The following view security property shall remain intact:

- sales.v_order_header_read
- security_barrier=true

The view shall resolve company scope through:

- integration.my_company_id()

No compatibility function shall be recreated in public merely to preserve
an old public RPC name.

---

## 14. Legacy authority removal

The accepted P0 post-state does not contain these former authority objects:

- sales.customer
- purchase.supplier_master
- sales.item
- core.uom
- core.uom_conversion
- legacy master schema

The persistence bundle shall not recreate them as canonical authority.

No DROP CASCADE is permitted to remove legacy authority.

Every destructive removal must be preceded by exact dependency and state
preconditions.

Unexpected dependencies cause failure.

---

## 15. Item consumer identity

The accepted P0 item cutover uses shared UUID identity.

Non-staging item consumers migrated by P0 shall reference:

- master_data.item_core(master_record_id)

The accepted cutover verified 26 explicit consumer FKs added during the
item cutover.

The final target may contain additional legitimate item_core references
created by other accepted structures; therefore verification shall validate
the required consumer set and semantics, not rely only on a global count.

Staging/raw-input structures remain unresolved-input boundaries where
canonical identity may not yet exist.

They shall not be blindly constrained merely because a field is named
item_id or uom.

---

## 16. UOM and domain-specific FK integrity

The persistence bundle shall preserve domain-specific FK targets including:

- master_data.item_core.base_uom_record_id
  -> master_data.unit_of_measure(master_record_id)

- master_data.product_core.default_item_record_id
  -> master_data.item_core(master_record_id)

- master_data.location_core.parent_location_record_id
  -> master_data.location_core(master_record_id)

The persisted implementation must preserve type-specific identity
constraints where canonical master identity is consumed.

Generic master_record FK use shall not replace a known type-specific target
without a canonical design decision.

---

## 17. Operational warehouse IDs

The following accepted operational IDs were intentionally not converted by
P0:

- manufacturing.manufacturing_execution.warehouse_id
- purchase.purchase_receipt.warehouse_id

Their accepted physical type at P0 cutover was bigint.

They are not to be mutated merely because their column name is
warehouse_id.

Their future resolution belongs to their operational/module design phase.

P0 migration persistence shall verify that it does not accidentally convert
these fields as part of shared warehouse-reference persistence.

---

## 18. RLS persistence

RLS state shall be persisted exactly enough to preserve the accepted
security boundary.

P0 shall not invent permissive policies merely to make implementation
testing easier.

Tables accepted with RLS enabled and no policy remain deny-by-default for
non-bypass roles until a separately canonicalized permission/write path is
introduced.

This includes newly introduced P0 structures where applicable.

Policy widening requires:

- canonical design
- authorization model review
- explicit DB GO

Migration persistence is not authority to broaden permissions.

---

## 19. No hidden data migration

P0 persistence shall not invent data values.

For a legacy object containing data:

- migration must define exact mapping
- unresolved mapping causes STOP

For structures accepted as empty at the original cutover:

- the persisted forward migration may rely on emptiness only when the
  precondition explicitly verifies zero rows

NULL-casting or structural replacement based on historical emptiness is
permitted only where the accepted P0 transition did so and the forward
precondition proves the same baseline.

No silent truncation is permitted.

---

## 20. Greenfield boundary

This P0 persistence bundle represents the transition from the known ERP
pre-P0 baseline to the accepted P0 post-state.

It is not, by itself, the complete greenfield bootstrap for an empty ERP
database.

greenfield_full_bootstrap:
  OUTSIDE_THIS_CHANGE_UNIT

If a full empty-database bootstrap is required, it must be separately
canonicalized or composed from the complete approved ERP schema baseline
plus this P0 persistence contract.

The P0 migration shall not pretend an unknown database is a supported
baseline.

---

## 21. Migration history and evidence

P0 shall not introduce a new database migration-ledger table without a
separate canonical decision.

For this P0 persistence unit, evidence consists of:

- canonical Git commit
- implementation Git commit
- exact migration artifact hashes
- explicit execution/adoption result
- ERP_logs evidence
- verified DB post-state

migration_ledger_table:
  NOT_INTRODUCED_BY_P0

A future ERP-wide migration ledger may be designed separately.

The absence of a ledger does not permit unverified repeat execution.

---

## 22. Logging requirements

Execution/adoption logs shall record at minimum:

- timestamp
- canonical reference
- implementation artifact hash
- execution mode
- pre-state classification
- whether DB mutation occurred
- whether COMMIT occurred
- verification result
- post-state result
- retry count
- safety result

Logs shall not contain:

- DATABASE_URL contents
- passwords
- tokens
- secrets

Automatic retry count shall remain zero unless a future canonical rule
explicitly changes that policy.

---

## 23. Apply gate

Forward DB mutation requires an explicit DB GO.

The existence of:

- a canonical file
- an implementation SQL file
- a clean lint result
- a successful adoption verification

does not itself authorize DB mutation.

DB_CHANGE_POLICY:
  EXPLICIT_GO_REQUIRED

Push, stage, and commit authorization are separate from DB apply
authorization.

No GO is transferable between these action classes unless explicitly
stated.

---

## 24. Implementation change gate

After this canonical exact is accepted, implementation work may create the
P0 persistence bundle only under the exact reviewed scope.

04 implementation must not:

- redesign P0 authority
- change owner_module
- broaden RLS permissions
- recreate public writable bridges
- recreate legacy shared master authority
- convert unrelated operational warehouse IDs
- mutate live DB while merely creating persistence source

Implementation creation and live DB application are separate gates.

---

## 25. Acceptance criteria for 04 persistence

P0 migration persistence may be accepted only when all are true:

1. required bundle files exist
2. no migration framework was silently introduced
3. forward SQL matches current canonical authority
4. forward SQL contains exact precondition protection
5. no DROP CASCADE exists
6. adoption verification is READ ONLY
7. current accepted live DB passes adoption verification
8. current live DB was not replay-mutated during adoption
9. public VIEW_ONLY is verified
10. P0 #1 through #11 authority is verified
11. integration function relocation is verified
12. security_barrier preservation is verified
13. generic reason authority remains separate
14. staging/raw-input boundaries remain unchanged
15. operational bigint warehouse IDs remain unchanged
16. RLS is not broadened
17. artifact hashes are logged
18. no secret is logged
19. 02 canonical is not mutated by the implementation action
20. Git stage/commit/push occur only under their own GO

---

## 26. P0 closure boundary

P0 design and accepted live DB may remain closed while implementation
persistence is being added.

The persistence task is representation of the already accepted state.

It is not permission to reopen P0 business semantics.

State model:

P0_CANONICAL_DESIGN:
  FINAL

P0_LIVE_DB:
  ACCEPTED

P0_DB_MIGRATION_PERSISTENCE:
  OPEN_UNTIL_04_ACCEPTANCE

P1_PROCUREMENT_QUANTITY_GATE:
  HOLD_UNTIL_P0_PERSISTENCE_ACCEPTED

After 04 persistence acceptance:

P0_DB_MIGRATION_PERSISTENCE:
  ACCEPTED

P1_PROCUREMENT_QUANTITY_GATE:
  MAY_OPEN_SUBJECT_TO_NORMAL_GO

---

## 27. Prohibited shortcuts

The following are prohibited:

- treating live DB as canonical design
- copying historical 032 draft as executable authority
- replaying destructive P0 cutover on the accepted live DB
- DROP CASCADE
- automatic repair of unknown DB state
- automatic retry
- automatic down migration after commit
- recreating public functions for compatibility
- recreating public write triggers
- restoring legacy master authority
- inventing RLS allow policies
- changing domain ownership from implementation convenience
- broad staging with git add .
- broad staging with git add -A
- force push
- history rewrite
- changing unrelated dirty 04 files
- modifying the safety HOLD artifact

---

## 28. Next implementation step

After this exact is reviewed and committed, the next safe implementation
step is:

P0_04_DB_MIGRATION_PERSISTENCE_IMPLEMENTATION

That implementation shall create persistence source only.

Current-live DB mutation shall remain:

NO

during initial 04 bundle creation and adoption verification.
