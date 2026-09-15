# ERP LOGIN / AUTH CONSTITUTION

document_status: canonical
canonical_owner: 00.foundation
scope: ERP human-user authentication and authorization foundation

## 1. Purpose

This document defines the constitutional ownership and non-negotiable
boundaries for ERP login, authentication, session, authorization,
and company access context.

## 2. Canonical ownership

00.foundation owns:

- ERP login account identity
- authentication contract
- authenticated session contract
- logout and session termination
- company membership used for ERP access
- authorization role and permission framework
- current authenticated user context
- current authorized company context
- login security policy
- login UI and authentication API contract

Business modules consume this authority and must not create competing
login or authorization truth.

## 3. Identity separation

The following objects are distinct:

- ERP login account
- human person
- HR employee
- business partner
- master-data record
- company
- service/API client

Canonical rules:

- LOGIN_ACCOUNT != PERSON
- LOGIN_ACCOUNT != EMPLOYEE
- LOGIN_ACCOUNT != MASTER_DATA_RECORD
- LOGIN_ACCOUNT != BUSINESS_PARTNER
- LOGIN_ACCOUNT != SERVICE_CLIENT

A login account may reference a person or employee where required,
but such a reference does not transfer ownership of person or employee truth.

## 4. Master Data boundary

52.master-data owns shared business identity and reference truth.

52.master-data does not own:

- login passwords
- login credentials
- authentication sessions
- login account lifecycle
- role assignment for ERP access
- company access membership

ERP login credentials must not be stored in master-data business tables.

## 5. Company boundary

Authentication does not own company business identity.

Authorization may reference the current accepted company authority through
company_id for:

- company membership
- company-scoped role assignment
- current company context

This change unit does not relocate or redesign company master authority.

## 6. Authentication before authorization

Authorization without authenticated identity is prohibited.

The sequence is:

1. establish login account identity
2. authenticate the account
3. establish an authenticated session
4. resolve active company membership
5. establish current company context where required
6. resolve role and permission
7. permit or deny the requested ERP operation

## 7. Default access posture

ERP authorization is deny-by-default.

Absence of an applicable active permission is denial.

Client-provided company_id, role, permission, or user identity must never be
accepted as authorization truth without server-side validation.

## 8. Offline boundary

New authentication while offline is prohibited.

If connectivity is lost after successful authentication:

- no new login may be established
- no company switch may be authorized
- no privilege elevation may occur
- no account or permission mutation may occur
- locally queued business writes remain non-authoritative intents
- queued work must be revalidated after connectivity returns

## 9. Provider neutrality

This canonical layer does not select a physical authentication provider.

The following remain implementation decisions until separately accepted:

- internal credential store
- external identity provider
- Supabase Auth or other provider
- physical auth schema
- physical token implementation

Logical contracts in this foundation remain authoritative regardless of provider.

## 10. Audit requirement

Security-significant events must be auditable, including:

- login success
- login failure
- logout
- session revocation
- account lock/suspension/disable
- credential change/reset
- company context switch
- membership change
- role assignment change
- permission change

## 11. Permission ownership boundary

00.foundation owns the common ERP security framework:

- authentication identity and session framework
- company membership framework
- role and permission framework
- role-assignment mechanics
- permission resolution contract
- authorization enforcement contract

Each business module owns its own business permission semantics, including:

- resource_code meaning
- action_code meaning
- module-specific permission meaning
- which business operations require which permissions

Business modules must not redefine Login Account, authenticated session,
company membership, or the common role-assignment framework.

Foundation must not take ownership of source-module business permission meaning.

## 12. Audit ownership boundary

00.foundation owns authentication/security operational source truth, including:

- occurrence of authentication and authorization security events
- required security event categories
- security-event emission contract

51.audit owns:

- audit evidence truth
- audit finding truth
- remediation/conclusion truth
- immutable historical audit evidence

51.audit must not replace current authentication/security operational truth.

00.foundation must not create competing audit-evidence authority.

## 13. Phase gate

P1 Procurement Quantity remains HOLD until the ERP login/authentication
foundation has been designed, implemented, validated, and accepted.
