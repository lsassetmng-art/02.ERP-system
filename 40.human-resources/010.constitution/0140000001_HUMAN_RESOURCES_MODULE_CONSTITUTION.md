# ============================================================
# HUMAN RESOURCES MODULE CONSTITUTION
# ============================================================

status: draft-exact-design
module: 40.human-resources
owner: Boss
prepared_by: Zero

## 1. Purpose
The Human Resources module governs employee lifecycle and workforce assignment canon.
It is the canonical module for employment profile, joining/leaving lifecycle,
organizational assignment, role placement, and HR-side operational employee status truth.

## 2. Canonical scope
The module owns:
- workforce profile canon
- employment lifecycle canon
- organization/department assignment canon
- role and reporting placement canon
- hiring / transfer / retirement HR operational status canon

## 3. Non-scope
It does not own:
- attendance / leave / overtime / shift truth -> 41.labor-management
- payroll result truth -> 42.payroll
- journal truth -> 30.accounting
- applicant tracking canon if separately introduced later

## 4. Lifecycle
Candidate Reference
-> Active Employee
-> Transferred / Promoted / Suspended
-> Leave of Status
-> Retired / Terminated / Archived

## 5. Boundary rule
Human Resources owns who the worker is in operational HR terms and where they belong.
Labor Management owns when/how they worked.
Payroll owns how they are paid.
