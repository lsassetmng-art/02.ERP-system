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

# ERP LOGIN / AUTH EXACT IMPLEMENTATION DESIGN V1

canonical_extension: ERP_LOGIN_AUTH_EXACT_DDL_CANONICAL_V1

The later 04 implementation bundle must contain separately reviewable
units for:

1. security schema creation
2. sixteen authority tables
3. PK/FK/CHECK constraints
4. ordinary and partial indexes
5. RLS enablement
6. privilege revocation
7. current-session/current-company helper functions
8. temporal constraint triggers
9. Role scope/category validation
10. last COMPANY_SYSTEM_ADMIN guard
11. authorization-version invalidation
12. explicit canonical Role/Permission bootstrap seeds
13. Provider Binding support
14. ERP Session binding
15. integration.my_company_id() compatibility replacement
16. twelve direct auth.uid() policy remediations
17. legacy actor migration after semantic classification
18. adoption verification
19. failure/forward-repair verification

Completed P0 migration history is not rewritten.

## CREATION DEPENDENCY ORDER

security schema
→ login_account
→ login_identity_binding
→ user_provisioning_request
→ company_membership
→ login_account_preference
→ company_auth_policy
→ role_definition
→ permission_definition
→ role_permission
→ human Role Assignments
→ service_identity
→ service_credential
→ service_company_access
→ service_role_assignment
→ authenticated_session
→ helper functions
→ constraint/invalidation triggers
→ RLS/grants
→ compatibility cutover.

## EXISTING PROVIDER USER

Current evidence contains one auth.users row while canonical ERP Login
Account persistence does not yet exist.

Discovery of auth.users does not automatically create ERP authorization.

Bootstrap requires governed provisioning/binding.

## PROVIDER REFERENCES

No implementation FK is created from security to:

- auth.users
- auth.identities
- auth.sessions
- auth.refresh_tokens

Provider integrity is established by trusted provisioning and runtime
validation.

## LEGACY ACTOR MIGRATION MATRIX

The fourteen currently empty core.app_user FK targets requiring
classification are:

- compliance.audit_action.owner_id
- core.company_users.user_id
- core.journal_entries.created_by
- core.login_history.user_id
- core.status_history.changed_by
- core.user_permissions.user_id
- hr.leave_request.approved_by
- purchase.purchase_order_header.created_by
- purchase.purchase_requisition.requester_id
- sales.billing_header.created_by
- sales.order_header.created_by
- sales.return_header.created_by
- sales.sales_quotation.created_by
- sales.shipping_header.created_by

For each target, the implementation bundle must record:

- current semantic;
- target actor class;
- target identifier;
- target FK/check strategy;
- RLS impact;
- compatibility impact;
- forward-repair strategy.

No automatic repoint is allowed.

## LEGACY ROLE DATA

Existing:

- governance.role
- governance.role_permission
- system.role_def
- system.role_screen_permission

are not automatically copied into canonical Role/Permission authority.

Explicit reviewed seeds are required.

COMPANY_STAFF receives no module privilege by default.

## PUBLIC BOUNDARY

No new security:

- table;
- sequence;
- materialized view;
- function/procedure

is created in public.

Existing public ordinary read-only compatibility views remain legacy
interfaces only.

## THIS CHANGE UNIT

This canonical change does not:

- CREATE SCHEMA security;
- CREATE any DB object;
- mutate 04;
- replace integration.my_company_id();
- modify RLS;
- migrate legacy data;
- stage;
- commit;
- push.

# ERP LOGIN / AUTH EXACT TRIGGER REGISTRY V1

canonical_extension: ERP_LOGIN_AUTH_EXACT_DDL_PHYSICAL_EXACTNESS_V1

## EXACT TRIGGER FUNCTION NAMES

The canonical security trigger-function registry is:

- security.fn_set_updated_at()
- security.fn_bump_own_authorization_version()
- security.fn_guard_company_membership_overlap()
- security.fn_guard_role_permission_overlap()
- security.fn_guard_login_account_role_overlap()
- security.fn_guard_membership_role_overlap()
- security.fn_guard_service_company_access_overlap()
- security.fn_guard_service_role_overlap()
- security.fn_validate_authenticated_session_company()
- security.fn_validate_login_account_role_assignment()
- security.fn_validate_membership_role_assignment()
- security.fn_validate_service_role_assignment()
- security.fn_guard_last_company_system_admin()
- security.fn_bump_human_authz_from_membership()
- security.fn_bump_human_authz_from_lara()
- security.fn_bump_human_authz_from_mra()
- security.fn_bump_authz_from_role_definition()
- security.fn_bump_authz_from_role_permission()
- security.fn_bump_service_authz_from_access()
- security.fn_bump_service_authz_from_sra()

