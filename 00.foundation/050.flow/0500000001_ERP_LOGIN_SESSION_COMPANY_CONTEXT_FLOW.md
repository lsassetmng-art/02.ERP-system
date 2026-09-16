# ERP LOGIN / SESSION / COMPANY CONTEXT FLOW

document_status: canonical
canonical_owner: 00.foundation

## 1. Unauthenticated entry

When an unauthenticated user requests a protected ERP screen:

1. retain a validated internal return target
2. redirect to /login
3. display localized login UI
4. do not expose whether a specific account exists

External/untrusted return URLs must not be accepted as open redirects.

## 2. Login

1. user submits login identifier and credential
2. server validates request controls
3. authentication provider verifies credential
4. provider subject is mapped to ERP Login Account
5. account lifecycle is validated
6. authenticated session is established
7. active company memberships are resolved

Failure at any step denies business access.

## 3. Company resolution

If active membership count is zero:

- state = authenticated_no_company
- business module access = denied

If active membership count is one:

- that company may become current company context

If active membership count is greater than one:

- state = company_selection_required
- user selects one permitted company
- server revalidates membership
- selected company becomes current context

## 4. Ready state

Before entering a company-scoped business module:

- session must be active
- account must be active
- current company must be valid
- membership must be active
- required permission must resolve to allowed

## 5. Company switch

Company switch flow:

1. request available active memberships
2. select target company
3. server validates membership
4. clear prior company-scoped authorization cache
5. establish new company context
6. audit the switch
7. reload company-scoped ERP state

Company switch while offline is prohibited.

## 6. Session expiry

When session expires:

- protected API requests fail authentication
- local UI enters session_expired state
- new authoritative sync/write is blocked
- user must authenticate again

## 7. Logout

Logout must:

- revoke/end the current session
- remove server-recognized login authority
- clear local session material
- clear current company context
- prevent reuse of the revoked session
- write security audit evidence

## 8. Account disable/revocation

When an account becomes disabled, suspended, or security-revoked:

- future login is denied as applicable
- active sessions are invalidated according to security policy
- company access is denied
- security event is audited

## 9. Offline transition

If connectivity is lost after authentication:

- already-open UI may retain permitted local state
- queued writes remain intents only
- privilege checks are not broadened
- company switch is blocked
- login/logout/account-management mutations are unavailable
- sync requires server-side revalidation after reconnection

## Canonical extension: human role resolution flow

After Login Account authentication and Company Membership validation:

1. establish the selected authorized company context
2. load all effective company-scoped role assignments for that membership
3. resolve role permissions
4. apply module permission semantics
5. deny any operation without an explicit authorization path

A user may hold multiple module roles in the same company.

Example shape:

Company Membership
-> accounting role
-> finance role
-> purchasing approval role

The role set is evaluated together; COMPANY_STAFF is not a substitute for
module-specific role assignment.

## Canonical extension: AI Worker execution flow

AI Worker execution flow:

1. authenticate Service Identity
2. validate Service Identity status
3. validate explicit Service Company Access
4. resolve effective Service Role Assignment
5. resolve shared permission definitions
6. construct trusted execution_actor_context
7. preserve requested_by Login Account when human-initiated
8. execute ERP operation
9. emit auditable actor/company/authorization evidence

Failure of any authentication, company-access, role, permission, or actor
validation denies the operation.

AI Worker must never be converted into a fake human Login Account merely to
satisfy an existing business-table actor field.
