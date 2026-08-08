# ============================================================
# MANAGEMENT ACCOUNTING MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 31.management-accounting

Components:
- Managerial Allocation Service
- Cost Center Result Service
- Segment Profitability Service
- Internal Reporting Projection Service

Inbound surfaces:
- accounting journal references
- costing references
- project references as needed

Rule:
Management accounting derives internal truth from source references but does not replace journal truth.
