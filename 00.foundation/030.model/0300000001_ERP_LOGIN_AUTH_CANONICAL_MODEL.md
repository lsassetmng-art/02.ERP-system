# ERP LOGIN / AUTH CANONICAL MODEL

document_status: canonical
canonical_owner: 00.foundation

## 1. Login Account

logical_object: login_account

Required logical fields:

- login_account_id
- login_identifier
- normalized_login_identifier
- account_status
- authentication_subject_reference
- authentication_provider_code
- preferred_locale
- created_at
- updated_at
- disabled_at_or_null

Allowed lifecycle states:

- invited
- active
- locked
- suspended
- disabled

Rules:

- login_account_id is stable ERP security identity
- login identifier normalization must be deterministic
- normalized_login_identifier is unique within the ERP human-login namespace
- the pair (authentication_provider_code, authentication_subject_reference) is unique
- account status is independent from HR employment status
- disabling a login account terminates ERP access
- raw credential secret is not a login_account field

## 2. Company Membership

logical_object: company_membership

Required logical fields:

- company_membership_id
- login_account_id
- company_id
- membership_status
- valid_from
- valid_to_or_null
- is_default
- created_at
- updated_at

Allowed membership states:

- active
- suspended
- revoked

Rules:

- company_id references existing accepted company authority
- membership does not create or redefine company identity
- revoked/suspended membership cannot establish company context
- default company must still pass active membership validation
- at most one simultaneously effective membership may exist for the same (login_account_id, company_id)
- historical successor membership rows are allowed when their effective periods do not overlap

## 3. Role Definition

logical_object: role_definition

Required logical fields:

- role_id
- role_code
- role_name
- role_status
- scope_type
- created_at
- updated_at

scope_type:

- system
- company

## 4. Permission Definition

logical_object: permission_definition

Required logical fields:

- permission_id
- permission_code
- resource_code
- action_code
- permission_status

Permission codes must be stable and auditable.

## 5. Role Permission

logical_object: role_permission

Required logical fields:

- role_id
- permission_id
- valid_from
- valid_to_or_null

## 6. Login Account Role Assignment

logical_object: login_account_role_assignment

Required logical fields:

- login_account_role_assignment_id
- login_account_id
- role_id
- assignment_status
- valid_from
- valid_to_or_null
- assigned_by_login_account_id_or_null
- created_at

Rules:

- this assignment path accepts system-scope roles only
- company-scope roles must not be assigned directly to Login Account
- assignment is explicit, effective-dated, and auditable
- revoked or expired assignment grants no authority

## 7. Membership Role Assignment

logical_object: membership_role_assignment

Required logical fields:

- role_assignment_id
- company_membership_id
- role_id
- assignment_status
- valid_from
- valid_to_or_null
- assigned_by_login_account_id_or_null
- created_at

Role assignment is explicit and auditable.

Rules:

- this assignment path accepts company-scope roles only
- system-scope roles must not be assigned through Company Membership
- company authority is derived through the active Company Membership
- revoked or expired assignment grants no authority

## 8. Authenticated Session

logical_object: authenticated_session

Required logical fields:

- session_id
- login_account_id
- authenticated_at
- expires_at
- revoked_at_or_null
- authentication_strength
- current_company_id_or_null
- last_seen_at_or_null

Rules:

- current_company_id requires active membership
- session revocation immediately removes authority
- expired session cannot authorize ERP business access
- session secret/token material is not part of business-domain storage

## 9. Credential model boundary

Credential material is owned by the selected authentication provider.

ERP canonical model stores only provider-safe references where needed.

If an internal password provider is implemented later:

- raw password storage is prohibited
- reversible password encryption is prohibited
- credential hashes must use an accepted adaptive one-way password algorithm
- password secret values must never appear in logs

## 10. External/service identity

Human Login Account is not the model for:

- connector credential
- bank API credential
- machine/service account
- external API client

Those identities require their own explicit contracts.

## 11. Role Definition Extension

The existing logical_object: role_definition is extended with required
logical classification fields:

- role_category
- module_code_or_null

Allowed role_category values:

- administrative
- business
- approval
- audit
- system
- service

Rules:

- scope_type and role_category are independent
- module-specific roles require module_code
- common cross-module roles may use module_code_or_null = null
- company-scoped roles are assigned through Company Membership
- system-scoped human roles are assigned through Login Account
- service role assignments use the dedicated service assignment model

Common human company role semantics:

COMPANY_SYSTEM_ADMIN:
- scope_type = company
- role_category = administrative
- module_code_or_null = null
- owns company-level ERP/security administration only through explicit permissions
- does not automatically imply all module business permissions

COMPANY_ADMIN:
- scope_type = company
- role_category = administrative
- module_code_or_null = null
- represents company management-side authority
- module business/approval permissions remain explicit

COMPANY_STAFF:
- scope_type = company
- role_category = business
- module_code_or_null = null
- represents minimal common company-user access
- grants no module-specific business permission merely by role name

Module-specific role codes are owned by the source module and are not
exhaustively fixed by Foundation.

## 12. Multiple Company Role Assignment Rule

The existing logical_object: membership_role_assignment supports multiple
effective role assignments for one Company Membership.

Rules:

- one Company Membership may have zero or more effective roles
- the same effective role must not be duplicated for the same membership
- overlapping duplicate assignments for the same membership and role are prohibited
- business roles and approval roles may coexist
- administrative and module roles may coexist
- permission evaluation is the union of explicitly effective allowed permissions,
  subject to deny-by-default and any explicit separation-of-duties rule
- Company Membership existence alone grants no module permission

## 13. Service Identity

AI_WORKER_SERVICE_IDENTITY_CANONICAL_EXTENSION=DEFINED

logical_object: service_identity

Required logical fields:

- service_identity_id
- service_identity_code
- service_identity_type
- display_name
- status
- authentication_provider_code_or_null
- authentication_subject_reference_or_null
- created_at
- updated_at

Rules:

- service_identity_type includes AI_WORKER
- Service Identity is not a Login Account
- Service Identity is not Person
- Service Identity is not Employee
- Service Identity must not use human password login
- Service Identity lifecycle is independently revocable
- physical authentication provider remains separately decided

## 14. Service Credential

logical_object: service_credential

Required logical fields:

- service_credential_id
- service_identity_id
- credential_type
- credential_reference_secret_key
- status
- valid_from
- valid_to_or_null
- rotated_at_or_null
- created_at

Rules:

- plaintext service secrets are prohibited
- credential material must be referenced through an approved secret mechanism
- credential expiry/revocation immediately removes authentication capability
- one Service Identity may support credential rotation without changing identity

## 15. Service Company Access

logical_object: service_company_access

Required logical fields:

- service_company_access_id
- service_identity_id
- company_id
- status
- valid_from
- valid_to_or_null
- created_at

Rules:

- AI Worker company access is explicit
- no implicit company access is derived from human membership
- at most one simultaneously effective access row may exist for the same
  (service_identity_id, company_id)
- historical non-overlapping successor rows are allowed

## 16. Service Role Assignment

logical_object: service_role_assignment

Required logical fields:

