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

# PHYSICAL AUTHORITY + USER/ROLE LIFECYCLE DEVELOPMENT AND ACCEPTANCE

canonical_extension: ERP_LOGIN_AUTH_PHYSICAL_AUTHORITY_USER_ROLE_LIFECYCLE_V1

Implementation must not begin until this canonical extension is reviewed
and accepted.

## PHYSICAL AUTHORITY ACCEPTANCE

Required:

- Supabase Auth is provider authority;
- auth remains provider-managed;
- security is ERP Login/Auth/AuthZ physical schema;
- core.company remains company authority;
- public remains ordinary read-only views only;
- no dual Login/Auth authority is introduced.

## HUMAN USER ACCEPTANCE

Required:

- application flow;
- invitation flow;
- bootstrap admin flow;
- provider UID binding;
- Login Account activation;
- Login Account suspension/disable;
- Company Membership activation/suspension/end;
- multi-company membership;
- company removal without unintended global-account disable;
- hard delete prohibited by default;
- optional Employee linkage.

## ROLE ACCEPTANCE

Required:

- built-in role protection;
- company custom role boundary;
- system/company/service assignment separation;
- multiple company roles;
- module-specific roles;
- assignment history;
- assignment revocation/end;
- no unauthorized self-elevation;
- last COMPANY_SYSTEM_ADMIN guard.

## PREFERENCE ACCEPTANCE

Required:

- preferred UI language;
- preferred display time zone;
- last selected company preference;
- company revalidation;
- no authorization from preference;
- no locale-derived currency authority;
- UI language separate from document language;
- user time zone separate from company business time zone.

## AUTHENTICATION SECURITY ACCEPTANCE

Required:

- provider credential authority remains external/provider-managed;
- no plaintext password storage;
- no raw MFA secret storage;
- no raw recovery/invitation token storage;
- session expiry/revocation;
- membership/role change authorization refresh;
- company MFA/step-up policy support;
- fail-closed behavior.

## AI WORKER ACCEPTANCE

Required:

- Service Identity separate from human Login Account;
- explicit company access;
- service-only Role Assignment;
- least privilege;
- requested-by human attribution where applicable;
- no fake-human service identity;
- no provider-wide unrestricted key as individual AI Worker identity;
- plaintext service secret storage prohibited.

## LEGACY EXISTING OBJECTS

Existing objects including:

- core.app_user;
- core.company_users;
- core.permission_*;
- governance.role*;
- system.role*;
- master_data.master_role_assignment;
- integration.api_credential

are existing-state evidence and migration/compatibility candidates only.

They do not define new canonical authority.

Migration must avoid dual authority.

No legacy object is dropped by this canonical design change unit.

Any drop, destructive migration, DB mutation, or data migration requires
its own explicit implementation GO.

## CURRENT EXISTING DATA NOTE

Existing-state discovery observed no current rows in core.app_user and
core.company_users at the time of discovery.

This observation reduces migration risk but does not itself define
canonical authority.

## IMPLEMENTATION SEQUENCE

After canonical acceptance:

1. exact physical DDL/migration design;
2. implementation bundle design under 04;
3. explicit DB implementation GO;
4. create security authority;
5. establish provider identity binding;
6. establish session/company context;
7. establish user provisioning/membership;
8. establish role/permission authority;
9. establish preferences/auth policy;
10. establish Service Identity authority;
11. migrate/redirect existing dependencies;
12. replace arbitrary integration.my_company_id behavior;
13. validate security/audit/public boundaries;
14. accept Login/Auth implementation.

P1 Procurement Quantity remains HOLD until Login/Auth implementation
acceptance under canonical.

# ERP LOGIN / AUTH EXACT DDL ACCEPTANCE V1

canonical_extension: ERP_LOGIN_AUTH_EXACT_DDL_CANONICAL_V1

Exact-DDL canonical acceptance requires:

- security authority table count = 16;
- all sixteen authority names defined;
- Provider/ERP ID separation;
- no security-to-auth hard FK;
- Login Account authorization_version;
- Service Identity authorization_version;
- trusted provider session reference;
- trusted Company context;
- multi-company Membership;
- Role scope/category separation;
- Role lifecycle including RETIRE;
- COMPANY_CUSTOM Company ownership;
- final COMPANY_SYSTEM_ADMIN protection;
- temporal non-overlap protection;
- deny-by-default RLS;
- no ordinary direct client security DML;
- no plaintext secrets.

## ACCEPTED EVIDENCE BASELINE

Current implementation evidence baseline:

- security schema present: NO
- auth.users rows: 1
- core.app_user rows: 0
- core.company_users rows: 0
- core.company rows: 0
- core.app_user inbound FKs: 14
- system.role_def inbound FKs: 2
- integration.my_company_id() policies: 179
- direct auth.uid() policies: 12
- policies using both: 2
- legacy actor source rows: 0
- legacy actor non-null references: 0
- governance.role_permission rows: 5
- system.role_screen_permission rows: 117

## ROLE ACCEPTANCE

Legacy role codes are not automatic canonical mappings.

In particular, ADMIN is not automatically COMPANY_SYSTEM_ADMIN.

Role Definition lifecycle is:

CREATE_UPDATE_DISABLE_DEPRECATE_RETIRE.

## DIRECT AUTH UID ACCEPTANCE

All twelve direct auth.uid policies must be semantically reviewed and
remediated or explicitly proven correct before Login/Auth implementation
acceptance.

## ACTOR ACCEPTANCE

Zero current data does not waive actor classification.

Automatic core.app_user → security.login_account FK repoint is prohibited.

## IMPLEMENTATION GATES

After this canonical change is accepted and pushed:

1. prepare exact 04 implementation bundle
2. review bundle READ ONLY
3. accept migration and verification scripts
4. obtain explicit DB GO
5. deploy additive security authority
6. cut over compatibility resolver
7. remediate direct auth.uid policies
8. perform approved actor migration
9. verify RLS/session/role/service behavior
10. accept Login/Auth implementation

P1 Procurement Quantity remains HOLD until Login/Auth implementation
acceptance.
