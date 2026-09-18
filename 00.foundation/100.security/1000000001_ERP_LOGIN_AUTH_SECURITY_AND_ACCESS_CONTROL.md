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

# ERP LOGIN / AUTH EXACT DATABASE SECURITY V1

canonical_extension: ERP_LOGIN_AUTH_EXACT_DDL_CANONICAL_V1

## RLS

RLS is enabled on all sixteen security authority tables.

Default access is deny.

No generic authenticated:

USING (true)

or:

WITH CHECK (true)

policy is permitted.

Direct ordinary anon/authenticated CRUD against security authority tables
is prohibited.

## PRIVILEGES

Security implementation must revoke inappropriate object privileges from
PUBLIC.

Only explicitly approved helper EXECUTE privileges may be exposed to
ordinary authenticated request paths.

Schema USAGE does not grant table DML.

## SECURITY DEFINER

Every security-definer function must:

- have trusted owner;
- use locked or empty search_path;
- schema-qualify objects;
- validate actor;
- validate Company;
- avoid dynamic caller-controlled SQL;
- return no secrets;
- log no secrets.

## HUMAN SESSION VALIDITY

Human ERP authorization fails closed when:

- provider subject missing;
- provider session reference missing;
- Provider Binding inactive;
- Login Account not ACTIVE;
- ERP Session not ACTIVE;
- ERP Session expired;
- authorization_version stale;
- selected Membership inactive;
- selected Membership ineffective;
- current AAL below Company requirement.

## PROVIDER SESSION LIFECYCLE

ERP does not FK security.authenticated_session to auth.sessions.

Provider lifecycle therefore cannot be blocked by ERP FK constraints.

Trusted runtime validation determines provider-session acceptability.

## LAST ADMIN GUARD

A DEFERRABLE constraint-trigger mechanism enforces the final effective
COMPANY_SYSTEM_ADMIN invariant.

It must support atomic replacement transactions.

## TEMPORAL CONSTRAINTS

Temporal non-overlap must not require installation of an unreviewed
PostgreSQL extension.

DEFERRABLE security constraint triggers are the canonical default.

## ROLE VALIDATION

Governed validation rejects:

- company role in login_account_role_assignment;
- system role in membership_role_assignment;
- service role in human assignments;
- non-service role in service_role_assignment;
- COMPANY_CUSTOM cross-company assignment;
- company service role without matching active Service Company Access.

## SERVICE CREDENTIAL

security.service_credential stores no secret value.

PHYSICAL_SERVICE_CREDENTIAL_STORE remains UNDECIDED.

Supabase service_role or equivalent provider-admin key is infrastructure
credential, not an individual AI Worker identity.

## AUDIT

Security events must not contain:

- passwords;
- password hashes;
- JWTs;
- refresh tokens;
- MFA secrets;
- invitation secrets;
- service secret material.

# ERP LOGIN / AUTH EXACT PRIVILEGE MATRIX V1

canonical_extension: ERP_LOGIN_AUTH_EXACT_DDL_PHYSICAL_EXACTNESS_V1

The following privilege statements define the canonical ordinary-client
security boundary.

After the sixteen tables and approved helper functions exist, the
implementation applies the equivalent of these exact privilege statements.

REVOKE ALL ON SCHEMA security FROM PUBLIC;
REVOKE ALL ON SCHEMA security FROM anon;

REVOKE ALL ON ALL TABLES IN SCHEMA security FROM PUBLIC;
REVOKE ALL ON ALL TABLES IN SCHEMA security FROM anon;
REVOKE ALL ON ALL TABLES IN SCHEMA security FROM authenticated;

REVOKE ALL ON ALL SEQUENCES IN SCHEMA security FROM PUBLIC;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA security FROM anon;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA security FROM authenticated;

REVOKE ALL ON ALL FUNCTIONS IN SCHEMA security FROM PUBLIC;
REVOKE ALL ON ALL FUNCTIONS IN SCHEMA security FROM anon;
REVOKE ALL ON ALL FUNCTIONS IN SCHEMA security FROM authenticated;

GRANT USAGE ON SCHEMA security TO authenticated;
GRANT USAGE ON SCHEMA security TO service_role;

GRANT EXECUTE
ON FUNCTION security.current_provider_session_reference()
TO authenticated;

GRANT EXECUTE
ON FUNCTION security.current_aal()
TO authenticated;

GRANT EXECUTE
ON FUNCTION security.current_login_account_id()
TO authenticated;

GRANT EXECUTE
ON FUNCTION security.current_authenticated_session_id()
TO authenticated;

GRANT EXECUTE
ON FUNCTION security.current_company_id()
TO authenticated;

GRANT EXECUTE
ON FUNCTION security.has_permission(text,text,text)
TO authenticated;

GRANT EXECUTE
ON FUNCTION security.current_provider_session_reference()
TO service_role;

GRANT EXECUTE
ON FUNCTION security.current_aal()
TO service_role;

GRANT EXECUTE
ON FUNCTION security.current_login_account_id()
TO service_role;

GRANT EXECUTE
ON FUNCTION security.current_authenticated_session_id()
TO service_role;

GRANT EXECUTE
ON FUNCTION security.current_company_id()
TO service_role;

GRANT EXECUTE
ON FUNCTION security.has_permission(text,text,text)
TO service_role;

No canonical direct table SELECT/INSERT/UPDATE/DELETE grant is made to:

- anon;
- authenticated;
- service_role

by this Login/Auth authority design.

Trusted migration/owner execution and explicitly governed SECURITY DEFINER
mutation routines are separate from client-role grants.

The presence of service_role in this EXECUTE matrix does not make
service_role an ERP actor identity.

A provider-wide service_role credential must never be used as attribution
for an individual AI Worker or Service Identity.

New security functions are not implicitly executable by ordinary callers.
Each newly introduced callable function requires an explicit reviewed GRANT.

# ERP LOGIN / AUTH EXACT FUNCTION EXECUTION SECURITY V1

canonical_extension: ERP_LOGIN_AUTH_EXACT_DDL_SEMANTIC_CLOSURE_V1

## SECURITY INVOKER FUNCTIONS

The following claim-only helpers are SECURITY INVOKER:

- security.current_provider_session_reference()
- security.current_aal()

They do not receive privileged authority-table access by function mode.

## SECURITY DEFINER AUTHORITY RESOLVERS

The following are SECURITY DEFINER:

- security.current_login_account_id()
- security.current_authenticated_session_id()
- security.current_company_id()
- security.has_permission(text,text,text)
- integration.my_company_id()

Every such function uses:

SET search_path = ''

Every referenced database object and function is schema-qualified.

No unqualified relation lookup is allowed.

No caller-controlled search_path participates in authority resolution.

## OWNERSHIP

SECURITY DEFINER ownership is restricted to a trusted governed owner.

The canonical implementation must not make:

- anon;
- authenticated

the owner of these functions.

EXECUTE grant does not convey ownership or direct table privileges.

## CLAIM TRUST BOUNDARY

Claim helpers may read only the trusted request-claim channel presented by
the authenticated Supabase/PostgREST request path.

A plain function argument supplied by the browser is not a trusted
replacement for:

- provider subject;
- session_id;
- AAL;
- selected Company.

## my_company_id COMPATIBILITY SECURITY

integration.my_company_id() remains a compatibility function, not an
independent authorization authority.

SECURITY DEFINER is used only to reach the protected
security.current_company_id() resolver while direct security-table access
remains denied to ordinary client roles.

The wrapper returns the result of the trusted resolver; it does not
reimplement membership selection.
