# 52.master-data Fake-Mode API Server Design

Generated: 2026-08-03 11:56:29 +0900

## Purpose

Provide a local HTTP server that exercises the fake-mode route module using API-like requests.

## Server File

- /data/data/com.termux/files/home/04.ERP-development/52.master-data/api/master-data-api-fake-mode-server.mjs

## Default Port

- 8921

Override with:

- ERP_52_MASTER_DATA_FAKE_MODE_PORT

## Response

The server returns JSON envelopes with:

- status_code
- ok
- result_code
- data
- meta

## Safety

The server imports only the fake-mode route module. It does not open database connections.
