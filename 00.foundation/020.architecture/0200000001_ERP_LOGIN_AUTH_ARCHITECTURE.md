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

## Canonical extension: role taxonomy architecture

Human company authorization resolves through:

Login Account
-> Company Membership
-> zero or more effective company-scoped role assignments
-> role permissions
-> permission decision

Role scope and role category are independent dimensions.

scope_type:

- system
- company

role_category:

- administrative
- business
- approval
- audit
- system
- service

A module-specific role carries a module association.

Cross-module/common administrative roles may have no module association.

Examples of module role families include:

- accounting business roles
- finance business roles
- sales business roles
- purchasing/procurement business roles
- inventory business roles
- HR business roles
- module-specific approval roles

These are role families, not a closed hard-coded list.

## Canonical extension: service actor architecture

AI Worker uses the non-human actor path:

Service Identity
-> explicit Service Company Access
-> Service Role Assignment
-> shared Permission Definition
-> authorization decision
-> ERP operation

Service actors reuse the common permission catalog and authorization engine.
They do not create a competing permission system.

Human role assignment and service role assignment remain separate.

AI Worker must not impersonate a human Login Account.

A human-requested AI Worker operation preserves both:

- effective actor = Service Identity
- requested_by = initiating human Login Account

An autonomous service operation may have no human requested_by value,
but the Service Identity remains mandatory.

# PHYSICAL AUTHORITY AND LIFECYCLE ARCHITECTURE

canonical_extension: ERP_LOGIN_AUTH_PHYSICAL_AUTHORITY_USER_ROLE_LIFECYCLE_V1

Earlier physical-provider/schema UNDECIDED statements are superseded by
this physical architecture decision.

## PROVIDER-MANAGED AUTHORITY

Authentication provider:

- SUPABASE_AUTH.

Provider-managed schema:

- auth.

Provider-managed objects include:

- auth.users;
- auth.identities;
- auth.sessions;
- auth.refresh_tokens;
- provider password/recovery/MFA mechanisms.

Provider objects do not become ERP authorization authority.

## ERP SECURITY AUTHORITY

ERP-owned physical schema:

- security.

ERP Security physical authorities:

- security.login_account;
- security.login_identity_binding;
- security.user_provisioning_request;
- security.authenticated_session;
- security.company_membership;
- security.login_account_preference;
- security.company_auth_policy;
- security.role_definition;
- security.permission_definition;
- security.role_permission;
- security.login_account_role_assignment;
- security.membership_role_assignment;
- security.service_identity;
- security.service_credential;
- security.service_company_access;
- security.service_role_assignment.

Company identity remains:

- core.company.

Company is not relocated by this change unit.

## HUMAN IDENTITY ARCHITECTURE

auth.users
→ security.login_identity_binding
→ security.login_account.

Provider UID and ERP Login Account ID are distinct identifiers.

The physical binding layer permits ERP identity to remain stable if
provider integration evolves.

## COMPANY LINKAGE ARCHITECTURE

security.login_account
→ security.company_membership
→ core.company.

A Login Account may have zero, one, or multiple Company Memberships.

Company Membership existence does not itself grant module permission.

## ROLE ARCHITECTURE

System-scoped human role:

security.login_account
→ security.login_account_role_assignment
→ security.role_definition.

Company-scoped human role:

security.login_account
→ security.company_membership
→ security.membership_role_assignment
→ security.role_definition.

Service role:

security.service_identity
→ security.service_role_assignment
→ security.role_definition.

The existing role_category model remains:

- administrative;
- business;
- approval;
- audit;
- system;
- service.

Role scope and role category remain independent.

Role origin is distinguished as:

- SYSTEM_BUILTIN;
- MODULE_BUILTIN;
- COMPANY_CUSTOM.

Built-in role definitions are not editable by ordinary company
administrators.

## SESSION AND COMPANY CONTEXT

Provider session evidence is mapped to:

- security.authenticated_session.

ERP session context contains an explicitly selected company context.

A selected company is valid only when the Login Account has a current
active Company Membership for that company.

Arbitrary LIMIT 1 membership selection is prohibited.

## USER PREFERENCE ARCHITECTURE

User preferences are separated from company membership and authorization.

security.login_account_preference owns:

- preferred UI language;
- preferred display time zone;
- last selected company preference.

Company defaults remain company configuration concerns.

Preference values never create authorization.

## COMPANY AUTH POLICY

security.company_auth_policy defines company-specific authentication
requirements such as:

- whether MFA is required for company access;
- session policy overrides where permitted;
- invitation expiry policy where permitted.

Provider secrets and factor material are not stored in this table.

## SERVICE IDENTITY ARCHITECTURE

AI Worker uses:

security.service_identity
→ security.service_company_access
→ security.service_role_assignment
→ security.role_definition
→ security.role_permission
→ security.permission_definition.

AI Worker does not use human Company Membership.

AI Worker does not use a human session.

Supabase service_role or an equivalent unrestricted provider administrative
key must not be treated as an individual AI Worker identity.
