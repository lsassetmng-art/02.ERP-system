# ============================================================
# APPROVAL POLICY AND BOUNDARY
# ============================================================

status: draft-exact-design
module: 50.approval

- Approval owns decision canon only
- source modules own business effect canon
- approval delegation and escalation remain auditable
- rejected/expired requests do not directly mutate source truth without source-side handling
