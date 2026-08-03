# ============================================================
# PUBLICATION / ACKNOWLEDGEMENT / IMPACT PAYLOADS EXACT
# 52.master-data API v1
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data

# ============================================================
# 1. CREATE PUBLICATION PACKAGE
# ============================================================

endpoint:
- POST /erp/52-master-data/v1/publications

request_exact:

{
  "request_id": "req_52md_create_publication_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "actor": {
    "actor_id": "system_52md",
    "actor_type": "system",
    "actor_role": "master_data_publisher",
    "source_module": "52.master-data"
  },
  "idempotency_key": "idem_52md_create_publication_000001",
  "request_reason": "publish activated customer master",
  "requested_at": "2026-04-29T00:45:00+09:00",
  "payload": {
    "master_domain": "customer",
    "publication_type": "delta_create",
    "publication_reason": "new customer activated",
    "master_record_reference_set": [
      {
        "master_record_id": "00000000-0000-4000-8000-100000000001",
        "master_version_id": "00000000-0000-4000-8000-200000000001"
      }
    ],
    "target_module_set": ["03.crm", "02.sfa", "01.sales", "05.billing", "30.accounting"],
    "publication_line_set": [
      {
        "master_record_id": "00000000-0000-4000-8000-100000000001",
        "master_version_id": "00000000-0000-4000-8000-200000000001",
        "change_type": "create",
        "effective_from": "2026-04-29",
        "effective_to": null,
        "payload_reference": "md_payload_customer_000001"
      }
    ],
    "lineage": {
      "lineage_reference": "lin_pub_000001",
      "source_change_request_id": null,
      "approval_reference": "apv_000002"
    }
  }
}

publication_type_allowed:
- full_snapshot
- delta_create
- delta_update
- deactivate_notice
- reactivate_notice
- merge_notice
- split_notice
- identifier_change
- hierarchy_change
- correction_notice

# ============================================================
# 2. PUBLISH PUBLICATION PACKAGE
# ============================================================

endpoint:
- POST /erp/52-master-data/v1/publications/{publication_package_id}/publish

request_exact:

{
  "request_id": "req_52md_publish_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "actor": {
    "actor_id": "user_000002",
    "actor_type": "user",
    "actor_role": "master_data_publisher",
    "source_module": "52.master-data"
  },
  "idempotency_key": "idem_52md_publish_000001",
  "request_reason": "publish package to consumer modules",
  "requested_at": "2026-04-29T00:50:00+09:00",
  "payload": {
    "publication_package_id": "00000000-0000-4000-8000-300000000001",
    "expected_publication_status": "building",
    "publish_mode": "notify_consumers",
    "lineage": {
      "lineage_reference": "lin_publish_000001",
      "source_change_request_id": null,
      "approval_reference": "apv_000002"
    }
  }
}

rules:
- publish does not mutate source modules
- source modules must acknowledge or reject
- BI refresh is separate read/snapshot action

# ============================================================
# 3. CONSUMER ACKNOWLEDGEMENT
# ============================================================

endpoint:
- POST /erp/52-master-data/v1/publications/{publication_package_id}/acknowledgements

request_exact:

{
  "request_id": "req_52md_ack_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "actor": {
    "actor_id": "module_03_crm",
    "actor_type": "module",
    "actor_role": "source_module_consumer",
    "source_module": "03.crm"
  },
  "idempotency_key": "idem_52md_ack_000001",
  "request_reason": "CRM accepted customer publication",
  "requested_at": "2026-04-29T00:55:00+09:00",
  "payload": {
    "publication_package_id": "00000000-0000-4000-8000-300000000001",
    "target_module": "03.crm",
    "acknowledgement_status": "acknowledged",
    "rejection_reason_code": null,
    "rejection_detail": null,
    "impact_review_reference": null,
    "consumer_reference": {
      "consumer_object_type": "crm_master_reference_cache",
      "consumer_object_id": "crm_ref_customer_000001"
    },
    "lineage": {
      "lineage_reference": "lin_ack_crm_000001",
      "source_change_request_id": null,
      "approval_reference": null
    }
  }
}

acknowledgement_status_allowed:
- pending
- acknowledged
- acknowledged_with_warning
- rejected
- held_for_review
- failed
- superseded

rules:
- acknowledgement does not edit master data
- acknowledgement does not edit source transaction
- rejected acknowledgement requires explicit reason

# ============================================================
# 4. REGISTER IMPACT REVIEW
# ============================================================

endpoint:
- POST /erp/52-master-data/v1/publications/{publication_package_id}/impact-reviews

request_exact:

{
  "request_id": "req_52md_impact_000001",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "actor": {
    "actor_id": "module_10_purchase",
    "actor_type": "module",
    "actor_role": "source_module_consumer",
    "source_module": "10.purchase"
  },
  "idempotency_key": "idem_52md_impact_000001",
  "request_reason": "review supplier deactivation impact",
  "requested_at": "2026-04-29T01:05:00+09:00",
  "payload": {
    "publication_package_id": "00000000-0000-4000-8000-300000000010",
    "target_module": "10.purchase",
    "impact_type": "open_transaction_impact",
    "affected_source_object_type_or_extension": "purchase_order",
    "affected_source_object_count_or_reference": "12",
    "recommended_action": "hold_for_review",
    "impact_status": "open",
    "impact_detail": {
      "open_purchase_order_count": 12,
      "blocked_new_transaction_recommended": true
    },
    "lineage": {
      "lineage_reference": "lin_impact_purchase_000001",
      "source_change_request_id": null,
      "approval_reference": null
    }
  }
}

impact_type_allowed:
- open_transaction_impact
- extension_conflict
- deactivation_impact
- merge_split_impact
- hierarchy_change_impact
- reporting_dimension_impact
- policy_mapping_impact

recommended_action_allowed:
- accept_publication
- hold_for_review
- request_master_correction
- correct_source_extension
- block_new_transaction
- allow_historical_only
- require_reapproval
- refresh_BI_dimension

completion_state:
- publication payload frozen
- acknowledgement payload frozen
- impact review payload frozen
# ============================================================