- service_role_assignment_id
- service_identity_id
- service_company_access_id_or_null
- role_id
- assignment_status
- valid_from
- valid_to_or_null
- created_at

Rules:

- assigned role must have role_category = service
- company-scoped service role requires an active service_company_access
- system-scoped service role must not fabricate company membership
- human membership_role_assignment is prohibited for Service Identity
- service_role_assignment is prohibited for human Login Account
- Service Identity uses the shared permission_definition and role_permission models
- least privilege is mandatory

## 17. Trusted Execution Actor Context

ACTOR_ATTRIBUTION_CANONICAL_EXTENSION=DEFINED

logical_object: execution_actor_context

Required logical fields:

- actor_type
- actor_login_account_id_or_null
- actor_service_identity_id_or_null
- company_id_or_null
- requested_by_login_account_id_or_null
- authentication_context_reference
- authorization_context_reference
- issued_at
- expires_at_or_null

Allowed actor_type values:

- HUMAN
- SERVICE

Rules:

- HUMAN requires actor_login_account_id
- HUMAN prohibits actor_service_identity_id
- SERVICE requires actor_service_identity_id
- SERVICE prohibits actor_login_account_id
- company_id must come from trusted authenticated/authorized context
- client self-asserted actor identity or company identity is not trusted
- human-initiated Service execution preserves requested_by_login_account_id
- autonomous Service execution may leave requested_by_login_account_id null

# PHYSICAL SECURITY MODEL EXTENSION

canonical_extension: ERP_LOGIN_AUTH_PHYSICAL_AUTHORITY_USER_ROLE_LIFECYCLE_V1

This model resolves the physical ERP Security authority to schema security.
Any earlier physical schema/provider UNDECIDED statement is superseded.

## security.login_account

Purpose:

ERP-owned stable human Login Account.

Minimum physical attributes:

- login_account_id;
- login_identifier;
- normalized_login_identifier;
- display_name_or_null;
- status;
- created_at;
- updated_at;
- suspended_at_or_null;
- disabled_at_or_null.

Allowed lifecycle states:

- INVITED;
- ACTIVE;
- SUSPENDED;
- DISABLED.

normalized_login_identifier must be unique according to the canonical
normalization rule.

Login Account is not Company Membership.

Login Account is not Employee.

Login Account is not Person.

Login Account is not Service Identity.

## security.login_identity_binding

Purpose:

Bind an ERP Login Account to an authentication-provider identity.

Minimum attributes:

- login_identity_binding_id;
- login_account_id;
- authentication_provider_code;
- authentication_subject_reference;
- binding_status;
- is_primary;
- bound_at;
- revoked_at_or_null.

Required invariant:

(authentication_provider_code, authentication_subject_reference)
must be unique.

For SUPABASE_AUTH, authentication_subject_reference represents the
provider user UID originating from auth.users.

Provider UID must never be fabricated by a company administrator.

A binding may not be considered active until the provider identity has
been verified through the trusted provider flow.

## security.user_provisioning_request

Purpose:

Represent company access application and company invitation as one
governed provisioning lifecycle.

Minimum attributes:

- user_provisioning_request_id;
- company_id;
- provisioning_method;
- requested_login_identifier;
- normalized_requested_login_identifier;
- applicant_provider_subject_reference_or_null;
- status;
- requested_by_login_account_id_or_null;
- approved_by_login_account_id_or_null;
- rejected_by_login_account_id_or_null;
- provider_invitation_reference_or_null;
- expires_at_or_null;
- created_at;
- updated_at;
- completed_at_or_null.

provisioning_method:

- APPLICATION;
- INVITATION;
- BOOTSTRAP.

status includes:

- PENDING;
- APPROVED;
- REJECTED;
- EXPIRED;
- CANCELLED;
- COMPLETED.

Provider invitation secrets or raw invitation tokens must not be stored.

## security.company_membership

Purpose:

Authoritative company-to-human-login relationship.

Minimum attributes:

- company_membership_id;
- company_id;
- login_account_id;
- status;
- effective_from;
- effective_to_or_null;
- created_at;
- updated_at.

company_id references the current company authority core.company.

status:

- INVITED;
- ACTIVE;
- SUSPENDED;
- ENDED.

At most one simultaneously effective membership is allowed for the same
(login_account_id, company_id).

Historical non-overlapping memberships are allowed.

Ending one company's membership must not disable the global Login Account.

## security.login_account_preference

Purpose:

Human user UI/display preferences.

Minimum attributes:

- login_account_id;
- preferred_language_code_or_null;
- preferred_time_zone_or_null;
- last_selected_company_id_or_null;
- created_at;
- updated_at.

Language code uses the governed supported BCP 47 locale registry.

Time zone uses an IANA time-zone identifier.

last_selected_company_id is not authorization authority.

It must be revalidated against active Company Membership before automatic
company selection.

User UI language is separate from document language.

User display time zone is separate from company business time zone.

Locale must not determine accounting or document currency.

## security.authenticated_session

Purpose:

ERP session and trusted company-context authority layered over provider
session evidence.

Minimum attributes:

- authenticated_session_id;
- login_account_id;
- authentication_provider_code;
- provider_session_reference;
- status;
- selected_company_id_or_null;
- issued_at;
- expires_at;
- last_seen_at_or_null;
- revoked_at_or_null;
- authorization_version_or_equivalent.

status:

- ACTIVE;
- EXPIRED;
- REVOKED.

selected_company_id is valid only while active Company Membership exists.

Company context must fail closed if membership becomes inactive.

Permission evaluation must not rely indefinitely on stale role data.

Role or membership changes must invalidate or refresh the effective
authorization state.

## security.company_auth_policy

Purpose:

ERP-owned company authentication policy without storing provider secrets.

Minimum policy concepts:

- company_id;
- require_mfa;
- session_policy_or_default;
- invitation_expiry_policy_or_default;
- status;
- created_at;
- updated_at.

MFA factor secrets remain provider-owned.

A company requiring stronger authentication may require step-up before
company context becomes active.

## security.role_definition

Existing logical Role Definition is physically owned here.

Minimum physical concepts:

- role_definition_id;
- role_code;
- role_name;
- scope_type;
- role_category;
- module_code_or_null;
- role_origin;
- owner_company_id_or_null;
- status;
- is_reserved;
- created_at;
- updated_at.

scope_type:

- system;
- company.

role_category:

- administrative;
- business;
- approval;
- audit;
- system;
- service.

role_origin:

- SYSTEM_BUILTIN;
- MODULE_BUILTIN;
- COMPANY_CUSTOM.

Built-in roles have no ordinary company-edit authority.

COMPANY_CUSTOM roles require company scope and an owning company.

Reserved common company roles include:

- COMPANY_SYSTEM_ADMIN;
- COMPANY_ADMIN;
- COMPANY_STAFF.

COMPANY_STAFF does not imply all module permissions.

## security.permission_definition

Physical authority for common permission definitions.

Minimum concepts:

- permission_definition_id;
- resource_code;
- action_code;
- module_code_or_null;
- status;
- created_at;
- updated_at.

Business modules remain semantic owners of their module-specific
resource/action meaning.

## security.role_permission

Physical authority for Role-to-Permission assignment.