These names are physical canonical names.

## UPDATED_AT TRIGGERS

The exact trigger names are:

CREATE TRIGGER trg_login_account__set_updated_at
BEFORE UPDATE ON security.login_account
FOR EACH ROW EXECUTE FUNCTION security.fn_set_updated_at();

CREATE TRIGGER trg_login_identity_binding__set_updated_at
BEFORE UPDATE ON security.login_identity_binding
FOR EACH ROW EXECUTE FUNCTION security.fn_set_updated_at();

CREATE TRIGGER trg_user_provisioning_request__set_updated_at
BEFORE UPDATE ON security.user_provisioning_request
FOR EACH ROW EXECUTE FUNCTION security.fn_set_updated_at();

CREATE TRIGGER trg_authenticated_session__set_updated_at
BEFORE UPDATE ON security.authenticated_session
FOR EACH ROW EXECUTE FUNCTION security.fn_set_updated_at();

CREATE TRIGGER trg_company_membership__set_updated_at
BEFORE UPDATE ON security.company_membership
FOR EACH ROW EXECUTE FUNCTION security.fn_set_updated_at();

CREATE TRIGGER trg_login_account_preference__set_updated_at
BEFORE UPDATE ON security.login_account_preference
FOR EACH ROW EXECUTE FUNCTION security.fn_set_updated_at();

CREATE TRIGGER trg_company_auth_policy__set_updated_at
BEFORE UPDATE ON security.company_auth_policy
FOR EACH ROW EXECUTE FUNCTION security.fn_set_updated_at();

CREATE TRIGGER trg_role_definition__set_updated_at
BEFORE UPDATE ON security.role_definition
FOR EACH ROW EXECUTE FUNCTION security.fn_set_updated_at();

CREATE TRIGGER trg_permission_definition__set_updated_at
BEFORE UPDATE ON security.permission_definition
FOR EACH ROW EXECUTE FUNCTION security.fn_set_updated_at();

CREATE TRIGGER trg_role_permission__set_updated_at
BEFORE UPDATE ON security.role_permission
FOR EACH ROW EXECUTE FUNCTION security.fn_set_updated_at();

CREATE TRIGGER trg_login_account_role_assignment__set_updated_at
BEFORE UPDATE ON security.login_account_role_assignment
FOR EACH ROW EXECUTE FUNCTION security.fn_set_updated_at();

CREATE TRIGGER trg_membership_role_assignment__set_updated_at
BEFORE UPDATE ON security.membership_role_assignment
FOR EACH ROW EXECUTE FUNCTION security.fn_set_updated_at();

CREATE TRIGGER trg_service_identity__set_updated_at
BEFORE UPDATE ON security.service_identity
FOR EACH ROW EXECUTE FUNCTION security.fn_set_updated_at();

CREATE TRIGGER trg_service_credential__set_updated_at
BEFORE UPDATE ON security.service_credential
FOR EACH ROW EXECUTE FUNCTION security.fn_set_updated_at();

CREATE TRIGGER trg_service_company_access__set_updated_at
BEFORE UPDATE ON security.service_company_access
FOR EACH ROW EXECUTE FUNCTION security.fn_set_updated_at();

CREATE TRIGGER trg_service_role_assignment__set_updated_at
BEFORE UPDATE ON security.service_role_assignment
FOR EACH ROW EXECUTE FUNCTION security.fn_set_updated_at();

## TEMPORAL CONSTRAINT TRIGGERS

CREATE CONSTRAINT TRIGGER ct_company_membership__no_overlap
AFTER INSERT OR UPDATE ON security.company_membership
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION security.fn_guard_company_membership_overlap();

CREATE CONSTRAINT TRIGGER ct_role_permission__no_overlap
AFTER INSERT OR UPDATE ON security.role_permission
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION security.fn_guard_role_permission_overlap();

CREATE CONSTRAINT TRIGGER ct_lara__no_overlap
AFTER INSERT OR UPDATE ON security.login_account_role_assignment
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION security.fn_guard_login_account_role_overlap();

