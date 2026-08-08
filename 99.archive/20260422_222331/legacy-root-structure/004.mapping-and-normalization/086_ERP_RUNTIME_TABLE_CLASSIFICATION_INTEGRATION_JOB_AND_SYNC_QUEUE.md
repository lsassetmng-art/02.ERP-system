# ============================================================
# ERP RUNTIME TABLE CLASSIFICATION INTEGRATION JOB AND SYNC QUEUE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Provides first-pass canonical classification
for integration/inbound-outbound runtime candidates.

review_basis:
- erp_schema_table_column_full.txt

tables:
- integration.integration_job
- integration.integration_outbox
- integration.audit_export_queue
- integration.siem_delivery_queue
- core.sync_queue
- public.sync_queue

# ============================================================
# 1. CURRENT WORKING INTERPRETATION
# ============================================================

integration.integration_job:
  likely_class:
  - support or source_of_truth for integration job family
  confidence:
  - medium
  reason:
  - explicit integration job semantics indicate active integration-side process object

integration.integration_outbox:
  likely_class:
  - support
  confidence:
  - high
  reason:
  - outbox naming strongly indicates dispatch support

integration.audit_export_queue:
  likely_class:
  - support
  confidence:
  - high
  reason:
  - export queue semantics indicate delivery support

integration.siem_delivery_queue:
  likely_class:
  - support
  confidence:
  - high
  reason:
  - delivery queue semantics indicate outbound support

core.sync_queue / public.sync_queue:
  likely_class:
  - support or duplicated support
  confidence:
  - medium
  reason:
  - sync queue naming suggests synchronization support, and multi-schema presence raises duplicate/support review

# ============================================================
# 2. CANONICAL POSITION
# ============================================================

canonical_position:
- canonical_layer: 000.platform
- canonical_module: integration/runtime-support side

# ============================================================
# 3. FAMILY JUDGMENT
# ============================================================

family_judgment:
The integration/runtime family appears to contain:
- one or more active integration job objects
- multiple outbox/export/delivery queue supports
- potentially duplicated sync queue support placement

# ============================================================
# 4. CONCLUSION
# ============================================================

conclusion:
integration.integration_job is the strongest active-process candidate here,
while outbox/queue families remain clearly support-side.
