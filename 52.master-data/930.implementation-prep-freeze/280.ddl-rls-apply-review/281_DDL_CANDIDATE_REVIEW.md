# 52.master-data DDL Candidate Review

Generated: 2026-08-05 11:58:11 +0900

## DDL Files

```text
/data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/030.db/032_DB_DDL_PROPOSAL_DRAFT.sql
/data/data/com.termux/files/home/02.ERP-system/52.master-data/930.implementation-prep-freeze/100.db-review-package/attachments/032_DB_DDL_PROPOSAL_DRAFT.sql
```

## CREATE TABLE Raw Count

- CREATE_TABLE_RAW_COUNT: 40
- CREATE_TABLE_UNIQUE_COUNT: 20

## Unique CREATE TABLE Targets

```text
master_data.business_partner_core
master_data.company_reference
master_data.contact_person_reference
master_data.customer_core
master_data.item_core
master_data.legal_entity_reference
master_data.location_core
master_data.master_consumer_acknowledgement
master_data.master_identifier
master_data.master_impact_review
master_data.master_publication_line
master_data.master_publication_package
master_data.master_record
master_data.master_record_version
master_data.master_role_assignment
master_data.organization_unit_reference
master_data.product_core
master_data.source_extension_owner_matrix
master_data.supplier_core
master_data.unit_of_measure
```

## Interpretation

If raw count exceeds unique count, this is treated as duplicate/repeated candidate-file signal and must be reviewed before final DB apply.

This review does not apply DDL.
