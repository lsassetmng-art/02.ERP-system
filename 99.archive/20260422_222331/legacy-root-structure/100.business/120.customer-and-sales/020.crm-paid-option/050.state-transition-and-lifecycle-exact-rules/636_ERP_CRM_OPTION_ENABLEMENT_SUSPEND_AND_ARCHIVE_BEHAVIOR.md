# ============================================================
# ERP CRM OPTION ENABLEMENT SUSPEND AND ARCHIVE BEHAVIOR
# ============================================================

status: canonical
version: 1.0
compatibility: STRICT
system: erp
document_id: ERP-V3-636
owner: Boss
prepared_by: Zero
last_updated: 2026-04-15
scope: erp.crm_option.enablement_suspend_and_archive_behavior
component: crm-option-enablement-suspend-and-archive-behavior


# PURPOSE

Defines how object transition behavior changes when
the CRM paid option is suspended or archived at the
company/plan level.


# OPTION-LEVEL STATES

- not_enabled
- enabled_trial
- enabled_paid
- suspended
- archived


# RULES

When state is not_enabled:
- CRM object creation is not allowed
- CRM-rich lookup returns option-disabled result

When state is enabled_trial or enabled_paid:
- full governed transition rules apply

When state is suspended:
- write transitions should generally be blocked
- read access may be restricted by policy
- archive / compliance-preserving administrative actions may still be allowed

When state is archived:
- active operational write transitions are prohibited
- historical read policy is controlled separately


# PROHIBITION

Do not silently treat suspended as archived.
Do not silently treat archived as deleted.

