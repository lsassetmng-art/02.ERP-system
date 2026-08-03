# ============================================================
# 52.master-data RLS / AUTHORIZATION CHECKLIST FREEZE
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data
phase: implementation-prep-freeze
db_apply_status: STOPPED

# ============================================================
# 1. AUTHORIZATION PRINCIPLES
# ============================================================

authorization_principles:
- All master records are company-scoped.
- Read access and write access must be separated.
- Draft/update/activate/deactivate/publication actions require explicit permission.
- Source modules may read published/active master references.
- Source modules may not directly edit master records unless authorized through 52 workflow.
- Approval decision alone does not mutate master data.
- Audit finding alone does not mutate master data.

# ============================================================
# 2. ROLE CANDIDATES
# ============================================================

role_candidates:
- master_data_reader
- master_data_editor
- master_data_reviewer
- master_data_approver
- master_data_publisher
- master_data_admin
- source_module_consumer
- BI_readonly_consumer
- audit_readonly_consumer
- approval_reference_consumer

# ============================================================
# 3. PERMISSION CANDIDATES
# ============================================================

permission_candidates:
- master.read
- master.search
- master.draft.create
- master.draft.update
- master.version.create
- master.activate
- master.deactivate
- master.identifier.manage
- master.role.manage
- master.publication.create
- master.publication.publish
- master.publication.acknowledge
- master.impact_review.create
- master.BI_snapshot.read
- master.audit.read

# ============================================================
# 4. RLS POLICY CANDIDATE RULES
# ============================================================

rls_policy_candidate_rules:
- company_id must match actor company scope.
- inactive/deprecated records may be read if historical reference access is allowed.
- write operations require explicit permission.
- publication acknowledgement requires target module permission.
- BI consumers are read-only.
- audit consumers are read-only.
- source module consumers cannot edit 52 master directly by default.
- service role must be tightly limited and not exposed to UI.

# ============================================================
# 5. ACTION CHECKLIST
# ============================================================

action_checklist:
- create draft:
  - requires master.draft.create
  - company scope check
  - duplicate identifier check
- update draft:
  - requires master.draft.update
  - expected version check
  - status must be draft/review_pending
- create version:
  - requires master.version.create
  - effective date validation
  - prior version preservation
- activate:
  - requires master.activate
  - validation pass
  - optional approval reference
- deactivate:
  - requires master.deactivate
  - impact review required where consumers exist
- publish:
  - requires master.publication.publish
  - publication line validation
- acknowledge:
  - requires module-specific acknowledgement permission
  - cannot alter master by itself
- BI snapshot:
  - read-only
  - no mutation

# ============================================================
# 6. SECURITY STOP ITEMS
# ============================================================

security_stop_items:
- do not store API secrets in master tables
- do not store bank credential secret values
- do not expose service role key
- do not allow source module direct mutation without workflow
- do not allow BI mutation
- do not allow audit finding direct mutation
- do not allow approval decision direct mutation
- do not hard delete historical master references

# ============================================================
# 7. COMPLETION STATE
# ============================================================

completion_state:
- RLS / authorization checklist frozen.
- Implementation-level RLS SQL remains future work.
- DB apply remains stopped.

# ============================================================
