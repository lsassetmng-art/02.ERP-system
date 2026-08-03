# 52.master-data Application Service Wrapper Design

Generated: 2026-08-02 22:16:33 +0900

## Purpose

Provide an application service wrapper that depends on repository shape, not infrastructure details.

## Rule

Routes should call service methods.

Services should call repository methods.

Repository implementation may be fake now and DB-backed later.

## Current Implementation

The generated service wrapper accepts a repository instance and delegates operations.

It is no-DB and does not import any DB driver.
