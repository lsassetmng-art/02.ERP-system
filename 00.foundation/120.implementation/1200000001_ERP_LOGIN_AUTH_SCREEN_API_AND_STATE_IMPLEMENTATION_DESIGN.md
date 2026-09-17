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

# USER / ROLE / PREFERENCE / PHYSICAL AUTH IMPLEMENTATION DESIGN

canonical_extension: ERP_LOGIN_AUTH_PHYSICAL_AUTHORITY_USER_ROLE_LIFECYCLE_V1

primary_ui: HTML/CommonOS

Multilingual UI is mandatory.

## REQUIRED USER SURFACES

Human-facing surfaces include:

- Login;
- Company Selection;
- My Account / Profile;
- Language and Time Zone Preferences;
- Company Access Application;
- Invitation Acceptance status;
- Session / Logout surface as appropriate.

Company administration surfaces include:

- Access Applications;
- Invitations;
- Company Users / Memberships;
- User Membership Detail;
- Role Assignment;
- Company Custom Roles where enabled;
- Company Authentication Policy where enabled.

Security/service administration surfaces include:

- Service Identities;
- Service Company Access;
- Service Role Assignment;
- Service Credential lifecycle metadata.

## LOGIN SCREEN

Login screen must not require user to supply arbitrary company_id as an
authorization fact.

Provider authentication occurs before ERP authorization resolution.

## COMPANY SELECTION

Company selection displays only currently authorized active memberships.

Last selected company may be preselected only after revalidation.

## USER PROVISIONING API CAPABILITIES

The implementation must provide governed API capabilities for:

- submit company access application;
- list/review application by authorized company administrator;
- approve/reject application;
- create/resend/cancel invitation;
- bind verified provider identity;
- activate/suspend/disable Login Account according to authority;
- activate/suspend/end Company Membership.

Exact route naming may evolve only without changing these canonical
responsibility boundaries.

## USER PREFERENCE API CAPABILITIES

The implementation must support:

- read current UI preference;
- update preferred language;
- update preferred display time zone;
- update last selected company preference only after authorization
  validation.

Preference updates must not change Role or Membership.

## ROLE API CAPABILITIES

The implementation must support governed operations for:

- list effective roles;
- create permitted company custom role;
- update permitted company custom role;
- disable/deprecate permitted company custom role;
- grant role assignment;
- change assignment effective period where supported;
- end/revoke role assignment.

Built-in role mutation must be rejected.

## SESSION API

Existing canonical session API remains required.

GET /api/v1/auth/session must expose sufficient non-secret state for the
client to understand:

- authenticated Login Account;
- current company context;
- available company selection state where authorized;
- effective UI language;
- effective display time zone;
- required reauthentication/step-up state where applicable.

Sensitive provider tokens must not be returned unnecessarily.

## COMPANY CONTEXT API

POST /api/v1/auth/company-context remains the controlled company-selection
operation.

It must:

- validate active membership;
- validate account status;
- validate company security policy;
- update trusted ERP session context;
- update last-selected-company preference only after successful context
  selection;
- fail closed on stale membership.

## LOGOUT

Logout must terminate or invalidate the ERP session and invoke the
appropriate provider logout/session behavior according to implementation
policy.

## PASSWORD / MFA / RECOVERY UI

Password, verification, MFA enrollment, and provider recovery flows must
use supported provider mechanisms.

ERP screens may launch or coordinate those flows but must not become the
credential secret authority.

## USER REMOVAL UI

Company administration "remove user" must clearly mean removal from the
current company.

It must not imply global Login Account deletion.

Global disablement must be a separately authorized operation.

## ROLE SAFETY UI

The UI must distinguish:

- built-in role;
- company custom role;
- system scope;
- company scope;
- service role.

The UI must prevent or reject attempts to remove the last active
COMPANY_SYSTEM_ADMIN without a valid replacement/recovery path.

## LANGUAGE

Initial required UI language coverage:

- ja-jp;
- en-us.

Language architecture remains extensible.

Language change must not require re-login.

## TIME ZONE

Time-zone values must use IANA identifiers.

Display time-zone selection must not redefine company accounting/business
time zone.

## AI WORKER

AI Worker administration must not present a human password-login flow.

It requires:

- Service Identity lifecycle;
- Service Credential lifecycle;
- Service Company Access;
- Service Role Assignment;
- suspension/revocation;
- audit.
