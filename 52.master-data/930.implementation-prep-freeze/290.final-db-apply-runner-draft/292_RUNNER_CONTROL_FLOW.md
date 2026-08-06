# 52.master-data Runner Control Flow

Generated: 2026-08-06 12:28:37 +0900

## Future Flow

1. preflight guard
2. read-only pre-apply check
3. DDL apply
4. read-only post-DDL check
5. RLS apply
6. read-only post-RLS check
7. report
8. stop before API DB adapter activation

## Separation Rule

DDL and RLS must not be mixed in one unchecked phase.

## Commit Rule

The future DB apply runner must not automatically git commit unless a separate explicit commit GO is given after result review.
