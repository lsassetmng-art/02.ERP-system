# ============================================================
# IDENTIFIER / ROLE PAYLOADS EXACT
# 52.master-data API v1
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data

# ============================================================
# 1. ADD IDENTIFIER
# ============================================================

endpoint:
- POST /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/identifiers

request_exact:

{
  "request_id": "req_52md_add_identifier_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "actor": {
    "actor_id": "user_000001",
    "actor_type": "user",
    "actor_role": "master_data_editor",
    "source_module": "52.master-data"
  },
  "idempotency_key": "idem_52md_add_identifier_000001",
  "request_reason": "add legacy customer code",
  "requested_at": "2026-04-29T00:25:00+09:00",
  "payload": {
    "master_domain": "customer",
    "master_record_id": "00000000-0000-4000-8000-100000000001",
    "expected_master_version_id": "00000000-0000-4000-8000-200000000001",
    "identifier": {
      "identifier_type": "legacy_customer_code",
      "identifier_value": "OLD-CUST-0001",
      "issuing_context": "legacy_erp",
      "primary_flag": false,
      "effective_from": "2026-04-29",
      "effective_to": null,
      "identifier_status": "active"
    },
    "lineage": {
      "lineage_reference": "lin_add_identifier_000001",
      "source_change_request_id": null,
      "approval_reference": null
    }
  }
}

rules:
- identifier uniqueness must be validated by identifier_type + identifier_value + active scope
- legacy identifier does not replace master_record_id
- duplicate conflict must be explicit

# ============================================================
# 2. UPDATE IDENTIFIER
# ============================================================

endpoint:
- PATCH /erp/52-master-data/v1/identifiers/{identifier_id}

request_exact:

{
  "request_id": "req_52md_update_identifier_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "actor": {
    "actor_id": "user_000001",
    "actor_type": "user",
    "actor_role": "master_data_editor",
    "source_module": "52.master-data"
  },
  "idempotency_key": "idem_52md_update_identifier_000001",
  "request_reason": "expire duplicate legacy identifier",
  "requested_at": "2026-04-29T00:30:00+09:00",
  "payload": {
    "identifier_id": "00000000-0000-4000-8000-400000000001",
    "expected_master_version_id": "00000000-0000-4000-8000-200000000001",
    "patch_data": {
      "primary_flag": false,
      "effective_to": "2026-04-30",
      "identifier_status": "inactive"
    },
    "lineage": {
      "lineage_reference": "lin_update_identifier_000001",
      "source_change_request_id": null,
      "approval_reference": null
    }
  }
}

# ============================================================
# 3. ADD BUSINESS PARTNER ROLE
# ============================================================

endpoint:
- POST /erp/52-master-data/v1/business-partners/{business_partner_id}/roles

request_exact:

{
  "request_id": "req_52md_add_partner_role_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "actor": {
    "actor_id": "user_000001",
    "actor_type": "user",
    "actor_role": "master_data_editor",
    "source_module": "52.master-data"
  },
  "idempotency_key": "idem_52md_add_partner_role_000001",
  "request_reason": "assign customer role to business partner",
  "requested_at": "2026-04-29T00:35:00+09:00",
  "payload": {
    "business_partner_id": "00000000-0000-4000-8000-500000000001",
    "role_type": "customer",
    "role_reference_id": "00000000-0000-4000-8000-100000000001",
    "role_status": "active",
    "effective_from": "2026-04-29",
    "effective_to": null,
    "lineage": {
      "lineage_reference": "lin_add_partner_role_000001",
      "source_change_request_id": null,
      "approval_reference": null
    }
  }
}

role_type_allowed:
- customer
- supplier
- payer
- payee
- carrier
- manufacturer
- subcontractor
- internal_company
- contact_organization

rules:
- role assignment belongs to 52
- role operational details belong to source module
- customer/supplier cross-role does not net AP/AR automatically

# ============================================================
# 4. END BUSINESS PARTNER ROLE
# ============================================================

endpoint:
- POST /erp/52-master-data/v1/business-partners/{business_partner_id}/roles/{partner_role_assignment_id}/end

request_exact:

{
  "request_id": "req_52md_end_partner_role_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "actor": {
    "actor_id": "user_000001",
    "actor_type": "user",
    "actor_role": "master_data_editor",
    "source_module": "52.master-data"
  },
  "idempotency_key": "idem_52md_end_partner_role_000001",
  "request_reason": "supplier role ended",
  "requested_at": "2026-04-29T00:40:00+09:00",
  "payload": {
    "business_partner_id": "00000000-0000-4000-8000-500000000001",
    "partner_role_assignment_id": "00000000-0000-4000-8000-600000000010",
    "effective_to": "2026-05-31",
    "end_reason": "supplier role no longer used",
    "impact_review_required": true,
    "lineage": {
      "lineage_reference": "lin_end_partner_role_000001",
      "source_change_request_id": "chg_role_000001",
      "approval_reference": "apv_role_000001"
    }
  }
}

completion_state:
- identifier payloads frozen
- role assignment payloads frozen
- role ending / impact review trigger frozen
# ============================================================
