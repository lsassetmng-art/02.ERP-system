# ============================================================
# ERP MANAGEMENT HR OVERSIGHT ARCHITECTURE
# ============================================================

status: canonical-draft
system: erp
owner: Boss
prepared_by: Zero

purpose:
Defines the first-pass architecture
for the HR-oversight management subdomain.

main_objects:
- hr.employee
- hr.hr_department
- hr.hr_position
- hr.attendance_log
- hr.payroll_run

role_split:
- people/worker anchor layer
- organization-unit layer
- role/position layer
- attendance oversight layer
- payroll-cycle oversight layer

main_rule:
HR-related objects should be treated as management architecture
when they carry supervision, accountability, organization,
or payroll-cycle oversight meaning.

conclusion:
HR oversight is the people-and-organization management subdomain
inside ERP management architecture.
