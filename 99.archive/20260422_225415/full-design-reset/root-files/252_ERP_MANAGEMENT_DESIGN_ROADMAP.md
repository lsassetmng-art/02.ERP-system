# ============================================================
# ERP MANAGEMENT DESIGN ROADMAP
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the roadmap for management-side design coverage.

management_targets:
- governance
- notification
- workflow support
- ops / monitoring
- admin / control layers
- policy / decision layers

main_questions:
- governance truth vs workflow truth
- control request vs business request
- notify support vs business state
- monitoring support vs runtime truth
- admin and policy boundaries

conclusion:
Management design exists in fragments,
but still needs a dedicated consolidation pass.