Only effective role-permission relationships contribute permission.

## security.login_account_role_assignment

Physical authority for system-scoped human role assignment.

Company-scoped roles must not be assigned here.

Assignment lifecycle must preserve history.

## security.membership_role_assignment

Physical authority for company-scoped human role assignment.

Minimum concepts:

- membership_role_assignment_id;
- company_membership_id;
- role_definition_id;
- effective_from;
- effective_to_or_null;
- assignment_status;
- granted_by_login_account_id_or_null;
- created_at;
- updated_at.

Multiple effective company roles per membership are allowed.

Overlapping duplicate assignment of the same effective membership and role
is prohibited.

## ROLE DEFINITION LIFECYCLE

Role Definition supports:

- create;
- update;
- disable;
- deprecate.

Hard delete is prohibited by default.

Built-in role definitions may not be edited as company custom roles.

Company administrators may manage only permitted company-scoped custom
roles for their own company.

## ROLE ASSIGNMENT LIFECYCLE

Role Assignment supports:

- grant;
- change effective period;
- end/revoke.

History must remain auditable.

A company administrator must not grant a role outside that administrator's
authorized grant boundary.

## LAST COMPANY SYSTEM ADMIN GUARD

A transition that would leave a company with no active
COMPANY_SYSTEM_ADMIN must be rejected unless an explicitly governed
replacement or recovery path is established.

## HUMAN ACCOUNT REMOVAL SEMANTICS

Company-level removal:

- end effective Role Assignments for that company;
- end or suspend that Company Membership;
- preserve the global Login Account;
- preserve memberships in other companies.

Global account disable:

- requires authority outside ordinary single-company removal;
- disables ERP Login Account access globally;
- must revoke or invalidate effective ERP sessions.

Hard delete is not the default user-removal mechanism.

## EMPLOYEE LINKAGE

Employee linkage is optional.

An ERP Login Account may represent a non-employee external user.

An Employee record does not automatically create a Login Account.

## SERVICE IDENTITY PHYSICAL MODEL

security.service_identity is the physical authority for AI Worker and other
service actors.

security.service_credential is the metadata authority for service
credential references, rotation, revocation, and lifecycle.

Plaintext service secrets are prohibited.

The physical external secret store remains a separately decided
implementation concern.

security.service_company_access is the company-access authority for
Service Identity.

security.service_role_assignment is the Service Identity role-assignment
authority.

Only role_category=service roles may be assigned by
service_role_assignment.

## EXECUTION ACTOR CONTEXT

Execution Actor Context remains a trusted runtime context.

Default physical persistence as a standalone source-of-truth table is not
required.

Human context derives from authenticated Login Account/session/company
context.

Service context derives from authenticated Service Identity/company
access.

Human-initiated service execution preserves requested-by attribution.

# ERP LOGIN / AUTH EXACT PHYSICAL MODEL V1

canonical_extension: ERP_LOGIN_AUTH_EXACT_DDL_CANONICAL_V1

Unless explicitly stated otherwise:

- primary IDs are uuid;
- uuid default is gen_random_uuid();
- timestamps are timestamptz;
- created_at defaults to now();
- mutable authority rows include updated_at;
- status values are constrained;
- effective_to must be null or greater than effective_from.

## 1. security.login_account

Columns:

- login_account_id uuid NOT NULL DEFAULT gen_random_uuid()
- login_identifier text NOT NULL
- normalized_login_identifier text NOT NULL
- display_name text NULL
- status text NOT NULL
- authorization_version bigint NOT NULL DEFAULT 1
- created_at timestamptz NOT NULL DEFAULT now()
- updated_at timestamptz NOT NULL DEFAULT now()
- suspended_at timestamptz NULL
- disabled_at timestamptz NULL

Primary key:

- login_account_id

Unique:

- normalized_login_identifier

Status:

- INVITED
- ACTIVE
- SUSPENDED
- DISABLED

Checks:

- normalized_login_identifier must not be blank
- authorization_version > 0

Provider subject is not stored as account identity authority here.

## 2. security.login_identity_binding

Columns:

- login_identity_binding_id uuid NOT NULL DEFAULT gen_random_uuid()
- login_account_id uuid NOT NULL
- authentication_provider_code text NOT NULL
- authentication_subject_reference text NOT NULL
- binding_status text NOT NULL
- is_primary boolean NOT NULL DEFAULT true
- bound_at timestamptz NOT NULL DEFAULT now()
- revoked_at timestamptz NULL
- created_at timestamptz NOT NULL DEFAULT now()
- updated_at timestamptz NOT NULL DEFAULT now()

Primary key:

- login_identity_binding_id

Foreign key:

- login_account_id
  → security.login_account(login_account_id)

Status:

- ACTIVE
- REVOKED

Unique:

- authentication_provider_code + authentication_subject_reference

Partial unique requirements:

- one ACTIVE binding per
  login_account_id + authentication_provider_code
- one ACTIVE primary binding per login_account_id

Provider-managed FK to auth.users is prohibited.

For SUPABASE_AUTH the subject reference is auth.users.id serialized as
canonical text.

## 3. security.user_provisioning_request

Columns:

- user_provisioning_request_id uuid NOT NULL DEFAULT gen_random_uuid()
- company_id uuid NOT NULL
- provisioning_method text NOT NULL
- requested_login_identifier text NOT NULL
- normalized_requested_login_identifier text NOT NULL
- applicant_provider_subject_reference text NULL
- status text NOT NULL
- requested_by_login_account_id uuid NULL
- approved_by_login_account_id uuid NULL
- rejected_by_login_account_id uuid NULL
- provider_invitation_reference text NULL
- completed_login_account_id uuid NULL
- expires_at timestamptz NULL
- completed_at timestamptz NULL
- created_at timestamptz NOT NULL DEFAULT now()
- updated_at timestamptz NOT NULL DEFAULT now()

Primary key:

- user_provisioning_request_id

Foreign keys:

- company_id → core.company(company_id)
- requested_by_login_account_id
  → security.login_account(login_account_id)
- approved_by_login_account_id
  → security.login_account(login_account_id)
- rejected_by_login_account_id
  → security.login_account(login_account_id)
- completed_login_account_id
  → security.login_account(login_account_id)

Provisioning methods:

- APPLICATION
- INVITATION
- BOOTSTRAP

Status:

- PENDING
- APPROVED
- REJECTED
- EXPIRED
- CANCELLED
- COMPLETED

A partial unique index prevents multiple open PENDING/APPROVED requests for
the same company_id and normalized_requested_login_identifier.

Raw provider invitation tokens or secrets are prohibited.

## 4. security.authenticated_session

Columns:

- authenticated_session_id uuid NOT NULL DEFAULT gen_random_uuid()
- login_account_id uuid NOT NULL
- authentication_provider_code text NOT NULL
- provider_session_reference text NOT NULL
- status text NOT NULL
- selected_company_id uuid NULL
- authorization_version bigint NOT NULL
- issued_at timestamptz NOT NULL DEFAULT now()
- expires_at timestamptz NOT NULL
- last_seen_at timestamptz NULL
- revoked_at timestamptz NULL
- created_at timestamptz NOT NULL DEFAULT now()
- updated_at timestamptz NOT NULL DEFAULT now()

