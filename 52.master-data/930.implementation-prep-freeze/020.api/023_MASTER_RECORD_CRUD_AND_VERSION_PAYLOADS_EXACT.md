# ============================================================
# MASTER RECORD CRUD / VERSION PAYLOADS EXACT
# 52.master-data API v1
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data

# ============================================================
# 1. CREATE DRAFT MASTER
# ============================================================

endpoint:
- POST /erp/52-master-data/v1/masters/{master_domain}/draft

request_exact:

{
  "request_id": "req_52md_create_draft_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "actor": {
    "actor_id": "user_000001",
    "actor_type": "user",
    "actor_role": "master_data_editor",
    "source_module": "52.master-data"
  },
  "idempotency_key": "idem_52md_create_draft_000001",
  "request_reason": "create customer master draft",
  "requested_at": "2026-04-29T00:00:00+09:00",
  "payload": {
    "master_domain": "customer",
    "code": "CUST-000001",
    "name": "Sample Customer",
    "display_name": "Sample Customer",
    "status": "draft",
    "effective_from": "2026-04-29",
    "effective_to": null,
    "attributes": {
      "business_partner_id": null,
      "customer_role_type": "sold_to",
      "default_currency_code": "JPY",
      "default_tax_reference": null
    },
    "identifier_set": [
      {
        "identifier_type": "internal_customer_code",
        "identifier_value": "CUST-000001",
        "primary_flag": true,
        "effective_from": "2026-04-29",
        "effective_to": null
      }
    ],
    "lineage": {
      "lineage_reference": "lin_create_customer_000001",
      "source_change_request_id": null,
      "approval_reference": null
    }
  }
}

response_exact:

{
  "request_id": "req_52md_create_draft_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "result_status": "accepted",
  "result_code": "MASTER_DRAFT_CREATED",
  "master_domain": "customer",
  "master_record_id": "00000000-0000-4000-8000-100000000001",
  "master_version_id": "00000000-0000-4000-8000-200000000001",
  "master_status": "draft",
  "validation_errors": [],
  "warnings": [],
  "lineage": {
    "lineage_reference": "lin_create_customer_000001",
    "source_change_request_id": null,
    "approval_reference": null
  },
  "responded_at": "2026-04-29T00:00:01+09:00"
}

rules:
- create draft never creates active master directly
- duplicate identifier must reject or warn based on severity
- shared identity belongs to 52 only
- source module extension data must not be stored as shared identity

# ============================================================
# 2. UPDATE DRAFT MASTER
# ============================================================

endpoint:
- PATCH /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/draft

request_exact:

{
  "request_id": "req_52md_update_draft_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "actor": {
    "actor_id": "user_000001",
    "actor_type": "user",
    "actor_role": "master_data_editor",
    "source_module": "52.master-data"
  },
  "idempotency_key": "idem_52md_update_draft_000001",
  "request_reason": "correct draft display name",
  "requested_at": "2026-04-29T00:05:00+09:00",
  "payload": {
    "master_domain": "customer",
    "master_record_id": "00000000-0000-4000-8000-100000000001",
    "expected_master_version_id": "00000000-0000-4000-8000-200000000001",
    "patch_data": {
      "name": "Sample Customer Updated",
      "display_name": "Sample Customer Updated"
    },
    "lineage": {
      "lineage_reference": "lin_update_customer_000001",
      "source_change_request_id": null,
      "approval_reference": null
    }
  }
}

rules:
- direct update allowed only for draft/review_pending
- expected_master_version_id required
- active record update must use create-version endpoint

# ============================================================
# 3. CREATE NEW MASTER VERSION
# ============================================================

endpoint:
- POST /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/versions

request_exact:

{
  "request_id": "req_52md_create_version_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "actor": {
    "actor_id": "user_000001",
    "actor_type": "user",
    "actor_role": "master_data_editor",
    "source_module": "52.master-data"
  },
  "idempotency_key": "idem_52md_create_version_000001",
  "request_reason": "effective-date customer name change",
  "requested_at": "2026-04-29T00:10:00+09:00",
  "payload": {
    "master_domain": "customer",
    "master_record_id": "00000000-0000-4000-8000-100000000001",
    "base_master_version_id": "00000000-0000-4000-8000-200000000001",
    "new_effective_from": "2026-05-01",
    "new_effective_to": null,
    "changed_fields": {
      "name": "Sample Customer New Name",
      "display_name": "Sample Customer New Name"
    },
    "change_reason": "legal display name update",
    "lineage": {
      "lineage_reference": "lin_version_customer_000001",
      "source_change_request_id": "chg_000001",
      "approval_reference": "apv_000001"
    }
  }
}

