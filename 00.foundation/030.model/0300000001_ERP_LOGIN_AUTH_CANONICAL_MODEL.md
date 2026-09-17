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