CREATE CONSTRAINT TRIGGER ct_mra__no_overlap
AFTER INSERT OR UPDATE ON security.membership_role_assignment
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION security.fn_guard_membership_role_overlap();

CREATE CONSTRAINT TRIGGER ct_service_company_access__no_overlap
AFTER INSERT OR UPDATE ON security.service_company_access
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION security.fn_guard_service_company_access_overlap();

CREATE CONSTRAINT TRIGGER ct_service_role_assignment__no_overlap
AFTER INSERT OR UPDATE ON security.service_role_assignment
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION security.fn_guard_service_role_overlap();

The overlap routines serialize competing writes for the relevant natural
authorization key before validating overlap.

The implementation uses a transaction-scoped advisory lock derived from
the relevant identity/company/role key before reading competing effective
rows.

Hash collision may serialize unrelated transactions but must not permit an
overlap violation.

## ROLE / SESSION VALIDATION TRIGGERS

CREATE TRIGGER trg_authenticated_session__validate_company
BEFORE INSERT OR UPDATE
ON security.authenticated_session
FOR EACH ROW
EXECUTE FUNCTION security.fn_validate_authenticated_session_company();

CREATE TRIGGER trg_lara__validate_role
BEFORE INSERT OR UPDATE
ON security.login_account_role_assignment
FOR EACH ROW
EXECUTE FUNCTION security.fn_validate_login_account_role_assignment();

CREATE TRIGGER trg_mra__validate_role
BEFORE INSERT OR UPDATE
ON security.membership_role_assignment
FOR EACH ROW
EXECUTE FUNCTION security.fn_validate_membership_role_assignment();

CREATE TRIGGER trg_sra__validate_role
BEFORE INSERT OR UPDATE
ON security.service_role_assignment
FOR EACH ROW
EXECUTE FUNCTION security.fn_validate_service_role_assignment();

## FINAL COMPANY SYSTEM ADMIN GUARD

CREATE CONSTRAINT TRIGGER ct_company_membership__last_admin
AFTER UPDATE OR DELETE
ON security.company_membership
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION security.fn_guard_last_company_system_admin();

CREATE CONSTRAINT TRIGGER ct_membership_role_assignment__last_admin
AFTER UPDATE OR DELETE
ON security.membership_role_assignment
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION security.fn_guard_last_company_system_admin();

CREATE CONSTRAINT TRIGGER ct_role_definition__last_admin
AFTER UPDATE
ON security.role_definition
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION security.fn_guard_last_company_system_admin();

The guard evaluates effective ACTIVE Membership plus effective ACTIVE
COMPANY_SYSTEM_ADMIN assignment at transaction end.

A replacement and removal may therefore occur atomically in one
transaction without depending on statement order.

## AUTHORIZATION VERSION TRIGGERS

Login Account self-status change:

CREATE TRIGGER trg_login_account__authz_self
BEFORE UPDATE OF status
ON security.login_account
FOR EACH ROW
EXECUTE FUNCTION security.fn_bump_own_authorization_version();

Service Identity self-status change:

CREATE TRIGGER trg_service_identity__authz_self
BEFORE UPDATE OF status
ON security.service_identity
FOR EACH ROW
EXECUTE FUNCTION security.fn_bump_own_authorization_version();

Human Membership change:

CREATE TRIGGER trg_company_membership__authz
AFTER INSERT OR UPDATE OR DELETE
ON security.company_membership
FOR EACH ROW
EXECUTE FUNCTION security.fn_bump_human_authz_from_membership();

System human Role Assignment change:

CREATE TRIGGER trg_lara__authz
AFTER INSERT OR UPDATE OR DELETE
ON security.login_account_role_assignment
FOR EACH ROW
EXECUTE FUNCTION security.fn_bump_human_authz_from_lara();

Company human Role Assignment change:

CREATE TRIGGER trg_mra__authz
AFTER INSERT OR UPDATE OR DELETE
ON security.membership_role_assignment
FOR EACH ROW
EXECUTE FUNCTION security.fn_bump_human_authz_from_mra();

Role Definition authorization change:

CREATE TRIGGER trg_role_definition__authz
AFTER UPDATE
ON security.role_definition
FOR EACH ROW
EXECUTE FUNCTION security.fn_bump_authz_from_role_definition();

Role-Permission change:

CREATE TRIGGER trg_role_permission__authz
AFTER INSERT OR UPDATE OR DELETE
ON security.role_permission
FOR EACH ROW
EXECUTE FUNCTION security.fn_bump_authz_from_role_permission();

Service Company Access change:

CREATE TRIGGER trg_service_company_access__authz
AFTER INSERT OR UPDATE OR DELETE
ON security.service_company_access
FOR EACH ROW
EXECUTE FUNCTION security.fn_bump_service_authz_from_access();

Service Role Assignment change:

CREATE TRIGGER trg_sra__authz
AFTER INSERT OR UPDATE OR DELETE
ON security.service_role_assignment
FOR EACH ROW
EXECUTE FUNCTION security.fn_bump_service_authz_from_sra();

## AUTHORIZATION VERSION PROPAGATION

Role Definition and Role-Permission trigger functions must update every
currently affected human Login Account and Service Identity.

Human resolution paths are:

role_definition
→ login_account_role_assignment
→ login_account

and:

role_definition
→ membership_role_assignment
→ company_membership
→ login_account.

Service resolution path is:

role_definition
→ service_role_assignment
→ service_identity.

Role-Permission invalidation first resolves its role_definition_id and then
uses the same three assignment paths.

Each affected principal is incremented at most once per trigger execution.

authorization_version update is:

authorization_version = authorization_version + 1.

The implementation must not assign a lower value or reset the version.

## TRIGGER SECURITY

All security trigger functions:

- reside in schema security;
- are not created in public;
- are not directly callable by anon;
- are not directly callable by authenticated unless separately listed in
  the canonical EXECUTE matrix;
- use explicit schema-qualified object names;
- use a locked search_path when SECURITY DEFINER is required.

# ERP LOGIN / AUTH EXACT RESOLVER IMPLEMENTATION ATTRIBUTES V1

canonical_extension: ERP_LOGIN_AUTH_EXACT_DDL_SEMANTIC_CLOSURE_V1

The future 04 implementation bundle must encode the following function
attributes exactly.

## security.current_provider_session_reference()

- schema: security
- arguments: none
- return: text
- security mode: SECURITY INVOKER
- privileged security-table read: NO
- caller-controlled authority arguments: NONE

## security.current_aal()

- schema: security
- arguments: none
- return: text
- security mode: SECURITY INVOKER
- privileged security-table read: NO
- caller-controlled authority arguments: NONE

## security.current_login_account_id()

- schema: security
- arguments: none
- return: uuid
- security mode: SECURITY DEFINER
- search_path: empty
- schema-qualified references: REQUIRED

## security.current_authenticated_session_id()

- schema: security
- arguments: none
- return: uuid
- security mode: SECURITY DEFINER
- search_path: empty
- schema-qualified references: REQUIRED

## security.current_company_id()

- schema: security
- arguments: none
- return: uuid
- security mode: SECURITY DEFINER
- search_path: empty
- schema-qualified references: REQUIRED

## security.has_permission(text,text,text)

- schema: security
- arguments:
  - module_code text
  - resource_code text
  - action_code text
- return: boolean
- security mode: SECURITY DEFINER
- search_path: empty
- schema-qualified references: REQUIRED
- default result when unresolved: false

## integration.my_company_id()

- schema: integration
- arguments: none
- return: uuid
- security mode: SECURITY DEFINER
- search_path: empty
- schema-qualified references: REQUIRED
- canonical internal call:
  security.current_company_id()
- legacy core.company_users lookup: PROHIBITED
- LIMIT 1 Company selection: PROHIBITED

## SECURITY DEFINER SQL ATTRIBUTE

The equivalent implementation form for authority-reading helpers includes:

SECURITY DEFINER
SET search_path = ''

This exact search-path posture applies to the canonical resolver functions
above and to integration.my_company_id().

## CLAIM HELPER SQL ATTRIBUTE

Claim-only helpers are created explicitly as:

SECURITY INVOKER

and do not rely on implementation-default security mode being remembered
implicitly.

## ROLE DEFINITION PHYSICAL ENFORCEMENT

No Role Definition validation trigger is required solely for:

- MODULE_BUILTIN requiring module_code;
- COMPANY_CUSTOM prohibition on reserved common role codes.

Those two invariants are physically enforced by:

- ck_rd__module_origin;
- ck_rd__reserved_custom_code.

Other cross-row Role Assignment validation remains trigger-enforced as
already defined.