response_exact:

{
  "request_id": "req_52md_create_version_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "result_status": "accepted",
  "result_code": "MASTER_VERSION_CREATED",
  "master_domain": "customer",
  "master_record_id": "00000000-0000-4000-8000-100000000001",
  "master_version_id": "00000000-0000-4000-8000-200000000002",
  "previous_master_version_id": "00000000-0000-4000-8000-200000000001",
  "master_status": "review_pending",
  "publication_required": true,
  "validation_errors": [],
  "warnings": [
    {
      "warning_code": "CONSUMER_ACKNOWLEDGEMENT_PENDING",
      "warning_level": "warning",
      "field_path": "payload.changed_fields",
      "message": "active source module consumers may need publication acknowledgement",
      "details": {
        "target_module_candidates": ["03.crm", "01.sales", "05.billing"]
      }
    }
  ],
  "lineage": {
    "lineage_reference": "lin_version_customer_000001",
    "source_change_request_id": "chg_000001",
    "approval_reference": "apv_000001"
  },
  "responded_at": "2026-04-29T00:10:01+09:00"
}

rules:
- base version preserved
- new version receives its own master_version_id
- source transactions are not rewritten
- publication may be required

# ============================================================
# 4. ACTIVATE MASTER RECORD
# ============================================================

endpoint:
- POST /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/activate

request_exact:

{
  "request_id": "req_52md_activate_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "actor": {
    "actor_id": "user_000002",
    "actor_type": "user",
    "actor_role": "master_data_approver",
    "source_module": "52.master-data"
  },
  "idempotency_key": "idem_52md_activate_000001",
  "request_reason": "activate customer master after review",
  "requested_at": "2026-04-29T00:15:00+09:00",
  "payload": {
    "master_domain": "customer",
    "master_record_id": "00000000-0000-4000-8000-100000000001",
    "target_master_version_id": "00000000-0000-4000-8000-200000000001",
    "effective_from": "2026-04-29",
    "approval_reference": "apv_000002",
    "create_publication_package": true,
    "target_module_set": ["03.crm", "02.sfa", "01.sales", "05.billing", "30.accounting"],
    "lineage": {
      "lineage_reference": "lin_activate_customer_000001",
      "source_change_request_id": null,
      "approval_reference": "apv_000002"
    }
  }
}

response_exact:

{
  "request_id": "req_52md_activate_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "result_status": "accepted",
  "result_code": "MASTER_RECORD_ACTIVATED",
  "master_domain": "customer",
  "master_record_id": "00000000-0000-4000-8000-100000000001",
  "master_version_id": "00000000-0000-4000-8000-200000000001",
  "master_status": "active",
  "publication_package_id": "00000000-0000-4000-8000-300000000001",
  "validation_errors": [],
  "warnings": [],
  "lineage": {
    "lineage_reference": "lin_activate_customer_000001",
    "source_change_request_id": null,
    "approval_reference": "apv_000002"
  },
  "responded_at": "2026-04-29T00:15:01+09:00"
}

rules:
- activation requires permission
- activation may create publication package
- publication does not mutate consumer source extensions automatically

# ============================================================
# 5. DEACTIVATE MASTER RECORD
# ============================================================

endpoint:
- POST /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/deactivate

request_exact:

{
  "request_id": "req_52md_deactivate_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "actor": {
    "actor_id": "user_000002",
    "actor_type": "user",
    "actor_role": "master_data_approver",
    "source_module": "52.master-data"
  },
  "idempotency_key": "idem_52md_deactivate_000001",
  "request_reason": "supplier no longer valid for new transactions",
  "requested_at": "2026-04-29T00:20:00+09:00",
  "payload": {
    "master_domain": "supplier",
    "master_record_id": "00000000-0000-4000-8000-100000000010",
    "expected_master_version_id": "00000000-0000-4000-8000-200000000010",
    "deactivate_effective_from": "2026-05-01",
    "deactivation_reason": "supplier contract ended",
    "impact_review_required": true,
    "create_publication_package": true,
    "target_module_set": ["10.purchase", "11.procurement", "30.accounting", "34.cash-management"],
    "lineage": {
      "lineage_reference": "lin_deactivate_supplier_000001",
      "source_change_request_id": "chg_000010",
      "approval_reference": "apv_000010"
    }
  }
}

rules:
- deactivation does not delete history
- open source transactions are handled by source modules
- impact review may be required

completion_state:
- CRUD / version payloads frozen
- activation/deactivation semantics frozen
# ============================================================
