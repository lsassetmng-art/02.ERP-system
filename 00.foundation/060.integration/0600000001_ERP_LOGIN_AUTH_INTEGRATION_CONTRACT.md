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

## Canonical extension: actor and company context integration

All protected internal ERP integrations consume a trusted
execution_actor_context.

The context distinguishes:

- HUMAN actor
- SERVICE actor
- selected/authorized company
- initiating human requester when applicable

integration.my_company_id() remains an interface boundary.

It must resolve company context from trusted authenticated and authorized
execution context.

It must not:

- accept untrusted client company_id as authority
- choose an arbitrary company when multiple companies are available
- infer Service Identity access from a human Company Membership
- collapse Service Identity into Login Account identity

Service integrations must propagate Service Identity and requested_by
attribution without exposing raw credentials.

Module APIs consume permissions from the common authorization framework while
the source module remains authority for its own permission semantics.

# PHYSICAL AUTH PROVIDER AND CONTEXT INTEGRATION CONTRACT

canonical_extension: ERP_LOGIN_AUTH_PHYSICAL_AUTHORITY_USER_ROLE_LIFECYCLE_V1

## SUPABASE AUTH CONTRACT

Supabase Auth is the selected authentication provider.

Provider-managed auth schema is auth.

ERP consumes trusted provider identity/session evidence.

ERP does not treat auth.users as the ERP Login Account table.

Provider administrative credentials must remain server-side and must not
be exposed to an ERP browser client.

## UID BINDING CONTRACT

Trusted provider UID
→ security.login_identity_binding
→ security.login_account.

The provider UID is not assigned by a company administrator.

(authentication_provider_code, authentication_subject_reference) is
globally unique within active provider bindings.

## COMPANY CONTEXT CONTRACT

integration.my_company_id() remains an integration-facing compatibility
interface.

It must ultimately resolve company identity from trusted ERP
authenticated/authorized company context.

It must not:

- choose an arbitrary membership;
- use LIMIT 1 as company selection policy;
- trust an unvalidated client company_id;
- derive company solely from provider UID;
- collapse Service Identity into human Login Account.

The internal security authority for selected company context is
security.authenticated_session for human sessions or the corresponding
trusted service execution context for Service Identity.

## COMPANY MEMBERSHIP CONTRACT

Company authorization uses security.company_membership.

core.company remains the Company authority.

Legacy core.company_users does not become canonical membership authority.

## USER PROVISIONING INTEGRATION

Application and invitation workflows integrate with the provider only
through controlled server-side operations.

Raw invite/recovery/password/MFA secrets are not ERP integration payloads
or audit values.

Provider account creation or existence does not automatically create
company access.

## LANGUAGE CONTRACT

UI language uses a governed supported BCP 47 language/locale registry.

Initial required language support may include:

- ja-jp;
- en-us.

The registry is extensible.

Browser/device language may be used only as an initial suggestion when no
governed preference exists.

Browser/device language is not canonical preference authority.

## TIME-ZONE CONTRACT

User preferred time zone uses an IANA time-zone identifier.

User display time zone and company business time zone remain separate
concerns.

## CURRENCY CONTRACT

Locale/language must not infer canonical accounting currency,
company base currency, or document currency.

## PUBLIC SCHEMA CONTRACT

No Login/Auth source-of-truth table, routine, credential object,
session object, membership object, role object, or service identity object
may be created in public.

The existing global public-schema policy remains:

ordinary read-only views only.
