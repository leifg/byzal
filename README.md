# Byzal

Byzal is named after the [Byzal Canyon](http://starwars.wikia.com/wiki/Byzal_canyon) in the Star Wars universe. It's a simple Echo service (I assume canyons have a lot of echo).

Every request you make will answer with all the details about this request in JSON.

## Examples:

```
GET /
```

```json
{
  "scheme": "http",
  "query_params": {},
  "path": "/",
  "method": "GET",
  "host": "localhost",
  "headers": {
    "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36",
    "upgrade-insecure-requests": "1",
    "host": "localhost:4000",
    "connection": "keep-alive",
    "accept-language": "en-US,en;q=0.8,de;q=0.6",
    "accept-encoding": "gzip, deflate, sdch",
    "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
  },
  "body_params": {}
}
```

```
GET /search?term=true_love
```

```json
{
  "scheme": "http",
  "query_params": {
    "term": "true_love"
  },
  "path": "/search",
  "method": "GET",
  "host": "localhost",
  "headers": {
    "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36",
    "upgrade-insecure-requests": "1",
    "host": "localhost:4000",
    "connection": "keep-alive",
    "accept-language": "en-US,en;q=0.8,de;q=0.6",
    "accept-encoding": "gzip, deflate, sdch",
    "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
  },
  "body_params": {}
}
```

## Limitations

Currently the followin HTTP methods are supported:

  - GET
  - POST
  - PUT
  - PATCH
  - DELETE
  - OPTIONS
  - CONNECT
  - TRACE

HEAD is not supported as for some reason a HEAD request always returns an empty body.
