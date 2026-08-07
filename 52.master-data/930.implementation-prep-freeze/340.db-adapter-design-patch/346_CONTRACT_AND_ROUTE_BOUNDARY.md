# 52.master-data Contract and Route Boundary

Generated: 2026-08-06 18:30:44 +0900

## Contract Boundary

The DB adapter candidate is not yet wired into:

- repository factory
- repository service
- route service
- API server

## Activation Boundary

Routes must not call SQL directly.
Routes should continue to call the service layer.
The service layer should call repository contract-compatible implementations.

## Required Future Step

A separate acceptance phase must review whether the candidate should be adapted to the exact repository contract before factory activation.