Primary key:

- authenticated_session_id

Foreign keys:

- login_account_id
  → security.login_account(login_account_id)
- selected_company_id
  → core.company(company_id)

Unique:

- authentication_provider_code + provider_session_reference

Status:

- ACTIVE
- EXPIRED
- REVOKED

Checks:

- authorization_version > 0
- expires_at > issued_at

No FK is created to auth.sessions.

For SUPABASE_AUTH provider_session_reference correlates with the trusted
JWT session_id claim and auth.sessions.id.

Raw access token and refresh token storage are prohibited.

selected_company_id is valid only with an effective ACTIVE Membership for
the same Login Account and Company.

## 5. security.company_membership

Columns:

- company_membership_id uuid NOT NULL DEFAULT gen_random_uuid()
- company_id uuid NOT NULL
- login_account_id uuid NOT NULL
- source_provisioning_request_id uuid NULL
- status text NOT NULL
- effective_from timestamptz NOT NULL DEFAULT now()
- effective_to timestamptz NULL
- created_at timestamptz NOT NULL DEFAULT now()
- updated_at timestamptz NOT NULL DEFAULT now()

Primary key:

- company_membership_id

Foreign keys:

- company_id → core.company(company_id)
- login_account_id
  → security.login_account(login_account_id)
- source_provisioning_request_id
  → security.user_provisioning_request(user_provisioning_request_id)

Status:

- INVITED
- ACTIVE
- SUSPENDED
- ENDED

Check:

- effective_to IS NULL OR effective_to > effective_from

Partial unique requirement:

At most one open Membership for the same:

- company_id
- login_account_id

where status is INVITED, ACTIVE, or SUSPENDED.

Historical non-overlapping Memberships are allowed.

Temporal overlap is prohibited.

Temporal overlap is enforced by a DEFERRABLE security constraint trigger
without requiring a new PostgreSQL extension.

## 6. security.login_account_preference

Columns:

- login_account_id uuid NOT NULL
- preferred_language_code text NULL
- preferred_time_zone text NULL
- last_selected_company_id uuid NULL
- created_at timestamptz NOT NULL DEFAULT now()
- updated_at timestamptz NOT NULL DEFAULT now()

Primary key:

- login_account_id

Foreign keys:

- login_account_id
  → security.login_account(login_account_id)
- last_selected_company_id
  → core.company(company_id)

preferred_language_code is governed as BCP 47.

preferred_time_zone is governed as an IANA time-zone identifier.

Preference values grant no authorization.

last_selected_company_id must always be revalidated before reuse.

## 7. security.company_auth_policy

Columns:

- company_id uuid NOT NULL
- required_aal text NOT NULL DEFAULT 'aal1'
- session_idle_timeout_seconds integer NULL
- session_absolute_timeout_seconds integer NULL
- invitation_ttl_seconds integer NULL
- status text NOT NULL DEFAULT 'ACTIVE'
- created_at timestamptz NOT NULL DEFAULT now()
- updated_at timestamptz NOT NULL DEFAULT now()

Primary key:

- company_id

Foreign key:

- company_id → core.company(company_id)

required_aal:

- aal1
- aal2

Status:

- ACTIVE
- DISABLED

Checks:

- timeout values must be positive when non-null
- invitation_ttl_seconds must be positive when non-null

Provider MFA secrets are never persisted here.

## 8. security.role_definition

Columns:

- role_definition_id uuid NOT NULL DEFAULT gen_random_uuid()
- role_code text NOT NULL
- role_name text NOT NULL
- scope_type text NOT NULL
- role_category text NOT NULL
- module_code text NULL
- role_origin text NOT NULL
- owner_company_id uuid NULL
- status text NOT NULL
- is_reserved boolean NOT NULL DEFAULT false
- created_at timestamptz NOT NULL DEFAULT now()
- updated_at timestamptz NOT NULL DEFAULT now()

Primary key:

- role_definition_id

Foreign key:

- owner_company_id → core.company(company_id)

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

role_origin:

- SYSTEM_BUILTIN
- MODULE_BUILTIN
- COMPANY_CUSTOM

Status:

- ACTIVE
- DISABLED
- DEPRECATED
- RETIRED

Rules:

- COMPANY_CUSTOM requires scope_type=company
- COMPANY_CUSTOM requires owner_company_id
- non-COMPANY_CUSTOM requires owner_company_id IS NULL
- MODULE_BUILTIN requires module_code
- COMPANY_CUSTOM cannot take reserved common role codes
- reserved roles are not mutated through ordinary company role APIs

Unique requirements:

- built-in role_code unique where owner_company_id IS NULL
- company custom role_code unique within owner_company_id

Reserved common role codes include:

- COMPANY_SYSTEM_ADMIN
- COMPANY_ADMIN
- COMPANY_STAFF

## 9. security.permission_definition

Columns:

- permission_definition_id uuid NOT NULL DEFAULT gen_random_uuid()
- module_code text NULL
- resource_code text NOT NULL
- action_code text NOT NULL
- description text NULL
- status text NOT NULL DEFAULT 'ACTIVE'
- created_at timestamptz NOT NULL DEFAULT now()
- updated_at timestamptz NOT NULL DEFAULT now()

Primary key:

- permission_definition_id

Status:

- ACTIVE
- DISABLED
- DEPRECATED
- RETIRED

Partial unique indexes:

When module_code IS NULL:

- resource_code + action_code

When module_code IS NOT NULL:

- module_code + resource_code + action_code

Business permission meaning remains owned by the source business module.

## 10. security.role_permission

Columns:

- role_permission_id uuid NOT NULL DEFAULT gen_random_uuid()
- role_definition_id uuid NOT NULL
- permission_definition_id uuid NOT NULL
- status text NOT NULL DEFAULT 'ACTIVE'
- effective_from timestamptz NOT NULL DEFAULT now()
- effective_to timestamptz NULL
- granted_by_login_account_id uuid NULL
- created_at timestamptz NOT NULL DEFAULT now()
- updated_at timestamptz NOT NULL DEFAULT now()

Primary key:

- role_permission_id

Foreign keys:

- role_definition_id
  → security.role_definition(role_definition_id)
- permission_definition_id
  → security.permission_definition(permission_definition_id)
- granted_by_login_account_id
  → security.login_account(login_account_id)

Status:

- ACTIVE
- ENDED

Rules:

- effective_to IS NULL OR effective_to > effective_from
- one open ACTIVE Role/Permission relationship per pair
- overlapping effective Role/Permission periods are prohibited

## 11. security.login_account_role_assignment

Purpose:

System-scoped human Role Assignment.

Columns:

- login_account_role_assignment_id uuid NOT NULL DEFAULT gen_random_uuid()
- login_account_id uuid NOT NULL
- role_definition_id uuid NOT NULL
- status text NOT NULL DEFAULT 'ACTIVE'
- effective_from timestamptz NOT NULL DEFAULT now()
- effective_to timestamptz NULL
- granted_by_login_account_id uuid NULL
- created_at timestamptz NOT NULL DEFAULT now()
- updated_at timestamptz NOT NULL DEFAULT now()

