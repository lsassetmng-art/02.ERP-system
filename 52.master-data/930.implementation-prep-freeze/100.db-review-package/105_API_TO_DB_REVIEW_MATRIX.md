# 52.master-data API to DB Review Matrix

Generated: 2026-08-02 21:22:09 +0900

## Matrix

| API Area | DB Review Target | RLS Review Target |
|---|---|---|
| common envelope | error/status consistency | no direct RLS |
| master list/read | master_record, master_record_version | read permission, tenant isolation |
| draft create | master_record, master_record_version | write permission |
| version create | master_record_version | write permission, version ownership |
| activate/deactivate | master_record lifecycle columns | write permission, lifecycle transition |
| identifiers | master_identifier | read/write permission, uniqueness |
| role assignments | master_role_assignment | read/write permission, effective date handling |
| publication | master_publication | publish permission |
| acknowledgement | master_publication_acknowledgement | acknowledge permission |
| impact review | master_impact_review | review permission |
| source extension matrix | source_extension_owner_matrix | read/write ownership boundary |
| BI snapshot | read views/projection only | read permission only |

## Review Focus

The review should confirm that each API payload has a stable storage target, expected permission boundary, and version/audit behavior.
