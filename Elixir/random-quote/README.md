# random-quote

A sample Elixir based API returning random quotes.

> For if your day misses some random inpsiration :v:

## API

### GET: `/health`

Checks if the server is running ok.

Content: `<text/html>`

Body example:

```plaintext
ok.
```

### GET: `/quote/random`

Returns a random quote.

Content: `<application/json>`

Body example:

```json
{
  "item": {
    "uid": 112,
    "content": "Man, when you lose your laugh you lose your footing.",
    "origin": "McMurphy",
    "source": {
      "title": "One Flew Over the Cuckoo's Nest",
      "author": "Ken Kesey"
    }
  }
}
```

## Development

### Install dependencies

`mix deps`

### Starting the server

`mix run --no-halt`