Primary key:

- login_account_role_assignment_id

Foreign keys:

- login_account_id
  → security.login_account(login_account_id)
- role_definition_id
  → security.role_definition(role_definition_id)
- granted_by_login_account_id
  → security.login_account(login_account_id)

Rules:

- only scope_type=system roles
- role_category=service prohibited
- one open ACTIVE assignment per Login Account/Role
- overlapping effective periods prohibited

## 12. security.membership_role_assignment

Purpose:

Company-scoped human Role Assignment.

Columns:

- membership_role_assignment_id uuid NOT NULL DEFAULT gen_random_uuid()
- company_membership_id uuid NOT NULL
- role_definition_id uuid NOT NULL
- status text NOT NULL DEFAULT 'ACTIVE'
- effective_from timestamptz NOT NULL DEFAULT now()
- effective_to timestamptz NULL
- granted_by_login_account_id uuid NULL
- created_at timestamptz NOT NULL DEFAULT now()
- updated_at timestamptz NOT NULL DEFAULT now()

Primary key:

- membership_role_assignment_id

Foreign keys:

- company_membership_id
  → security.company_membership(company_membership_id)
- role_definition_id
  → security.role_definition(role_definition_id)
- granted_by_login_account_id
  → security.login_account(login_account_id)

Rules:

- only scope_type=company roles
- role_category=service prohibited
- COMPANY_CUSTOM owner_company_id must match Membership company_id
- one open ACTIVE assignment per Membership/Role
- overlapping effective periods prohibited
- last active COMPANY_SYSTEM_ADMIN guard applies

## 13. security.service_identity

Columns:

- service_identity_id uuid NOT NULL DEFAULT gen_random_uuid()
- service_code text NOT NULL
- display_name text NOT NULL
- service_identity_type text NOT NULL
- status text NOT NULL
- authorization_version bigint NOT NULL DEFAULT 1
- created_at timestamptz NOT NULL DEFAULT now()
- updated_at timestamptz NOT NULL DEFAULT now()
- suspended_at timestamptz NULL
- disabled_at timestamptz NULL
- retired_at timestamptz NULL

Primary key:

- service_identity_id

Unique:

- service_code

service_identity_type includes:

- AI_WORKER
- SERVICE

Status:

- PROVISIONED
- ACTIVE
- SUSPENDED
- DISABLED
- RETIRED

Check:

- authorization_version > 0

Service Identity is never Login Account.

## 14. security.service_credential

Columns:

- service_credential_id uuid NOT NULL DEFAULT gen_random_uuid()
- service_identity_id uuid NOT NULL
- credential_type text NOT NULL
- credential_reference text NOT NULL
- status text NOT NULL
- valid_from timestamptz NOT NULL DEFAULT now()
- expires_at timestamptz NULL
- rotated_from_service_credential_id uuid NULL
- revoked_at timestamptz NULL
- created_at timestamptz NOT NULL DEFAULT now()
- updated_at timestamptz NOT NULL DEFAULT now()

Primary key:

- service_credential_id

Foreign keys:

- service_identity_id
  → security.service_identity(service_identity_id)
- rotated_from_service_credential_id
  → security.service_credential(service_credential_id)

Unique:

- credential_reference

Status:

- ACTIVE
- REVOKED
- EXPIRED

Check:

- expires_at IS NULL OR expires_at > valid_from

credential_reference contains no plaintext secret.

Controlled overlapping ACTIVE credentials are allowed for rotation.

PHYSICAL_SERVICE_CREDENTIAL_STORE remains UNDECIDED.

## 15. security.service_company_access

Columns:

- service_company_access_id uuid NOT NULL DEFAULT gen_random_uuid()
- service_identity_id uuid NOT NULL
- company_id uuid NOT NULL
- status text NOT NULL
- effective_from timestamptz NOT NULL DEFAULT now()
- effective_to timestamptz NULL
- created_at timestamptz NOT NULL DEFAULT now()
- updated_at timestamptz NOT NULL DEFAULT now()

Primary key:

- service_company_access_id

Foreign keys:

- service_identity_id
  → security.service_identity(service_identity_id)
- company_id
  → core.company(company_id)

Status:

- ACTIVE
- SUSPENDED
- ENDED

Rules:

- one simultaneously effective access relation per Service Identity/Company
- historical non-overlap allowed
- effective overlap prohibited
- overlap enforced by DEFERRABLE constraint trigger

## 16. security.service_role_assignment

Columns:

- service_role_assignment_id uuid NOT NULL DEFAULT gen_random_uuid()
- service_identity_id uuid NOT NULL
- service_company_access_id uuid NULL
- role_definition_id uuid NOT NULL
- status text NOT NULL DEFAULT 'ACTIVE'
- effective_from timestamptz NOT NULL DEFAULT now()
- effective_to timestamptz NULL
- granted_by_login_account_id uuid NULL
- created_at timestamptz NOT NULL DEFAULT now()
- updated_at timestamptz NOT NULL DEFAULT now()

Primary key:

- service_role_assignment_id

Foreign keys:

- service_identity_id
  → security.service_identity(service_identity_id)
- service_company_access_id
  → security.service_company_access(service_company_access_id)
- role_definition_id
  → security.role_definition(role_definition_id)
- granted_by_login_account_id
  → security.login_account(login_account_id)

Rules:

- only role_category=service
- company role requires service_company_access_id
- company access must belong to the same Service Identity
- company access must be ACTIVE and effective
- system role requires service_company_access_id IS NULL
- one open ACTIVE assignment per effective Service/Company/Role context
- overlapping effective assignment periods prohibited

## REQUIRED SUPPORTING INDEXES

Required index families include:

- login_identity_binding(login_account_id)
- login_identity_binding(authentication_provider_code,
  authentication_subject_reference)
- user_provisioning_request(company_id,status)
- authenticated_session(login_account_id,status)
- authenticated_session(authentication_provider_code,
  provider_session_reference)
- company_membership(login_account_id,status)
- company_membership(company_id,status)
- role_permission(role_definition_id,status)
- role_permission(permission_definition_id,status)
- login_account_role_assignment(login_account_id,status)
- membership_role_assignment(company_membership_id,status)
- permission_definition(module_code,resource_code,action_code)
- service_credential(service_identity_id,status)
- service_company_access(service_identity_id,company_id,status)
- service_role_assignment(service_identity_id,status)

## REQUIRED CONSTRAINT TRIGGERS

Constraint-trigger enforcement is required for:

- Membership temporal non-overlap
- Service Company Access temporal non-overlap
- Role/Permission temporal non-overlap
- human Role Assignment temporal non-overlap
- service Role Assignment temporal non-overlap
- role scope/category compatibility
- COMPANY_CUSTOM owner-company compatibility
- authenticated selected-company Membership validity
- final active COMPANY_SYSTEM_ADMIN protection

These functions reside in schema security, not public.

## AUTHORIZATION INVALIDATION

Human authorization_version increments when effective authorization may
change through:

- Login Account status
- Company Membership
- Login Account Role Assignment
- Membership Role Assignment
- effective Role Definition
- effective Role-Permission

Service authorization_version increments when effective authorization may
change through:

