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
