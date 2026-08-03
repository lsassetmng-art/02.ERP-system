# 52.master-data Commit Scope Options Summary

Generated: 2026-08-04 04:20:38 +0900

## Counts

| Scope | Count |
|---|---:|
| full audit scope | 439 |
| recommended lean scope | 225 |
| design scope | 189 |
| runtime/test scope | 36 |
| meta-only scope | 214 |
| excluded from recommended | 214 |

## Interpretation

The recommended lean scope includes design docs, runtime implementation, route fake-mode files, UI/CommonOS files, tests, and README.

It excludes generated implementation runtime reports under:

- 04.ERP-development/52.master-data/test/900.meta/

Reason: those reports are numerous and mostly generated evidence. The design-side final bundle and docs preserve the milestone summary.

## Current Recommendation

Use recommended lean scope for the first commit unless full audit trace must be preserved in git.
