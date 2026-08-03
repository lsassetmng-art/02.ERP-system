# ============================================================
# READ / QUERY / BI SNAPSHOT PAYLOADS EXACT
# 52.master-data API v1
# ============================================================

status: active
owner: Boss
prepared_by: Zero
module: 52.master-data

# ============================================================
# 1. LIST / SEARCH MASTER RECORDS
# ============================================================

endpoint:
- GET /erp/52-master-data/v1/masters/{master_domain}

query_parameters_exact:

{
  "company_id": "00000000-0000-4000-8000-000000000001",
  "status": ["active", "draft"],
  "q": "sample",
  "code": null,
  "name": null,
  "effective_on": "2026-04-29",
  "include_inactive": false,
  "include_superseded": false,
  "limit": 50,
  "cursor": null,
  "sort": "code_asc"
}

response_exact:

{
  "request_id": "req_read_generated_or_supplied",
  "company_id": "00000000-0000-4000-8000-000000000001",
  "result_status": "accepted",
  "master_domain": "customer",
  "items": [
    {
      "master_record_id": "00000000-0000-4000-8000-100000000001",
      "current_master_version_id": "00000000-0000-4000-8000-200000000001",
      "code": "CUST-000001",
      "name": "Sample Customer",
      "display_name": "Sample Customer",
      "master_status": "active",
      "effective_from": "2026-04-29",
      "effective_to": null,
      "primary_identifier": {
        "identifier_type": "internal_customer_code",
        "identifier_value": "CUST-000001"
      }
    }
  ],
  "next_cursor": null,
  "validation_errors": [],
  "warnings": [],
  "responded_at": "2026-04-29T01:10:00+09:00"
}

# ============================================================
# 2. MASTER DETAIL
# ============================================================

endpoint:
- GET /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}

query_parameters_exact:

{
  "company_id": "00000000-0000-4000-8000-000000000001",
  "version_id": null,
  "effective_on": "2026-04-29",
  "include_identifiers": true,
  "include_roles": true,
  "include_lineage": true,
  "include_publication_status": true
}

# ============================================================
# 3. VERSION HISTORY
# ============================================================

endpoint:
- GET /erp/52-master-data/v1/masters/{master_domain}/{master_record_id}/versions

rules:
- version history is read-only
- historical version detail must be retrievable
- source transactions may reference historical version IDs

# ============================================================
# 4. PUBLICATION DETAIL
# ============================================================

endpoint:
- GET /erp/52-master-data/v1/publications/{publication_package_id}

rules:
- publication detail is read-only
- acknowledgement and impact review sets are visible
- consumer source transactions are not mutated by reading

# ============================================================
# 5. SOURCE EXTENSION MATRIX READ
# ============================================================

endpoint:
- GET /erp/52-master-data/v1/source-extension-matrix

response_shape:
- source_module
- extension_owner
- master_domain_set
- extension_object_set
- ownership_rule

rules:
- matrix is read-only
- source extension ownership remains source module side

# ============================================================
# 6. BI SNAPSHOT READ
# ============================================================

endpoint:
- GET /erp/52-master-data/v1/bi-snapshots/{master_domain}

query_parameters_exact:

{
  "company_id": "00000000-0000-4000-8000-000000000001",
  "snapshot_at": "2026-04-29T00:00:00+09:00",
  "include_inactive": false,
  "limit": 1000,
  "cursor": null
}

rules:
- BI snapshot is read-only
- BI cannot mutate master data
- BI dimension refresh is not master merge/split

completion_state:
- read/query payloads frozen
- source extension matrix read frozen
- BI snapshot read frozen
# ============================================================
