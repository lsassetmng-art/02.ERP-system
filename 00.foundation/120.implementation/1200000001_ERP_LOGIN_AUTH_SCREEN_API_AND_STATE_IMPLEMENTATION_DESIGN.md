# ERP LOGIN / AUTH SCREEN API AND STATE IMPLEMENTATION DESIGN

document_status: canonical
canonical_owner: 00.foundation
primary_ui: HTML/CommonOS
multilingual: required

## 1. UI routes

Required ERP route:

- /login

Protected ERP routes redirect unauthenticated browser users to /login
using a validated internal return target.

## 2. Login screen

Login screen includes:

- login identifier input
- credential input
- submit action
- localized validation/error area
- loading/authenticating state

Where recovery is implemented, a recovery entry may be provided.

No account-existence disclosure is required in the failure UI.

## 3. Company selection

If more than one active company membership exists, ERP must provide a company
selection step before company-scoped business operation.

The server returns only companies the authenticated account may enter.

## 4. Required API operations

Canonical internal API operations:

- POST /api/v1/auth/login
- POST /api/v1/auth/logout
- GET /api/v1/auth/session
- GET /api/v1/auth/companies
- POST /api/v1/auth/company-context

These endpoints are the ERP internal contract.
Provider-specific calls remain behind the authentication boundary.

## 5. Login response contract

Successful login returns or establishes:

- authenticated state
- safe Login Account projection
- company-context requirement state
- allowed next navigation

It must not return:

- credential secret
- password verifier
- raw provider secret
- unrestricted role/permission mutation authority

## 6. Session response contract

GET /api/v1/auth/session exposes a safe projection such as:

- login_account_id
- display identifier suitable for UI
- preferred locale
- account state necessary for UI
- current company reference where established
- company selection requirement
- effective session expiry indicator

## 7. Company-context request

POST /api/v1/auth/company-context accepts a requested company reference,
but the server must validate active membership before establishing it.

Client request is intent, not authority.

## 8. UI state model

Required states:

- unauthenticated
- authenticating
- authentication_failed
- authenticated_no_company
- company_selection_required
- authenticated_ready
- session_expired
- access_denied
- account_unavailable

## 9. Multilingual implementation

User-visible authentication text must be locale-resource driven.

Initial supported ERP locale contract must support at least the locales already
accepted by the surrounding CommonOS/ERP environment.

Hardcoded language-dependent business UI strings are prohibited.

## 10. Offline implementation

/login requires online authentication service availability.

If connectivity is lost after authenticated_ready:

- existing local authorized UI may enter offline mode
- new authentication is unavailable
- company switching is unavailable
- permission elevation is unavailable
- queued mutations require server revalidation before authoritative apply

## 11. Return navigation

After successful authentication/company selection:

- use only validated internal ERP return target
- otherwise use configured ERP home/default route

Open redirect behavior is prohibited.

## Canonical extension: human role administration

The administration UI/API must support:

- viewing Company Membership
- assigning multiple company-scoped roles
- grouping module roles by source module
- distinguishing business and approval roles
- showing administrative roles separately
- displaying effective and expired assignments
- preventing duplicate overlapping assignments

COMPANY_STAFF must not be presented as equivalent to all module access.

Role/permission administration must preserve source-module ownership of
module-specific permission semantics.

## Canonical extension: AI Worker administration

AI Worker has no human login screen.

Implementation must provide controlled administration for:

- Service Identity lifecycle
- Service Credential lifecycle
- explicit company access
- Service Role Assignment
- suspension/revocation
- credential rotation
- audit attribution

Protected service requests must resolve to execution_actor_context before
business API execution.

The physical provider, physical schema, secret storage product, and credential
transport remain implementation decisions requiring separate canonical
physical design acceptance.
