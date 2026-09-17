# ERP LOGIN / AUTH POLICY AND BOUNDARY

document_status: canonical
canonical_owner: 00.foundation

## 1. Deny by default

All protected ERP access is denied unless an explicit valid authorization path exists.

## 2. Account lifecycle policy

Login Account status governs authentication eligibility.

- invited: activation flow only
- active: may authenticate
- locked: normal authentication denied
- suspended: ERP access denied
- disabled: ERP access denied

Destructive deletion is not the normal business lifecycle mechanism.

## 3. Credential policy

Credentials:

- are not stored in business-domain tables
- are not stored in Master Data
- are not emitted to application logs
- are not placed in URLs
- are not returned by current-user/session APIs

## 4. Session policy

Sessions must have:

- explicit issuance
- explicit expiry
- revocation capability
- association with one Login Account

Long-lived permanent browser authentication without controlled expiry is prohibited.

## 5. Company access policy

A company-scoped operation requires:

- active session
- active account
- valid current company
- active company membership
- required permission

Company visibility in UI does not itself grant company access.

## 6. Permission policy

Authorization is evaluated server-side.

Absence of permission means denied.

Role and permission changes must be auditable.

Privilege changes must not silently rely on stale indefinitely cached authorization.

## 7. Recovery policy

Account recovery/password reset, where applicable, must use:

- short-lived recovery authority
- single-use or equivalent replay-resistant mechanism
- identity verification appropriate to the provider
- security audit evidence

Recovery secrets must not be stored in plaintext business logs.

## 8. MFA policy

MFA capability is an explicit extension point.

MFA is not assumed implemented by this design change unit.

Future MFA introduction must not require redesign of Login Account identity.

## 9. Error disclosure policy

Authentication errors must avoid account enumeration.

UI may provide a generic authentication failure response while detailed reason
remains in protected security telemetry where appropriate.

## 10. Offline policy

New login offline is prohibited.

Offline mode cannot:

- grant a new role
- change company membership
- switch company
- reset credential
- create a new authenticated session

## 11. Provider policy

Physical provider selection is deferred.

Provider choice must conform to this canonical contract rather than redefine it.

## Canonical extension: company role policy

Company Membership may carry multiple effective roles.

The following common company role codes are reserved:

- COMPANY_SYSTEM_ADMIN
- COMPANY_ADMIN
- COMPANY_STAFF

Policy:

- COMPANY_SYSTEM_ADMIN is company scope, not global system scope
- COMPANY_ADMIN does not automatically grant every module permission
- COMPANY_STAFF grants no module-specific business privilege by default
- module-specific business authority requires explicit module role/permission
- approval authority must be explicit
- role combinations remain subject to separation-of-duties policy
- deny by default remains mandatory

Module-specific role catalogs belong to their source business modules.

## Canonical extension: Service Identity policy

AI Worker authentication is required for protected ERP execution.

Policy:

- human Login Account impersonation by AI Worker is prohibited
- Service Identity company access is explicit only
- Service Identity authorization uses least privilege
- Service Identity must be independently suspendable/revocable
- raw service credentials must not appear in logs or business payloads
- human-initiated service execution retains requested_by attribution
- autonomous execution still retains Service Identity attribution

# USER, COMPANY, ROLE AND PREFERENCE GOVERNANCE POLICY

canonical_extension: ERP_LOGIN_AUTH_PHYSICAL_AUTHORITY_USER_ROLE_LIFECYCLE_V1

## PROVISIONING POLICY

Allowed normal human provisioning methods:

- APPLICATION;
- INVITATION.

BOOTSTRAP is allowed only for governed initial company administration.

Unrestricted public ERP self-signup is prohibited.

Company approval is required before company business access is granted.

## COMPANY ADMINISTRATOR AUTHORITY

A company administrator may act only within explicitly authorized company
scope.

Depending on assigned permissions, company administration may include:

- review own-company access applications;
- issue own-company invitations;
- activate/suspend/end own-company membership;
- grant/end allowed own-company roles;
- manage allowed own-company custom roles;
- review company authentication policy.

A company administrator must not merely by company-admin status:

- create or grant global system roles;
- modify provider passwords;
- inspect provider secrets;
- rewrite provider UID;
- disable a user's global Login Account because of own-company removal;
- mutate another company's membership;
- mutate another company's custom role;
- bypass grant-boundary checks.

## SELF-ELEVATION POLICY

Role-management authority does not imply unlimited role-grant authority.

An administrator may grant only roles/permissions allowed by the
administrator's effective grant boundary.

Unauthorized self-elevation is prohibited.

## BUILT-IN ROLE POLICY

SYSTEM_BUILTIN and MODULE_BUILTIN role definitions are protected.

Company administrators may assign a permitted built-in company role but
must not rewrite its canonical semantics.

COMPANY_CUSTOM role definitions are scoped to the owning company.

## COMMON COMPANY ROLES

Reserved common company roles remain:

- COMPANY_SYSTEM_ADMIN;
- COMPANY_ADMIN;
- COMPANY_STAFF.

COMPANY_SYSTEM_ADMIN is company scope.

It is not a global system role.

COMPANY_STAFF is a minimal/common company-user role and must not imply
universal module access.

## MODULE ROLE POLICY

Module-specific business and approval role semantics remain owned by the
source module.

Foundation owns the shared Role/Permission/Assignment framework.

## LAST ADMIN POLICY

The final active COMPANY_SYSTEM_ADMIN for a company must not be removed,
ended, or deprived of that role without a governed replacement or recovery
path.

## USER DELETE POLICY

Normal company-level "delete user" means end company access, not physical
delete of Login Account.

Default user hard delete is prohibited.

Historical actor identity, approvals, business actions, and audit evidence
must remain attributable.

## MULTI-COMPANY POLICY

One Login Account may have multiple active Company Memberships.

A membership or role change in Company A must not silently alter Company B.

## EMPLOYEE POLICY

Employee and Login Account remain separate.

Employee linkage is optional.

External professionals, contractors, auditors, or other authorized users
may have Login Accounts without Employee records.

## LANGUAGE AND TIME-ZONE POLICY

User language and display time zone are user preferences.

Company legal language, company business time zone, document language,
and currency are separate governed concepts.

Preference changes do not grant authorization.

## MFA POLICY

MFA capability is provider-backed.

ERP may require MFA or stronger assurance according to governed
platform/company authentication policy.

ERP stores policy and assurance decisions, not raw MFA factor secrets.