- Service Identity status
- Service Company Access
- Service Role Assignment
- effective service Role Definition
- effective Role-Permission

The version increment invalidates stale authorization snapshots.

# ERP LOGIN / AUTH PHYSICAL EXACTNESS V1

canonical_extension: ERP_LOGIN_AUTH_EXACT_DDL_PHYSICAL_EXACTNESS_V1

This section closes the physical exactness requirements for constraints,
referential actions, indexes, partial predicates, and text checks.

## EXACT FOREIGN KEY REFERENTIAL ACTION

Every canonical foreign key in the sixteen security authority tables uses:

ON UPDATE NO ACTION
ON DELETE NO ACTION
NOT DEFERRABLE INITIALLY IMMEDIATE

There are no foreign-key exceptions in this version.

In particular, no security authority FK uses ON DELETE CASCADE.

Lifecycle retirement is performed by governed status/effective-period
mutation rather than cascading physical deletion.

Constraint triggers described separately may be DEFERRABLE. This does not
change ordinary FK deferrability.

## EXACT CONSTRAINT NAME REGISTRY

### security.login_account

CONSTRAINT pk_login_account PRIMARY KEY
CONSTRAINT uq_login_account__norm_ident UNIQUE
CONSTRAINT ck_login_account__status CHECK
CONSTRAINT ck_login_account__norm_ident_nonblank CHECK
CONSTRAINT ck_login_account__auth_ver CHECK

Exact checks:

CHECK (btrim(normalized_login_identifier) <> '')
CHECK (btrim(login_identifier) <> '')
CHECK (status IN ('INVITED','ACTIVE','SUSPENDED','DISABLED'))
CHECK (authorization_version > 0)

### security.login_identity_binding

CONSTRAINT pk_login_identity_binding PRIMARY KEY
CONSTRAINT fk_lib__login_account FOREIGN KEY
CONSTRAINT uq_lib__provider_subject UNIQUE
CONSTRAINT ck_lib__status CHECK
CONSTRAINT ck_lib__provider_nonblank CHECK
CONSTRAINT ck_lib__subject_nonblank CHECK

FK:

login_account_id
REFERENCES security.login_account(login_account_id)
ON UPDATE NO ACTION
ON DELETE NO ACTION

Exact checks:

CHECK (binding_status IN ('ACTIVE','REVOKED'))
CHECK (btrim(authentication_provider_code) <> '')
CHECK (btrim(authentication_subject_reference) <> '')

### security.user_provisioning_request

CONSTRAINT pk_user_provisioning_request PRIMARY KEY
CONSTRAINT fk_upr__company FOREIGN KEY
CONSTRAINT fk_upr__requested_by FOREIGN KEY
CONSTRAINT fk_upr__approved_by FOREIGN KEY
CONSTRAINT fk_upr__rejected_by FOREIGN KEY
CONSTRAINT fk_upr__completed_account FOREIGN KEY
CONSTRAINT ck_upr__method CHECK
CONSTRAINT ck_upr__status CHECK
CONSTRAINT ck_upr__requested_ident_nonblank CHECK
CONSTRAINT ck_upr__norm_ident_nonblank CHECK
CONSTRAINT ck_upr__provider_ref_nonblank CHECK
CONSTRAINT ck_upr__expiry CHECK

All five FKs use ON UPDATE NO ACTION and ON DELETE NO ACTION.

Exact checks:

CHECK (provisioning_method IN ('APPLICATION','INVITATION','BOOTSTRAP'))
CHECK (status IN (
  'PENDING','APPROVED','REJECTED','EXPIRED','CANCELLED','COMPLETED'
))
CHECK (btrim(requested_login_identifier) <> '')
CHECK (btrim(normalized_requested_login_identifier) <> '')
CHECK (
  provider_invitation_reference IS NULL
  OR btrim(provider_invitation_reference) <> ''
)
CHECK (expires_at IS NULL OR expires_at > created_at)

### security.authenticated_session

CONSTRAINT pk_authenticated_session PRIMARY KEY
CONSTRAINT fk_as__login_account FOREIGN KEY
CONSTRAINT fk_as__selected_company FOREIGN KEY
CONSTRAINT uq_as__provider_session UNIQUE
CONSTRAINT ck_as__status CHECK
CONSTRAINT ck_as__provider_nonblank CHECK
CONSTRAINT ck_as__session_ref_nonblank CHECK
CONSTRAINT ck_as__auth_ver CHECK
CONSTRAINT ck_as__expiry CHECK

Both FKs use ON UPDATE NO ACTION and ON DELETE NO ACTION.

Exact checks:

CHECK (status IN ('ACTIVE','EXPIRED','REVOKED'))
CHECK (btrim(authentication_provider_code) <> '')
CHECK (btrim(provider_session_reference) <> '')
CHECK (authorization_version > 0)
CHECK (expires_at > issued_at)

### security.company_membership

CONSTRAINT pk_company_membership PRIMARY KEY
CONSTRAINT fk_cm__company FOREIGN KEY
CONSTRAINT fk_cm__login_account FOREIGN KEY
CONSTRAINT fk_cm__source_request FOREIGN KEY
CONSTRAINT ck_cm__status CHECK
CONSTRAINT ck_cm__period CHECK

All three FKs use ON UPDATE NO ACTION and ON DELETE NO ACTION.

Exact checks:

CHECK (status IN ('INVITED','ACTIVE','SUSPENDED','ENDED'))
CHECK (effective_to IS NULL OR effective_to > effective_from)

### security.login_account_preference

CONSTRAINT pk_login_account_preference PRIMARY KEY
CONSTRAINT fk_lap__login_account FOREIGN KEY
CONSTRAINT fk_lap__last_company FOREIGN KEY
CONSTRAINT ck_lap__language_nonblank CHECK
CONSTRAINT ck_lap__timezone_nonblank CHECK

Both FKs use ON UPDATE NO ACTION and ON DELETE NO ACTION.

Exact checks:

CHECK (
  preferred_language_code IS NULL
  OR btrim(preferred_language_code) <> ''
)
CHECK (
  preferred_time_zone IS NULL
  OR btrim(preferred_time_zone) <> ''
)

### security.company_auth_policy

CONSTRAINT pk_company_auth_policy PRIMARY KEY
CONSTRAINT fk_cap__company FOREIGN KEY
CONSTRAINT ck_cap__aal CHECK
CONSTRAINT ck_cap__status CHECK
CONSTRAINT ck_cap__idle_timeout CHECK
CONSTRAINT ck_cap__absolute_timeout CHECK
CONSTRAINT ck_cap__invitation_ttl CHECK

FK uses ON UPDATE NO ACTION and ON DELETE NO ACTION.

Exact checks:

CHECK (required_aal IN ('aal1','aal2'))
CHECK (status IN ('ACTIVE','DISABLED'))
CHECK (
  session_idle_timeout_seconds IS NULL
  OR session_idle_timeout_seconds > 0
)
CHECK (
  session_absolute_timeout_seconds IS NULL
  OR session_absolute_timeout_seconds > 0
)
CHECK (
  invitation_ttl_seconds IS NULL
  OR invitation_ttl_seconds > 0
)

