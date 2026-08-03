# ============================================================
# NEXT DB APPLY PRECONDITION NOTE
# 52.master-data
# ============================================================

status: STOP
owner: Boss
prepared_by: Zero
module: 52.master-data
db_apply_status: STOPPED

# ============================================================
# 1. CURRENT STATE
# ============================================================

current_state:
- DDL proposal draft exists.
- Read-only lint precheck exists.
- Sato review checklist exists.
- DB apply has not happened.
- psql has not been executed.

# ============================================================
# 2. REQUIRED BEFORE ANY DB APPLY
# ============================================================

required_before_any_db_apply:
- User explicitly asks to apply DB.
- 佐藤（DB担当） review approves.
- DDL proposal is revised if needed.
- Read-only DB precheck block is created.
- Read-only DB precheck passes.
- Rollback/verification plan is created.
- Apply one-block is created using psql "$DATABASE_URL".
- No destructive migration is included.
- RLS strategy is acknowledged.

# ============================================================
# 3. NEXT SAFE ACTIONS
# ============================================================

next_safe_actions:
- revise DDL proposal after Sato review
- create read-only DB precheck one-block
- create RLS policy proposal draft
- create API route skeleton without DB mutation
- create CommonOS UI skeleton without DB mutation

# ============================================================
