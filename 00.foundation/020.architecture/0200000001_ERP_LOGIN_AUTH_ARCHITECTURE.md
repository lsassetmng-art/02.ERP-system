# ERP LOGIN / AUTH ARCHITECTURE

document_status: canonical
canonical_owner: 00.foundation

## 1. Architecture components

ERP login/auth architecture consists of:

1. Login Account
2. Authentication Provider Boundary
3. Authenticated Session
4. Company Membership Resolver
5. Current Company Context
6. Role Assignment
7. Permission Resolver
8. Authorization Enforcement
9. Security Audit
10. Login UI / Session UI

## 2. Trust boundary

The trusted authorization decision is server-side.

Browser, mobile wrapper, local storage, request body, query parameter,
and client-side JavaScript are not authorization authorities.

## 3. Login account

Login Account represents the identity permitted to authenticate to ERP.

It does not represent:

- HR employment
- a business partner
- a customer
- a supplier
- company master identity

Login Account may hold references to those domains where explicitly required.

## 4. Authentication provider boundary

Authentication Provider verifies credentials and returns an authenticated
subject mapped to exactly one ERP Login Account.

Provider-specific credential details do not leak into business modules.

External API/connector authentication remains separate from human ERP login.

## 5. Session architecture

A successful authentication establishes a server-recognized session.

A session contains or resolves:

- login account
- authentication time
- authentication strength
- issued time
- expiry
- revocation state
- current company context when established
- authorization version/snapshot reference where implemented

Session secrets are not business data.

## 6. Company context architecture

A login account can have:

- zero active company memberships
- one active company membership
- multiple active company memberships

Rules:

- zero -> login may authenticate but business ERP access is denied
- one -> company context may be selected automatically
- multiple -> user must select an authorized company before company-scoped work
- company switch requires server-side membership revalidation

## 7. Authorization architecture

Permission evaluation uses:

authenticated account
+ active membership
+ applicable role assignment
+ active role
+ role permission
+ resource/action context

No permission is inferred from:

- email address
- UI visibility
- HR job title alone
- client-supplied role
- company_id supplied by the browser alone

## 8. Role assignment architecture

Role assignment has two distinct paths:

- system-scope role -> Login Account
- company-scope role -> Company Membership

System-scope roles must not require a Company Membership merely to exist.

Company-scope roles must not be assigned directly to a Login Account while
bypassing Company Membership.

This separation prevents system authority and company authority from being
implicitly collapsed.

## 9. Permission semantics ownership

00.foundation owns common permission identity, assignment, resolution,
and enforcement mechanics.

Each source business module owns the semantic definition of its own protected
resources and actions.

A source module may define that a business operation requires a permission,
but it must consume the common authorization framework rather than create
competing login/session/membership authority.

## 10. Current company interface

integration.my_company_id() is an interface consumer of authenticated and
authorized company context.

It must not derive authority solely from untrusted client input.

Where no valid company context exists, company-scoped access must fail closed.

## 11. UI architecture

Primary ERP login UI is CommonOS-aligned HTML.

Required states:

- unauthenticated
- authenticating
- authenticated_no_company
- company_selection_required
- authenticated_ready
- session_expired
- account_locked_or_disabled
- authentication_failed

## 12. Physical implementation boundary

No physical database schema, table name, authentication provider, token format,
or password hashing implementation is canonicalized by this architecture file.

Those decisions require implementation review after logical acceptance.
