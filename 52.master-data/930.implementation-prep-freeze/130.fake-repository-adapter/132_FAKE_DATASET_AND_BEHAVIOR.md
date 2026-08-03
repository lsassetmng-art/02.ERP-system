# 52.master-data Fake Dataset and Behavior

Generated: 2026-08-02 22:16:33 +0900

## Fake Dataset

The fake repository returns small deterministic records for:

- customer
- item
- supplier

## Behavior

Write-like methods return accepted command previews only.

They do not persist data.

## Result Code Candidates

- MASTER_LIST_FAKE_OK
- MASTER_DETAIL_FAKE_OK
- MASTER_DRAFT_FAKE_ACCEPTED
- MASTER_VERSION_FAKE_ACCEPTED
- MASTER_ACTIVATE_FAKE_ACCEPTED
- MASTER_DEACTIVATE_FAKE_ACCEPTED
- PUBLICATION_FAKE_ACCEPTED
- ACKNOWLEDGEMENT_FAKE_ACCEPTED
- IMPACT_REVIEW_FAKE_ACCEPTED

## Limitation

No real lifecycle, version, uniqueness, or permission enforcement is implemented here.
