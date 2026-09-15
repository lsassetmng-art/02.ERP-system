# ERP LOGIN / AUTH INTEGRATION CONTRACT

document_status: canonical
canonical_owner: 00.foundation

## 1. Purpose

Defines the interface between authentication/authorization foundation
and ERP business/integration modules.

## 2. Current authenticated user

Canonical interface concept:

current_authenticated_login_account

It resolves the active Login Account from trusted authenticated session state.

Business modules must not determine current user from arbitrary client payload.

## 3. Current company

Canonical interface concept:

current_authorized_company

It resolves the current company only after:

- valid authenticated session
- active Login Account
- active company membership
- validated current company selection

## 4. integration.my_company_id()

integration.my_company_id() is preserved as an ERP interface boundary.

Canonical requirements:

- it consumes trusted current company context
- it must not accept browser-supplied company_id as sole authority
- company-scoped consumers must fail closed without valid context
- it does not own company business identity
- it does not authenticate the user by itself

This change unit does not replace or mutate the existing physical function.

## 5. Business-module consumption

Business modules may consume:

- login_account_id as actor/security identity
- current authorized company
- resolved permissions
- audit actor context

Business modules must not own:

- password verification
- session creation
- session token issuance
- login account credential secrets

## 6. HR integration

HR Employee and ERP Login Account remain separate.

Possible relationship:

employee -> optional login_account reference
or
login_account -> optional employee reference

The final physical direction is deferred.

Employment termination must not be assumed to equal account deletion.
Account access state must be explicitly governed.

## 7. Master Data integration

Master Data may expose business identities referenced after authentication,
but does not authenticate login users.

## 8. External API boundary

External API authentication and connector authentication are separate
security subjects unless explicitly mapped to a human Login Account.

Human browser session credentials must not be reused as connector secrets.

## 9. Business permission ownership boundary

00.foundation owns:

- common permission identity
- common role and assignment framework
- permission resolution
- authorization enforcement contract

Each source business module owns:

- its resource_code semantics
- its action_code semantics
- module-specific permission semantics
- the mapping from business operations to required permissions

A source module must not create competing authentication, session,
company-membership, or common role-assignment truth.

## 10. Audit ownership boundary

Authentication/security operational events originate from the
00.foundation security source domain.

51.audit owns audit evidence truth derived or captured for audit purposes,
including immutable historical audit evidence, findings, and conclusions.

The boundary is:

security operational source truth -> 00.foundation
audit evidence truth -> 51.audit

51.audit does not overwrite current authentication/security source truth.

00.foundation does not own competing audit-evidence truth.

## 11. Audit integration

Security audit evidence must identify where available:

- login_account_id
- company_id
- session reference
- operation
- outcome
- timestamp
- security event category

Credential secret values are prohibited from audit payloads.
