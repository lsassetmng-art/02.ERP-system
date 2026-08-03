# ============================================================
# MASTER DATA POLICY AND BOUNDARY
# ============================================================

status: draft-exact-design
module: 52.master-data

- Master Data owns shared reference truth
- transactional modules own transaction truth
- deprecated references remain historically referencable
- consumer modules may cache lookups but must not treat cache as canonical truth
