# ============================================================
# HUMAN RESOURCES MODULE ARCHITECTURE
# ============================================================

status: draft-exact-design
module: 40.human-resources

## 1. Logical components
1. Workforce Profile Service
2. Employment Lifecycle Service
3. Assignment / Transfer Service
4. Organization Placement Service
5. Search / Directory Projection Service

## 2. Main aggregates
- hr_workforce_profile
- hr_employment_lifecycle
- hr_assignment
- hr_role_placement
- hr_status_change

## 3. Inbound dependencies
From 52.master-data:
- org / department reference
- job class reference
- location reference

## 4. Outbound surfaces
To 41.labor-management:
- active assignment reference
- worker status / org assignment reference

To 42.payroll:
- employment status reference
- payroll grouping basis reference

## 5. Rule
HR owns workforce lifecycle canon.
Labor and Payroll consume HR references but do not overwrite HR truth.
