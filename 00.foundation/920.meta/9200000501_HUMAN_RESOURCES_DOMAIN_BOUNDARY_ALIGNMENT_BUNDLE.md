# ============================================================
# HUMAN RESOURCES DOMAIN BOUNDARY ALIGNMENT BUNDLE
# ============================================================

status: generated
scope:
- 40.human-resources
- 41.labor-management
- 42.payroll

owner: Boss
prepared_by: Zero

## 1. Canonical ownership summary
- 40.human-resources owns workforce profile, employment lifecycle, assignment, org placement, and HR master-like operational truth
- 41.labor-management owns attendance, shift, leave, overtime, work-record, and labor-control operational truth
- 42.payroll owns payroll calculation basis, payroll result canon, deduction result canon, and payroll accounting reference canon

## 2. Explicit non-ownership
- Human Resources does not own labor time truth
- Labor Management does not own payroll result truth
- Payroll does not own journal truth
- Payroll does not own employment lifecycle truth
- Labor Management does not own employee identity master truth beyond operational labor surfaces

## 3. Handoff chain
Human Resources
-> Labor assignment / employment state reference
-> Labor Management attendance and labor result truth
-> Payroll payroll basis and payroll result truth
-> Accounting payroll accounting reference payload

## 4. Master data and accounting boundary
- 52.master-data may retain shared reference identities where applicable
- 30.accounting owns journal and settlement truth
- HR bundle modules provide operational/payroll canon and accounting references only

## 5. Design rule
Every handoff is payload/event based.
No module directly mutates another module's canon.
