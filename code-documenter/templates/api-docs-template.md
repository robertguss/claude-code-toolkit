# API Reference

## Overview

[Brief description of the API]

**Base URL:** `https://api.example.com`  
**Current Version:** `v1`  
**Format:** JSON

## Authentication

[How to authenticate]

```http
Authorization: Bearer YOUR_API_KEY
```

See [Authentication Guide](./authentication.md) for details.

## Rate Limiting

[Rate limit policy]

**Limits:**
- Requests per hour: [number]
- Requests per day: [number]

**Headers:**
```http
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 742
X-RateLimit-Reset: 1641654000
```

## Endpoints

### [Resource Name]

#### List [Resources]

`GET /api/[resource]`

Retrieves a paginated list of [resources].

**Query Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| page | integer | No | 1 | Page number |
| limit | integer | No | 20 | Items per page |
| sort | string | No | created_at | Sort field |
| order | string | No | desc | Sort order (asc/desc) |

**Response:** `200 OK`

```json
{
  "data": [
    {
      "id": "123",
      "field": "value"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 100
  }
}
```

**Example:**

```bash
curl -H "Authorization: Bearer TOKEN" \
  "https://api.example.com/api/resource?page=1&limit=10"
```

**Errors:**
- `401 Unauthorized`: Invalid or missing token
- `429 Too Many Requests`: Rate limit exceeded

---

#### Get [Resource]

`GET /api/[resource]/:id`

Retrieves a single [resource] by ID.

**Path Parameters:**
- `id` (required): Resource ID

**Response:** `200 OK`

```json
{
  "id": "123",
  "field": "value",
  "created_at": "2025-01-10T14:30:00Z"
}
```

**Example:**

```bash
curl -H "Authorization: Bearer TOKEN" \
  https://api.example.com/api/resource/123
```

**Errors:**
- `401 Unauthorized`: Invalid or missing token
- `404 Not Found`: Resource does not exist

---

#### Create [Resource]

`POST /api/[resource]`

Creates a new [resource].

**Request Body:**

```json
{
  "field1": "value1",
  "field2": "value2"
}
```

**Fields:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| field1 | string | Yes | Description |
| field2 | integer | No | Description |

**Response:** `201 Created`

```json
{
  "id": "124",
  "field1": "value1",
  "field2": "value2",
  "created_at": "2025-01-10T14:30:00Z"
}
```

**Example:**

```bash
curl -X POST \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"field1":"value1"}' \
  https://api.example.com/api/resource
```

**Errors:**
- `400 Bad Request`: Invalid request body
- `401 Unauthorized`: Invalid or missing token
- `422 Unprocessable Entity`: Validation failed

---

#### Update [Resource]

`PATCH /api/[resource]/:id`

Updates an existing [resource].

**Path Parameters:**
- `id` (required): Resource ID

**Request Body:**

```json
{
  "field1": "new value"
}
```

**Response:** `200 OK`

```json
{
  "id": "123",
  "field1": "new value",
  "updated_at": "2025-01-10T15:00:00Z"
}
```

**Example:**

```bash
curl -X PATCH \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"field1":"new value"}' \
  https://api.example.com/api/resource/123
```

**Errors:**
- `400 Bad Request`: Invalid request body
- `401 Unauthorized`: Invalid or missing token
- `404 Not Found`: Resource does not exist
- `422 Unprocessable Entity`: Validation failed

---

#### Delete [Resource]

`DELETE /api/[resource]/:id`

Deletes a [resource].

**Path Parameters:**
- `id` (required): Resource ID

**Response:** `204 No Content`

**Example:**

```bash
curl -X DELETE \
  -H "Authorization: Bearer TOKEN" \
  https://api.example.com/api/resource/123
```

**Errors:**
- `401 Unauthorized`: Invalid or missing token
- `404 Not Found`: Resource does not exist

---

## Error Responses

All error responses follow this format:

```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human-readable message",
    "details": {
      "field": "Additional context"
    }
  }
}
```

### Error Codes

| Code | HTTP Status | Description |
|------|-------------|-------------|
| UNAUTHORIZED | 401 | Invalid or missing authentication |
| FORBIDDEN | 403 | Insufficient permissions |
| NOT_FOUND | 404 | Resource not found |
| VALIDATION_ERROR | 422 | Request validation failed |
| RATE_LIMIT | 429 | Too many requests |
| SERVER_ERROR | 500 | Internal server error |

## Webhooks

[If applicable]

[Describe webhook system]

## SDKs and Libraries

[If available]

- [JavaScript SDK](link)
- [Python SDK](link)
- [Other languages](link)