### security.role_definition

CONSTRAINT pk_role_definition PRIMARY KEY
CONSTRAINT fk_rd__owner_company FOREIGN KEY
CONSTRAINT ck_rd__role_code_nonblank CHECK
CONSTRAINT ck_rd__role_name_nonblank CHECK
CONSTRAINT ck_rd__module_nonblank CHECK
CONSTRAINT ck_rd__scope CHECK
CONSTRAINT ck_rd__category CHECK
CONSTRAINT ck_rd__origin CHECK
CONSTRAINT ck_rd__status CHECK
CONSTRAINT ck_rd__origin_scope_owner CHECK

FK uses ON UPDATE NO ACTION and ON DELETE NO ACTION.

Exact checks:

CHECK (btrim(role_code) <> '')
CHECK (btrim(role_name) <> '')
CHECK (module_code IS NULL OR btrim(module_code) <> '')
CHECK (scope_type IN ('system','company'))
CHECK (role_category IN (
  'administrative','business','approval','audit','system','service'
))
CHECK (role_origin IN (
  'SYSTEM_BUILTIN','MODULE_BUILTIN','COMPANY_CUSTOM'
))
CHECK (status IN ('ACTIVE','DISABLED','DEPRECATED','RETIRED'))
CHECK (
  (
    role_origin = 'COMPANY_CUSTOM'
    AND scope_type = 'company'
    AND owner_company_id IS NOT NULL
  )
  OR
  (
    role_origin <> 'COMPANY_CUSTOM'
    AND owner_company_id IS NULL
  )
)

MODULE_BUILTIN additionally requires module_code IS NOT NULL and is
enforced by the role validation trigger.

### security.permission_definition

CONSTRAINT pk_permission_definition PRIMARY KEY
CONSTRAINT ck_pd__resource_nonblank CHECK
CONSTRAINT ck_pd__action_nonblank CHECK
CONSTRAINT ck_pd__module_nonblank CHECK
CONSTRAINT ck_pd__status CHECK

Exact checks:

CHECK (btrim(resource_code) <> '')
CHECK (btrim(action_code) <> '')
CHECK (module_code IS NULL OR btrim(module_code) <> '')
CHECK (status IN ('ACTIVE','DISABLED','DEPRECATED','RETIRED'))

### security.role_permission

CONSTRAINT pk_role_permission PRIMARY KEY
CONSTRAINT fk_rp__role FOREIGN KEY
CONSTRAINT fk_rp__permission FOREIGN KEY
CONSTRAINT fk_rp__granted_by FOREIGN KEY
CONSTRAINT ck_rp__status CHECK
CONSTRAINT ck_rp__period CHECK

All three FKs use ON UPDATE NO ACTION and ON DELETE NO ACTION.

Exact checks:

CHECK (status IN ('ACTIVE','ENDED'))
CHECK (effective_to IS NULL OR effective_to > effective_from)

### security.login_account_role_assignment

CONSTRAINT pk_login_account_role_assignment PRIMARY KEY
CONSTRAINT fk_lara__login_account FOREIGN KEY
CONSTRAINT fk_lara__role FOREIGN KEY
CONSTRAINT fk_lara__granted_by FOREIGN KEY
CONSTRAINT ck_lara__status CHECK
CONSTRAINT ck_lara__period CHECK

All three FKs use ON UPDATE NO ACTION and ON DELETE NO ACTION.

Exact checks:

CHECK (status IN ('ACTIVE','ENDED'))
CHECK (effective_to IS NULL OR effective_to > effective_from)

### security.membership_role_assignment

CONSTRAINT pk_membership_role_assignment PRIMARY KEY
CONSTRAINT fk_mra__membership FOREIGN KEY
CONSTRAINT fk_mra__role FOREIGN KEY
CONSTRAINT fk_mra__granted_by FOREIGN KEY
CONSTRAINT ck_mra__status CHECK
CONSTRAINT ck_mra__period CHECK

All three FKs use ON UPDATE NO ACTION and ON DELETE NO ACTION.

Exact checks:

CHECK (status IN ('ACTIVE','ENDED'))
CHECK (effective_to IS NULL OR effective_to > effective_from)

### security.service_identity

CONSTRAINT pk_service_identity PRIMARY KEY
CONSTRAINT uq_si__service_code UNIQUE
CONSTRAINT ck_si__service_code_nonblank CHECK
CONSTRAINT ck_si__display_name_nonblank CHECK
CONSTRAINT ck_si__type CHECK
CONSTRAINT ck_si__status CHECK
CONSTRAINT ck_si__auth_ver CHECK

Exact checks:

CHECK (btrim(service_code) <> '')
CHECK (btrim(display_name) <> '')
CHECK (service_identity_type IN ('AI_WORKER','SERVICE'))
CHECK (
  status IN ('PROVISIONED','ACTIVE','SUSPENDED','DISABLED','RETIRED')
)
CHECK (authorization_version > 0)

### security.service_credential

CONSTRAINT pk_service_credential PRIMARY KEY
CONSTRAINT fk_sc__identity FOREIGN KEY
CONSTRAINT fk_sc__rotated_from FOREIGN KEY
CONSTRAINT uq_sc__credential_ref UNIQUE
CONSTRAINT ck_sc__type_nonblank CHECK
CONSTRAINT ck_sc__ref_nonblank CHECK
CONSTRAINT ck_sc__status CHECK
CONSTRAINT ck_sc__period CHECK
CONSTRAINT ck_sc__not_self_rotated CHECK

Both FKs use ON UPDATE NO ACTION and ON DELETE NO ACTION.

Exact checks:

CHECK (btrim(credential_type) <> '')
CHECK (btrim(credential_reference) <> '')
CHECK (status IN ('ACTIVE','REVOKED','EXPIRED'))
CHECK (expires_at IS NULL OR expires_at > valid_from)
CHECK (
  rotated_from_service_credential_id IS NULL
  OR rotated_from_service_credential_id <> service_credential_id
)

### security.service_company_access

CONSTRAINT pk_service_company_access PRIMARY KEY
CONSTRAINT fk_sca__identity FOREIGN KEY
CONSTRAINT fk_sca__company FOREIGN KEY
CONSTRAINT ck_sca__status CHECK
CONSTRAINT ck_sca__period CHECK

Both FKs use ON UPDATE NO ACTION and ON DELETE NO ACTION.

Exact checks:

CHECK (status IN ('ACTIVE','SUSPENDED','ENDED'))
CHECK (effective_to IS NULL OR effective_to > effective_from)

### security.service_role_assignment

CONSTRAINT pk_service_role_assignment PRIMARY KEY
CONSTRAINT fk_sra__identity FOREIGN KEY
CONSTRAINT fk_sra__company_access FOREIGN KEY
CONSTRAINT fk_sra__role FOREIGN KEY
CONSTRAINT fk_sra__granted_by FOREIGN KEY
CONSTRAINT ck_sra__status CHECK
CONSTRAINT ck_sra__period CHECK

All four FKs use ON UPDATE NO ACTION and ON DELETE NO ACTION.

Exact checks:

CHECK (status IN ('ACTIVE','ENDED'))
CHECK (effective_to IS NULL OR effective_to > effective_from)

