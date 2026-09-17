# ERP LOGIN / AUTH SECURITY AND ACCESS CONTROL

document_status: canonical
canonical_owner: 00.foundation

## 1. Security goals

The login/auth foundation protects:

- credential confidentiality
- session integrity
- account identity
- company isolation
- authorization integrity
- auditability

## 2. Transport

Authentication and authenticated ERP traffic require protected transport.

Credentials and session secrets must not be transmitted through unprotected
application channels.

## 3. Browser session protection

For browser implementations, session credentials must not be stored in normal
JavaScript-readable persistence such as localStorage when a safer protected
session mechanism is available.

Cookie-based implementations must use appropriate controls such as:

- Secure
- HttpOnly
- appropriate SameSite policy
- CSRF protection for state-changing requests

Exact physical mechanism is decided during implementation review.

## 4. Credential handling

Prohibited:

- plaintext password storage
- password logging
- password in URL/query string
- credential duplication in business tables
- credential storage in 52.master-data

If ERP directly stores password verifiers, an accepted adaptive one-way
password hashing mechanism is mandatory.

## 5. Brute-force protection

Authentication implementation must provide abuse controls such as:

- rate limiting
- throttling/backoff
- lock or challenge policy where appropriate
- security telemetry

Threshold values are configuration, not fixed by this canonical file.

## 6. Session protection

Session implementation must support:

- unpredictability
- expiry
- revocation
- rotation where required
- logout invalidation
- protection against fixation

## 7. Authorization enforcement

Business APIs must enforce authorization independently of UI controls.

Hidden buttons and hidden routes are not security controls.

## 8. Company isolation

A user cannot access company-scoped data solely by changing:

- request parameter
- URL
- browser storage
- client-side state

Current company must be validated against active membership server-side.

## 9. Security audit

Required security event classes include:

- AUTH_LOGIN_SUCCESS
- AUTH_LOGIN_FAILURE
- AUTH_LOGOUT
- AUTH_SESSION_REVOKED
- AUTH_ACCOUNT_LOCKED
- AUTH_ACCOUNT_SUSPENDED
- AUTH_ACCOUNT_DISABLED
- AUTH_CREDENTIAL_CHANGED
- AUTH_CREDENTIAL_RESET
- AUTH_COMPANY_CONTEXT_CHANGED
- AUTH_MEMBERSHIP_CHANGED
- AUTH_ROLE_CHANGED
- AUTH_PERMISSION_CHANGED

## 10. Secret exclusion

Security audit records must never contain:

- raw password
- raw session token
- recovery secret
- MFA shared secret
- connector credential secret

## 11. Fail-closed rule

Authentication/authorization infrastructure errors must not silently grant access.

## Canonical extension: role and service security

Role security requirements:

- multiple company roles must not bypass permission evaluation
- role name alone is not permission authority
- module role permissions are explicit
- approval roles are explicit
- separation-of-duties rules may constrain otherwise valid role combinations
- administrative role does not imply unrestricted business-data access

Service actor security requirements:

- AI Worker authenticates as Service Identity
- AI Worker must not possess a human password
- AI Worker must not reuse a human session
- company access must be validated before authorization
- Service Role Assignment must be effective and non-revoked
- least privilege is mandatory
- credential rotation must not require actor identity replacement
- credential values must never be emitted to logs
- Service Identity and human requester must remain distinguishable in evidence

Required security event classes additionally include:

- service_identity_authentication_succeeded
- service_identity_authentication_failed
- service_company_access_denied
- service_role_assignment_changed
- service_credential_rotated
- service_credential_revoked
- service_operation_authorized
- service_operation_denied

# PHYSICAL AUTHENTICATION AND LIFECYCLE SECURITY EXTENSION

canonical_extension: ERP_LOGIN_AUTH_PHYSICAL_AUTHORITY_USER_ROLE_LIFECYCLE_V1

## PROVIDER SECURITY

Authentication provider:

SUPABASE_AUTH.

Provider schema:

auth.

ERP must not store:

- plaintext passwords;
- password hashes owned by the provider;
- raw password reset secrets;
- raw email verification secrets;
- raw MFA factor secrets;
- provider administrative secret keys;
- raw invitation secrets.

## ERP SECURITY SCHEMA

ERP authentication/authorization security authority resides in:

security.

Security schema objects must not be exposed as public writable authority.

## FAIL-CLOSED ACCESS CHECK

A human request is allowed only after:

- provider authentication is trusted;
- provider identity binding is active;
- Login Account is ACTIVE;
- selected company context is valid where required;
- Company Membership is ACTIVE where required;
- effective roles are valid;
- effective permissions allow the operation.

Failure at any required stage denies access.

## SESSION SECURITY

ERP authenticated sessions must support revocation and expiry.

Account disablement must invalidate ERP sessions.

Membership suspension/end must invalidate affected selected-company
context.

Role changes must not leave stale permission grants effective
indefinitely.

Authorization versioning, re-resolution, or equivalent invalidation must
be used.

## MFA

MFA factor enrollment and secret material remain provider-managed.

ERP may evaluate provider-authenticated assurance and enforce company
policy.

A company requiring MFA must deny company-context activation until the
required assurance level is satisfied.

## RECOVERY

Password recovery, email verification, identity recovery, and MFA recovery
must not bypass ERP authorization checks.

Recovered provider identity must still map to a valid ERP Login Account.

## INVITATION SECURITY

Invitation references must be time-bounded where supported.

Raw invitation tokens must not be stored in ERP source-of-truth tables or
logs.

Expired/cancelled invitation must fail closed.

## COMPANY ADMIN BOUNDARY

Company administrators may suspend/end own-company membership when
authorized.

Company administrators must not disable the global account merely through
own-company removal.

## ROLE SECURITY

Role assignment requires:

- valid actor authority;
- valid target;
- correct scope;
- correct company boundary;
- correct role category;
- allowed grant boundary.

Service roles must not be assigned to human memberships.

Human company roles must not be assigned through Service Role Assignment.

## LAST ADMIN SAFETY

Removal of the last active COMPANY_SYSTEM_ADMIN must fail closed without
replacement/recovery authority.

## SERVICE IDENTITY SECURITY

AI Worker is Service Identity.

AI Worker must use least privilege.

Provider-wide unrestricted administrative/service keys must not be used
as the identity of an individual AI Worker.

security.service_credential stores credential metadata/reference only.

Plaintext service secret storage is prohibited.

## AUDIT EVENT REQUIREMENTS

Security/audit event categories must include at minimum:

- user access application submitted;
- user access application approved;
- user access application rejected;
- invitation created;
- invitation resent;
- invitation cancelled;
- invitation expired;
- provider identity bound;
- provider identity binding revoked;
- Login Account activated;
- Login Account suspended;
- Login Account disabled;
- Company Membership created;
- Company Membership activated;
- Company Membership suspended;
- Company Membership ended;
- company context selected;
- company context denied;
- Role Definition created;
- Role Definition changed;
- Role Definition disabled/deprecated;
- Role Assignment granted;
- Role Assignment changed;
- Role Assignment ended;
- user preference changed;
- authentication success/failure;
- MFA/step-up required/satisfied/failed as appropriate;
- logout/session revocation;
- Service Identity lifecycle changes;
- Service Credential rotation/revocation;
- service company access changes;
- service role changes;
- operation allowed/denied where required by security policy.

Sensitive credentials, raw authentication tokens, and secret material must
not appear in audit payloads.
