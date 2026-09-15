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
