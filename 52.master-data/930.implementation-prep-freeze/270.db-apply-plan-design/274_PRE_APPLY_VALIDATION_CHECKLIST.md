# 52.master-data Pre-Apply Validation Checklist

Generated: 2026-08-05 11:24:28 +0900

Before any future DB apply:

- [ ] explicit DB apply GO exists
- [ ] branch is main
- [ ] origin/main is synced
- [ ] working tree is clean
- [ ] DATABASE_URL is set
- [ ] read-only catalog check passes
- [ ] candidate objects are still in expected state
- [ ] DDL SQL files are final
- [ ] RLS SQL files are final
- [ ] rollback limitation is acknowledged
- [ ] no application write API is executed
