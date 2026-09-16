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