## EXACT INDEX REGISTRY AND PARTIAL PREDICATES

CREATE INDEX ix_lib__login_account
ON security.login_identity_binding(login_account_id);

CREATE UNIQUE INDEX ux_lib__active_account_provider
ON security.login_identity_binding(
  login_account_id,
  authentication_provider_code
)
WHERE binding_status = 'ACTIVE';

CREATE UNIQUE INDEX ux_lib__active_primary_account
ON security.login_identity_binding(login_account_id)
WHERE binding_status = 'ACTIVE' AND is_primary = true;

CREATE INDEX ix_upr__company_status
ON security.user_provisioning_request(company_id,status);

CREATE UNIQUE INDEX ux_upr__open_company_identifier
ON security.user_provisioning_request(
  company_id,
  normalized_requested_login_identifier
)
WHERE status IN ('PENDING','APPROVED');

CREATE INDEX ix_as__account_status
ON security.authenticated_session(login_account_id,status);

CREATE INDEX ix_cm__account_status
ON security.company_membership(login_account_id,status);

CREATE INDEX ix_cm__company_status
ON security.company_membership(company_id,status);

CREATE UNIQUE INDEX ux_cm__open_company_account
ON security.company_membership(company_id,login_account_id)
WHERE
  effective_to IS NULL
  AND status IN ('INVITED','ACTIVE','SUSPENDED');

CREATE UNIQUE INDEX ux_rd__builtin_role_code
ON security.role_definition(role_code)
WHERE owner_company_id IS NULL;

CREATE UNIQUE INDEX ux_rd__company_role_code
ON security.role_definition(owner_company_id,role_code)
WHERE owner_company_id IS NOT NULL;

CREATE UNIQUE INDEX ux_pd__global_resource_action
ON security.permission_definition(resource_code,action_code)
WHERE module_code IS NULL;

CREATE UNIQUE INDEX ux_pd__module_resource_action
ON security.permission_definition(module_code,resource_code,action_code)
WHERE module_code IS NOT NULL;

CREATE INDEX ix_rp__role_status
ON security.role_permission(role_definition_id,status);

CREATE INDEX ix_rp__permission_status
ON security.role_permission(permission_definition_id,status);

CREATE UNIQUE INDEX ux_rp__open_role_permission
ON security.role_permission(
  role_definition_id,
  permission_definition_id
)
WHERE status = 'ACTIVE' AND effective_to IS NULL;

CREATE INDEX ix_lara__account_status
ON security.login_account_role_assignment(login_account_id,status);

CREATE UNIQUE INDEX ux_lara__open_account_role
ON security.login_account_role_assignment(
  login_account_id,
  role_definition_id
)
WHERE status = 'ACTIVE' AND effective_to IS NULL;

CREATE INDEX ix_mra__membership_status
ON security.membership_role_assignment(company_membership_id,status);

CREATE UNIQUE INDEX ux_mra__open_membership_role
ON security.membership_role_assignment(
  company_membership_id,
  role_definition_id
)
WHERE status = 'ACTIVE' AND effective_to IS NULL;

CREATE INDEX ix_sc__identity_status
ON security.service_credential(service_identity_id,status);

CREATE INDEX ix_sca__identity_company_status
ON security.service_company_access(
  service_identity_id,
  company_id,
  status
);

CREATE UNIQUE INDEX ux_sca__open_identity_company
ON security.service_company_access(service_identity_id,company_id)
WHERE
  effective_to IS NULL
  AND status IN ('ACTIVE','SUSPENDED');

CREATE INDEX ix_sra__identity_status
ON security.service_role_assignment(service_identity_id,status);

CREATE UNIQUE INDEX ux_sra__open_system_role
ON security.service_role_assignment(
  service_identity_id,
  role_definition_id
)
WHERE
  status = 'ACTIVE'
  AND effective_to IS NULL
  AND service_company_access_id IS NULL;

CREATE UNIQUE INDEX ux_sra__open_company_role
ON security.service_role_assignment(
  service_identity_id,
  service_company_access_id,
  role_definition_id
)
WHERE
  status = 'ACTIVE'
  AND effective_to IS NULL
  AND service_company_access_id IS NOT NULL;

## CONSTRAINT / INDEX NAME STABILITY

The names defined above are canonical physical names.

04 migration SQL must use these names exactly unless a later canonical
design change explicitly supersedes them.

Implicit PostgreSQL indexes created by PRIMARY KEY or UNIQUE constraints
use their canonical constraint names.

No implementation may generate environment-specific names for these
canonical objects.

# ERP LOGIN / AUTH SEMANTIC EXACTNESS CLOSURE V1

canonical_extension: ERP_LOGIN_AUTH_EXACT_DDL_SEMANTIC_CLOSURE_V1

This section closes the remaining exact physical semantic gaps without
changing the sixteen-table authority model.

## LOGIN IDENTIFIER CHECK NAME

The previously specified Login Account nonblank identifier check has the
following canonical physical name:

CONSTRAINT ck_login_account__ident_nonblank
CHECK (btrim(login_identifier) <> '')

The normalized identifier check remains:

CONSTRAINT ck_login_account__norm_ident_nonblank
CHECK (btrim(normalized_login_identifier) <> '')

Both checks are required.

## ROLE DEFINITION ADDITIONAL EXACT CHECKS

The MODULE_BUILTIN module association rule is enforced physically by:

CONSTRAINT ck_rd__module_origin
CHECK (
  role_origin <> 'MODULE_BUILTIN'
  OR module_code IS NOT NULL
)

The COMPANY_CUSTOM reserved common-role protection is enforced physically
by:

CONSTRAINT ck_rd__reserved_custom_code
CHECK (
  role_origin <> 'COMPANY_CUSTOM'
  OR upper(btrim(role_code)) NOT IN (
    'COMPANY_SYSTEM_ADMIN',
    'COMPANY_ADMIN',
    'COMPANY_STAFF'
  )
)

This protection is case-insensitive with respect to attempted custom-role
creation.

Therefore a Company Custom Role cannot evade the reserved-role boundary
through letter-case variation.

These checks complement, and do not replace:

- ck_rd__role_code_nonblank;
- ck_rd__module_nonblank;
- ck_rd__scope;
- ck_rd__category;
- ck_rd__origin;
- ck_rd__status;
- ck_rd__origin_scope_owner.

## AUTHORIZATION PROPAGATION REVERSE INDEXES

Role Definition and Role-Permission invalidation must efficiently find
every principal currently assigned the affected Role.

The following additional physical indexes are canonical:

CREATE INDEX ix_lara__role_status
ON security.login_account_role_assignment(
  role_definition_id,
  status
);

CREATE INDEX ix_mra__role_status
ON security.membership_role_assignment(
  role_definition_id,
  status
);

CREATE INDEX ix_sra__role_status
ON security.service_role_assignment(
  role_definition_id,
  status
);

These indexes support the reverse authorization propagation paths:

role_definition
→ login_account_role_assignment
→ login_account

role_definition
→ membership_role_assignment
→ company_membership
→ login_account

role_definition
→ service_role_assignment
→ service_identity.

They do not themselves define authorization semantics.
