# ERP LOGIN / AUTH DEVELOPMENT PLAN AND ACCEPTANCE

document_status: canonical
canonical_owner: 00.foundation

## 1. Implementation order

Implementation must proceed in this order:

1. confirm physical existing auth/security assets READ ONLY
2. select physical authentication provider
3. define physical Login Account mapping
4. define company membership persistence
5. define role/permission persistence
6. define session/current-company mechanism
7. connect integration.my_company_id()
8. implement login/session APIs
9. implement /login and company selection UI
10. implement audit/security controls
11. validate offline boundary
12. perform acceptance audit

## 2. Separate gates

Canonical design acceptance does not authorize:

- DB DDL
- DB DML
- credential migration
- 04 implementation mutation
- production authentication-provider setup

Each requires its own explicit GO.

## 3. Required tests

Authentication:
- duplicate normalized login identifier rejected
- duplicate authentication-provider subject mapping rejected

- valid login
- invalid credential
- disabled account
- locked/suspended account
- logout
- expired session
- revoked session

Company access:
- overlapping duplicate membership for the same Login Account and company rejected
- non-overlapping historical successor membership permitted

- zero membership
- one membership
- multiple memberships
- unauthorized company request
- revoked membership
- company switch

Authorization:
- system-scope role assigned only through Login Account role assignment
- company-scope role assigned only through Company Membership
- business-module permission semantics remain owned by the source business module

- allowed permission
- missing permission
- role revoked
- permission removed
- direct API attempt bypassing UI

Security:

- account enumeration resistance
- session fixation resistance
- CSRF protection where applicable
- credential redaction
- audit evidence
- no raw secret logging

Offline:

- login offline denied
- company switch offline denied
- queued business mutation remains non-authoritative
- reconnect requires revalidation

## 4. Acceptance conditions

ERP Login/Auth implementation is accepted only when:

- Login Account authority is unambiguous
- authentication provider boundary is documented
- credential storage is secure
- session lifecycle works
- /login works
- logout invalidates authority
- company membership is enforced
- current company is server validated
- integration.my_company_id() is correctly bound
- permission checks are server-side
- audit requirements pass
- authentication/security source truth remains owned by Foundation
- audit evidence truth remains owned by 51.audit
- permission framework ownership and business-module permission semantics remain separated
- multilingual UI contract passes
- offline restrictions pass

## 5. P1 gate

P1 Procurement Quantity remains HOLD until the above login/auth implementation
has been accepted.

Canonical design completion alone does not open P1.

## Canonical extension acceptance criteria

Human role acceptance:

- one Company Membership can hold multiple effective roles
- duplicate overlapping same-role assignment is rejected
- COMPANY_SYSTEM_ADMIN remains company-scoped
- COMPANY_STAFF alone grants no module-specific business permission
- accounting-only role cannot exercise unrelated module permission
- approval permission requires explicit applicable role/permission
- combined module roles resolve deterministically
- revoked or expired role grants no authority

Service actor acceptance:

- AI Worker human login is rejected
- inactive Service Identity authentication is rejected
- missing Service Company Access denies company operation
- expired Service Company Access denies company operation
- missing Service Role Assignment denies protected operation
- unrelated Service Role permission denies operation
- human-initiated AI Worker operation preserves requested_by
- autonomous operation preserves Service Identity actor
- raw service credential is absent from logs
- actor_type HUMAN and SERVICE remain distinguishable
- Service Identity cannot use membership_role_assignment
- human Login Account cannot use service_role_assignment

Canonical acceptance must occur before physical provider/schema decisions are
implemented.
