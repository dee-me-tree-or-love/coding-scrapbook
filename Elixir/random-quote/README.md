# random-quote

A sample Elixir based API returning random quotes.

> For if your day misses some random inpsiration :v:

## API

### GET: `/health`

Checks if the server is running ok.

Content: `<text/html>`

Body example:

```json
ok.
```

### GET: `/quote/random`

Returns a random quote.

Content: `<application/json>`

Body example:

```json
{
  "item": {
    "content": "Man, when you lose your laugh you lose your footing.",
    "author": "Ken Kesey",
    "source": "One Flew Over the Cuckoo's Nest"
  }
}
```
