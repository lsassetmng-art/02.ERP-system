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
